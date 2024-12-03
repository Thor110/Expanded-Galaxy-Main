@echo off
rem Thor110
rem create release package

echo creating a release package
echo run this last

for /f "delims=" %%x in (version.txt) do set Build=Main-v%%x

"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\Expanded Galaxy Main Installer\*"

echo Release Zipped