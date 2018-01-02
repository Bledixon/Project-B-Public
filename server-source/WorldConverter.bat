@echo off
set /p jm="Enter map name: "
copy %jm%.jm bin\Debug
bin\Debug\Json2Wmap %jm%.jm %jm%.wmap
echo Compiled map!
echo Moving wmap to Worlds Folder
move %jm%.wmap wServer/realm/worlds/
echo Moved Map to Worlds Folder!
pause