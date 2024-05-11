@echo off

if exist override.txt (
	del override.txt
)

dir "Expanded Galaxy Main Installer\tslpatchdata\Override" /b > temp-list.txt

echo Generating Replace List entries for the changes.ini file.

set x=0
setlocal EnableDelayedExpansion

for /f "delims=|" %%i in (temp-list.txt) do (
  echo Replace!x!=%%i>> override.txt
  set /a x=!x!+1
)

del temp-list.txt

echo Replace List generated as override.txt

pause