@echo off

for /r "Modules Source" %%x in (*.mod) do copy "%%x" "%cd%\Expanded Galaxy Main Installer\tslpatchdata\Modules"

echo Modules Updated
pause
exit