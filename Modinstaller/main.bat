@echo off 
echo This EXE uses a lot of powershell commands, if you have an powershell profile then it could wreak havoc on the system.
pause
if not exist "%appdata%\.minecraft\mods\" goto warnnomodsfolder
:warnnomodsfolder
mkdir %appdata%\.minecraft\mods
cls
goto start
:start
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, '', 'Welcome to Polygon Mod Installer', [System.Windows.Forms.ToolTipIcon]::None)}"
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter server data location for example (https://example.com/data) (No, we are NOT FTP compatible):', 'Server data location')}" > %TEMP%\out.tmp
set /p serverpath=<%TEMP%\out.tmp
echo "serverpath=%serverpath%"
:main
SET /P entered=Enter mod name: 
echo Downloading mod..
wget --user=POLYGONMINST --password='NONE' -P "%appdata%/.minecraft/mods" "%serverpath%/%entered%.jar" -q
IF /I "%ERRORLEVEL%" EQU "4" goto :errornoserver
IF /I "%ERRORLEVEL%" EQU "5" goto :errorsslserver
IF /I "%ERRORLEVEL%" EQU "8" goto :errornomod
IF /I "%ERRORLEVEL%" EQU "3" echo File I/O error.
IF /I "%ERRORLEVEL%" EQU "0" echo Downloaded!
IF /I "%ERRORLEVEL%" EQU "1" echo Error: Cause unknown.
goto main

goto main
:errornoserver
echo Invalid mod server.
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter server data location for example (https://example.com/data):', 'Server data location')}" > %TEMP%\outt.tmp
set /p serverpath=<%TEMP%\outt.tmp
:errorsslserver
echo SSL verification failure.
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter server data location for example (https://example.com/data):', 'Server data location')}" > %TEMP%\outt.tmp
set /p serverpath=<%TEMP%\outt.tmp
goto main
:errornomod
echo Invalid mod name
goto main