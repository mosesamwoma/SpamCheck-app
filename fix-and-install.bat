@echo off
title Fix SpamDetector & Create Installer
echo ============================================
echo   FIXING SpamDetector JAR and Creating Installer
echo ============================================

set PROJECT_DIR=C:\Users\Moses Tumbo\OneDrive\Documents\app\SpamCheck
set JAVAFX_PATH=C:\java\javafx-sdk-25.0.1\javafx-sdk-25.0.1\lib
set MAIN_CLASS=com.example.App
set ICON=%PROJECT_DIR%\icon.ico

echo.
echo Step 1: Checking current JAR...
jar tf %PROJECT_DIR%\target\SpamDetector.jar | findstr "MANIFEST.MF" > nul
if errorlevel 1 (
    echo ERROR: JAR has no manifest!
) else (
    echo JAR has manifest but wrong main class
)

echo.
echo Step 2: Creating fixed JAR with correct manifest...
cd %PROJECT_DIR%

REM First, let's check what's in the target folder
echo Checking target folder structure...
if exist "target\classes" (
    echo Found classes folder, building from there...
    cd target\classes
    jar cfm ..\SpamDetector-fixed.jar ..\..\manifest.txt *
    cd ..\..
) else (
    echo No classes folder, using existing JAR structure...
)

echo Creating manifest file...
echo Main-Class: %MAIN_CLASS% > manifest.txt
echo Class-Path: . >> manifest.txt

echo.
echo Step 3: Creating fixed JAR...
cd target
jar cfm SpamDetector-fixed.jar ..\manifest.txt *
if exist "classes" jar uf SpamDetector-fixed.jar -C classes .
cd ..

echo.
echo Step 4: Testing the fixed JAR...
echo Testing with JavaFX modules...
java --module-path "%JAVAFX_PATH%" --add-modules javafx.controls,javafx.fxml -jar target\SpamDetector-fixed.jar

echo.
echo Did the app open? (Close it if it did)
pause

echo.
echo Step 5: Creating Windows Installer...
echo This may take 1-2 minutes...
jpackage ^
  --name "SpamDetector" ^
  --module-path "%JAVAFX_PATH%" ^
  --add-modules javafx.controls,javafx.fxml ^
  --input target ^
  --main-jar SpamDetector-fixed.jar ^
  --main-class %MAIN_CLASS% ^
  --type msi ^
  --icon "%ICON%" ^
  --app-version "1.0.0" ^
  --vendor "SpamCheck Team" ^
  --copyright "Copyright 2024" ^
  --description "Spam Detection Application" ^
  --win-dir-chooser ^
  --win-shortcut ^
  --win-menu ^
  --win-menu-group "SpamDetector" ^
  --dest "dist"

echo.
if exist "dist\SpamDetector-1.0.msi" (
    echo ============================================
    echo ✅ SUCCESS! Installer created!
    echo ============================================
    echo.
    echo 📁 Location: %PROJECT_DIR%\dist\SpamDetector-1.0.msi
    echo 📦 Size: 
    for %%F in ("dist\SpamDetector-1.0.msi") do echo   %%~zF bytes
    echo.
    echo 📤 Send this file to your brother!
    echo.
    echo 📝 Installation instructions:
    echo   1. Double-click "SpamDetector-1.0.msi"
    echo   2. Click "Next" through the wizard
    echo   3. Click "Install"
    echo   4. Find "SpamDetector" in Start Menu
    echo.
) else (
    echo ❌ ERROR: Installer creation failed
    echo Trying alternative method...
    
    REM Try different approach
    echo Creating portable version instead...
    jpackage ^
      --name "SpamDetectorPortable" ^
      --module-path "%JAVAFX_PATH%" ^
      --add-modules javafx.controls,javafx.fxml ^
      --input target ^
      --main-jar SpamDetector-fixed.jar ^
      --main-class %MAIN_CLASS% ^
      --type app-image ^
      --icon "%ICON%" ^
      --dest "portable"
    
    if exist "portable\SpamDetectorPortable" (
        echo Created portable version in: portable\SpamDetectorPortable
        echo Send this ENTIRE FOLDER to your brother!
    )
)

echo.
pause