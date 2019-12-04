:STEAM
@echo off
"C:\SteamCMD\steamcmd.exe" +login anonymous +force_install_dir "C:\rustserver" +app_update 258550 validate +quit
goto OXIDE
 
:OXIDE
@echo off
 
for /F "tokens=2,3,4 delims=/ " %%i in ('date/t') do set y=%%k
for /F "tokens=2,3,4 delims=/ " %%i in ('date/t') do set d=%%k%%i%%j
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do set t=%%i%%j
set t=%t%_
if "%t:~3,1%"=="_" set t=0%t%
set t=%t:~0,4%
set "theFilename=%d%%t%"
echo %theFilename%
 
"C:\Program Files (x86)\GnuWin32\bin\wget.exe" --no-check-certificate https://umod.org/games/rust/download/ --output-document "C:\rustserver\Downloaded\Oxide.Rust.zip"
 
"C:\Program Files\7-Zip\7z.exe" x "C:\rustserver\Downloaded\Oxide.Rust.zip" -o"C:\rustserver" -aoa
del "C:\rustserver\Downloaded\Oxide.Rust.zip"
goto SERV
 
:SERV
@echo off
cd "C:\rustserver\"
RustDedicated.exe -batchmode -server.port 28015 -rcon.port 28016 -server.worldsize 2675 -rcon.password "ANYTHINGNEW" -server.seed 1234 -server.identity my_server_identity -server.headerimage "https://i.imgur.com/WXgpyT1.png" -server.description "INFO" -server.url "WEBSITE" -server.hostname "HOSTNAME" -server.maxplayers 155 -autoupdate
goto STEAM
