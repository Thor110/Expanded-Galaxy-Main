@echo off

for /f "delims=" %%x in (version.txt) do set Build=Main-v%%x

"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\Expanded Galaxy Main Installer\*"

echo Release Zipped
pause
exit
