title Expanded Galaxy Project Installer
set first=%cd%

@echo off
cls
SET /P level="Enter your Knights of the Old Republic II Directory:"
if exist "%level%\chitin.key" (
  echo Game Found.
) else (
  echo Game Not Found!
  pause
  exit
)

tslpatchdata\pykotorcli.exe "%level%" "%cd%"

pause