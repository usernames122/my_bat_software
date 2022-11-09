set "paperURL=https://serverjars.com/api/fetchJar/servers/paper/"
set "spigotURL=https://serverjars.com/api/fetchJar/servers/spigot/"
set "oldURL=https://serverjars.com/api/fetchJar/servers/spigot/1.8.8"
set "vanillaURL=https://serverjars.com/api/fetchJar/vanilla/vanilla/"
set "foldURL=https://serverjars.com/api/fetchJar/modded/forge/1.12.2"
set "fURL=https://serverjars.com/api/fetchJar/modded/forge"
CHOICE /C ABCDEF /M "Select [A] Paper Latest, [B] Spigot Latest, [C] Spigot 1.8.8, [D] Vanilla Latest, [E] Forge 1.12.2, [F] Forge Latest"
IF %ERRORLEVEL% EQU 1 (
set /p to="Where to put the JAR file?"
cd /d "%to%"
wget -t 40 -o server.jar "%paperURL%"
)
IF %ERRORLEVEL% EQU 2 (
set /p to="Where to put the JAR file?"
cd /d "%to%"
wget -t 40 -o server.jar "%spigotURL%"
)
IF %ERRORLEVEL% EQU 3 (
set /p to="Where to put the JAR file?"
cd /d "%to%"
wget -t 40 -o server.jar "%oldURL%"
)
IF %ERRORLEVEL% EQU 4 (
set /p to="Where to put the JAR file?"
cd /d "%to%"
wget -t 40 -o server.jar "%vanillaURL%"
)
IF %ERRORLEVEL% EQU 5 (
set /p to="Where to put the JAR file?"
cd /d "%to%"
wget -t 40 -o server.jar "%foldURL%"
)
IF %ERRORLEVEL% EQU 6 (
set /p to="Where to put the JAR file?"
cd /d "%to%"
wget -t 40 -o server.jar "%fURL%"
)
