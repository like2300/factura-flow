#!/usr/bin/env python3
"""
Convert PNG logo to ICNS icon with rounded corners
"""

import os
import subprocess
from pathlib import Path

# Paths
logo_png = Path(__file__).parent / "icons" / "logo.png"
iconset_dir = Path(__file__).parent / "icons" / "icon.iconset"

# Icon sizes for macOS
sizes = [
    (16, 16),
    (32, 32),
    (64, 64),
    (128, 128),
    (256, 256),
    (512, 512),
    (1024, 1024),
]

# Create iconset directory
iconset_dir.mkdir(exist_ok=True)

print("🎨 Converting logo to ICNS with rounded corners...")

# Generate all sizes with rounded corners
for width, height in sizes:
    output = iconset_dir / f"icon_{width}x{height}.png"
    print(f"  Creating {width}x{height} with rounded corners...")
    
    # Calculate corner radius (15% of size for smooth rounded corners)
    radius = int(width * 0.20)
    
    # Create rounded icon using sips and mask
    subprocess.run([
        'sips', '-z', str(height), str(width),
        str(logo_png),
        '--out', str(output)
    ], check=True, capture_output=True)
    
    # Apply rounded corners using Python/PIL if available, or skip
    try:
        from PIL import Image, ImageDraw, ImageFilter
        
        # Open the image
        img = Image.open(output).convert("RGBA")
        img = img.resize((width, height), Image.Resampling.LANCZOS)
        
        # Create a mask with rounded corners
        mask = Image.new('L', (width, height), 0)
        draw = ImageDraw.Draw(mask)
        
        # Draw rounded rectangle
        draw.rounded_rectangle([(0, 0), (width, height)], radius=radius, fill=255)
        
        # Apply the mask
        img.putalpha(mask)
        
        # Save with transparency
        img.save(output, 'PNG')
        
    except ImportError:
        print(f"    (PIL not available, keeping square corners for {width}x{height})")
    
    # Also create @2x versions for Retina
    if width <= 512:
        retina_width = width * 2
        retina_height = height * 2
        output_retina = iconset_dir / f"icon_{width}x{height}@2x.png"
        
        subprocess.run([
            'sips', '-z', str(retina_height), str(retina_width),
            str(logo_png),
            '--out', str(output_retina)
        ], check=True, capture_output=True)
        
        # Apply rounded corners to retina version too
        try:
            from PIL import Image, ImageDraw
            
            img = Image.open(output_retina).convert("RGBA")
            img = img.resize((retina_width, retina_height), Image.Resampling.LANCZOS)
            
            mask = Image.new('L', (retina_width, retina_height), 0)
            draw = ImageDraw.Draw(mask)
            draw.rounded_rectangle([(0, 0), (retina_width, retina_height)], radius=radius*2, fill=255)
            
            img.putalpha(mask)
            img.save(output_retina, 'PNG')
            
        except ImportError:
            pass

# Convert to ICNS
print("  Creating ICNS file...")
subprocess.run([
    'iconutil', '-c', 'icns',
    str(iconset_dir),
    '-o', str(Path(__file__).parent / 'icons' / 'icon.icns')
], check=True)

# Cleanup iconset
import shutil
shutil.rmtree(iconset_dir)

print("✅ ICNS icon created: icons/icon.icns")
print("✨ Icon has rounded corners!")
