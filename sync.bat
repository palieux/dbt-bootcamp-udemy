@echo off
REM Pull latest changes
git pull

REM Check if there are changes to commit
git diff --quiet
if %errorlevel% equ 0 (
    echo No changes to commit
    exit /b 0
)

REM Add all changes
git add .

REM Get current date and time in yyyy-mm-dd hh:mm AM/PM format using PowerShell
for /f "usebackq delims=" %%a in (`powershell -command "Get-Date -Format 'yyyy-MM-dd hh:mm tt'"`) do (
    set FORMATTED_DATETIME=%%a
)

REM Commit with message including date and time
git commit -m "Updated on: %FORMATTED_DATETIME%"

REM Push changes
git push