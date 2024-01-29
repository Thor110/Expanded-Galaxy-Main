@echo off

for /f "delims=" %%x in (version.txt) do set Build=main-v%%x

"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\Expanded Galaxy Main Installer\*"

md tslpatchdata
for /r "Modules" %%x in (*.mod) do copy "%%x" "tslpatchdata\"
"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\tslpatchdata"
rd /s /q tslpatchdata

echo release zipped
pause
exit