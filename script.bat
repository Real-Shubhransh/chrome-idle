@echo off
set SCRIPT_URL=https://raw.githubusercontent.com/Real-Shubhransh/chrome-idle/main/script.ps1
set TEMP_PS=%TEMP%\chrome_idle_install.ps1

echo Downloading installer...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Invoke-WebRequest '%SCRIPT_URL%' -OutFile '%TEMP_PS%'"

echo Running installer...
powershell -NoProfile -ExecutionPolicy Bypass -File "%TEMP_PS%"

echo Done!
pause
