@echo off
rem Thor110
rem update all modules

for /r "Modules Source" %%x in (*.mod) do copy "%%x" "%cd%\Expanded Galaxy Main Installer\tslpatchdata\Modules"

echo Modules Updated
pause
exit