@echo off
REM Build script for Factura Flow Windows application

echo ========================================
echo  Factura Flow - Windows Build
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://python.org
    pause
    exit /b 1
)

REM Activate virtual environment
if exist "env\Scripts\activate.bat" (
    echo Activating virtual environment...
    call env\Scripts\activate.bat
) else (
    echo Creating virtual environment...
    python -m venv env
    call env\Scripts\activate.bat
)

REM Install dependencies
echo.
echo Installing dependencies...
pip install -q -r requirements.txt
pip install -q pyinstaller pillow

REM Clean previous builds
echo.
echo Cleaning previous builds...
rmdir /s /q build 2>nul
rmdir /s /q dist 2>nul
del /q "Factura Flow.spec" 2>nul

REM Build with PyInstaller
echo.
echo Building Factura Flow.exe...
pyinstaller --name="Factura Flow" ^
    --windowed ^
    --onefile ^
    --icon=icons/icon.ico ^
    --add-data "web;web" ^
    --hidden-import=webview ^
    --hidden-import=http.server ^
    --hidden-import=socketserver ^
    --hidden-import=pil ^
    main_windows.py

REM Check if build succeeded
echo.
if exist "dist\Factura Flow.exe" (
    echo ========================================
    echo  BUILD SUCCESSFUL!
    echo ========================================
    echo.
    echo Application: dist\Factura Flow.exe
    echo Size: 
    for %%A in ("dist\Factura Flow.exe") do echo         %%~zA bytes
    echo.
    echo To test the application:
    echo   Double-click dist\Factura Flow.exe
    echo.
    echo To create installer, use:
    echo   - Inno Setup
    echo   - NSIS
    echo   - Advanced Installer
    echo.
) else (
    echo ========================================
    echo  BUILD FAILED!
    echo ========================================
    echo Check the error messages above.
    pause
    exit /b 1
)

pause
