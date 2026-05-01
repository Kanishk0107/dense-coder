@echo off
echo Setting up Dense Coder repo...

:: Create assets folder and move logo
if not exist "assets" mkdir assets
if exist "logo.png" (
    copy /Y "logo.png" "assets\logo.png" >nul
    echo [OK] logo.png moved to assets\logo.png
) else (
    echo [SKIP] logo.png not found at root
)

:: Git init
git init
git add .
git commit -m "Launch Dense Coder — Pro-Level Compact Claude Skill"
git branch -M main

echo.
echo Done. Now run:
echo   git remote add origin https://github.com/Kanishk0107/dense-coder.git
echo   git push -u origin main
pause
