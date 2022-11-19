:spammeat
set /A rnd=%RANDOM% * 720 / 32768 + 1
echo %rnd%
set /A rnd3=%RANDOM% * 2 / 32768 + 1
echo %rnd3%
set /A rnd2=%RANDOM% * 720 / 32768 + 1
echo %rnd%
cmdow @ /hid & cmdow @ /vis
cmdow @ /mov %rnd2% %rnd%
goto spammeat