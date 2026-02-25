#!/usr/bin/env python3
"""
Convert PNG logo to Windows ICO icon
"""

import os
from pathlib import Path

try:
    from PIL import Image
except ImportError:
    print("❌ PIL/Pillow not installed!")
    print("Run: pip install Pillow")
    exit(1)

# Paths
logo_png = Path(__file__).parent / "icons" / "logo.png"
icon_ico = Path(__file__).parent / "icons" / "icon.ico"

print("🎨 Converting logo to Windows ICO...")

# Open the logo
img = Image.open(logo_png)

# Convert to RGBA if needed
if img.mode != 'RGBA':
    img = img.convert('RGBA')

# Add rounded corners (optional)
width, height = img.size
radius = int(width * 0.20)

# Create mask for rounded corners
mask = Image.new('L', (width, height), 0)
from PIL import ImageDraw
draw = ImageDraw.Draw(mask)
draw.rounded_rectangle([(0, 0), (width, height)], radius=radius, fill=255)

img.putalpha(mask)

# Save as ICO with multiple sizes
sizes = [(16, 16), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)]

# Resize and save
img.save(icon_ico, format='ICO', sizes=sizes)

print(f"✅ Windows ICO icon created: {icon_ico}")
