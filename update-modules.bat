@echo off
rem Thor110
rem update all modules

echo compiling all modules in all relevant directories
echo run this second

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%cd%\modules\create-all-modules.ps1'" 

for /r "modules" %%x in (*.mod) do copy "%%x" "%cd%\Expanded Galaxy Main Installer\tslpatchdata\Modules"

echo Modules Updated