title Expanded Galaxy Project Installer

@echo off

Rem KOTOR2 DISC
reg query HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\LucasArts\KotOR2 /v Path /s
if %errorlevel% equ 0 (
  echo "Hello World! Loyal fan & owner of a disc copy of the game!"
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\WOW6432Node\LucasArts\KotOR2" /v "Path"') do set mykey2=%%b
) else (
  Rem echo "kotor 2 disc registry entry not detected!"
)

Rem KOTOR2 GOG
reg query HKEY_LOCAL_MACHINE\SOFTWARE\GOG.com\Games\1421404581 /v PATH /s
if %errorlevel% equ 0 (
  echo "Hello World! Good old Games User!"
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SSOFTWARE\GOG.com\Games\1421404581" /v "PATH"') do set mykey2=%%b
) else (
  Rem echo "kotor 2 gog registry entry not detected!"
)

Rem KOTOR2 STEAM
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 208580" /v InstallLocation /s
if %errorlevel% equ 0 (
  echo "Hello World! Steam User!"
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 208580" /v "InstallLocation"') do set mykey2=%%b
) else (
  Rem echo "kotor 2 steam registry entry not detected!"
)

cls

if defined mykey2 (
echo "Star Wars : Knights of the Old Republic II Installation Detected!"
) else (
echo "Star Wars : Knights of the Old Republic II Installation Not Detected!"
pause
exit
)

if exist "%mykey2%\chitin.key" (
  Rem echo Game Found.
) else (
  Rem echo Game Not Found!
  exit
)

echo "Installing Expanded Galaxy Project"

tslpatchdata\pykotorcli.exe "%mykey2%" "%cd%"

cls

echo "Star Wars : Knights of the Old Republic II Expanded Galaxy Main Project Installation Completed!"

pause