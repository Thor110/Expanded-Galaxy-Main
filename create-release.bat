@echo off

for /f "delims=" %%x in (version.txt) do set Build=main-v%%x

"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\Expanded Galaxy Main Installer\*"

set fld=Movies
call :ADD
set fld=Override
call :ADD
set fld=StreamMusic
call :ADD

md tslpatchdata
for /r "Modules" %%x in (*.mod) do copy "%%x" "tslpatchdata\"
for /r "StreamVoice" %%x in (*.wav) do copy "%%x" "tslpatchdata\"
for /r "StreamVoice" %%x in (*.mp3) do copy "%%x" "tslpatchdata\"
"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\tslpatchdata"
rd /s /q tslpatchdata

echo release zipped
pause
exit

:ADD
ren %fld% tslpatchdata
"C:\Program Files\7-Zip\7z.exe" a "%Build%.zip" "%cd%\tslpatchdata"
ren tslpatchdata %fld%
exit /b