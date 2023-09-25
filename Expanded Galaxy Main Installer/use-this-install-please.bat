title Star Wars : Knights of the Old Republic II : Expanded Galaxy Project Main Installer

@echo off
setlocal enabledelayedexpansion
set temp = 0

Rem KOTOR2 DISC 64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\LucasArts\KotOR2 /v Path /s
if %errorlevel% equ 0 (
  echo Hello World! Loyal fan & owner of a disc copy of the game!
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\WOW6432Node\LucasArts\KotOR2" /v "Path"') do set mykey1=%%b
) else (
  Rem echo "kotor 2 disc registry entry not detected!"
)

Rem KOTOR2 DISC 32
reg query HKEY_LOCAL_MACHINE\SOFTWARE\LucasArts\KotOR2 /v Path /s
if %errorlevel% equ 0 (
  echo Hello World! Loyal fan & owner of a disc copy of the game!
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\LucasArts\KotOR2" /v "Path"') do set mykey1=%%b
) else (
  Rem echo "kotor 2 disc registry entry not detected!"
)

Rem KOTOR2 GOG
reg query HKEY_LOCAL_MACHINE\SOFTWARE\GOG.com\Games\1421404581 /v PATH /s
if %errorlevel% equ 0 (
  echo Hello World! Good old Games User!
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\GOG.com\Games\1421404581" /v "PATH"') do set mykey2=%%b
) else (
  Rem echo "kotor 2 gog registry entry not detected!"
)

Rem KOTOR2 STEAM
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 208580" /v InstallLocation /s
if %errorlevel% equ 0 (
  echo Hello World! Steam User!
  FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 208580" /v "InstallLocation"') do set mykey3=%%b
) else (
  Rem echo "kotor 2 steam registry entry not detected!"
)

cls

if defined mykey1 (
  set /a temp+=1
  set "mykey=!mykey1!"
)

if defined mykey2 (
  set /a temp+=1
  set "mykey=!mykey2!"
)

if defined mykey3 (
  set /a temp+=1
  set "mykey=!mykey3!"
)

setlocal disabledelayedexpansion

if %temp% equ 0 goto :MANUAL
if %temp% equ 1 goto :INSTALL
:INPUT
echo Please enter which install of the second game to use.
echo Disc Version = 1
echo GoG Version = 2
echo Steam Version = 3
set /p Install="Which install to use: "
echo %Install%|findstr /r "[^0-9]" && (
  goto :INPUT
)
if %Install% gtr 3  (
  cls
  echo enter a number between 1 and 3
  goto :INPUT
)
if %Install% lss 1 (
  cls
  echo enter a number between 1 and 3
  goto :INPUT
)
if %Install% == 1 set mykey=%mykey1%
if %Install% == 2 set mykey=%mykey2%
if %Install% == 3 set mykey=%mykey3%
if not defined mykey (
  cls
  echo Input incorrect or no installation of the game detected!
  goto :INPUT
)
cls
goto :Install
:MANUAL
echo Failed to locate the registry entry, please enter your game directory manually.
set /p mykey="Enter your KotOR2 Directory: "
:INSTALL
if exist "%mykey%\chitin.key" (
  echo Star Wars : Knights of the Old Republic II Installation Detected!
) else (
  echo Star Wars : Knights of the Old Republic II Installation Not Detected!
  pause
  goto :MANUAL
  exit
)

echo Installing Expanded Galaxy Project

copy /y "main-patch-notes.rtf" "%mykey%\main-patch-notes.rtf"
copy /y "main-readme.rtf" "%mykey%\main-readme.rtf"

tslpatchdata\pykotorcli.exe "%mykey%" "%cd%"

echo Star Wars : Knights of the Old Republic II Expanded Galaxy Main Project Installation Completed!

pause