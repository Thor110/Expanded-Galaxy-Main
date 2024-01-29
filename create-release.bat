@echo off

for /f "delims=" %%x in (version.txt) do set Build=main-v%%x

for /r "Modules" %%x in (*.mod) do copy "%%x" "tslpatchdata\Modules"

"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\Expanded Galaxy Main Installer\*"

echo release zipped
pause
exit