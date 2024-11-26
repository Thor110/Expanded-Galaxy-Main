@echo off
rem Thor110
rem update all modules

REM note

echo NOTE : UPDATE THIS SCRIPT

for /r "Modules Source" %%x in (*.mod) do copy "%%x" "%cd%\Expanded Galaxy Main Installer\tslpatchdata\Modules"

echo Modules Updated
pause
exit

REM TO ADD THIS
REM REMOVE LEVEL NAMES FROM MODULE FOLDER NAMES AND REMOVE SUBDIRECTORIES

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%cd%\modules\create-all-modules.ps1'" 

for /r "Modules Source" %%x in (*.mod) do copy "%%x" "%cd%\Expanded Galaxy Main Installer\tslpatchdata\Modules"

echo Modules Updated
pause
exit