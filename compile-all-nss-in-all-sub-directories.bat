@echo off
rem Thor110
rem compile all nss scripts in all sub directories

for /r %%F in (./*.nss) do (
  if not "%%~nF"=="nwscript" (
    "nwnnsscomp.exe" -c "%%~fF" -o "%%~npF.ncs"
  ) else (
    echo Skipping: %%F
  )
)

for /r "Expanded Galaxy Main Installer\source\Override" %%x in (*.ncs) do move "%%x" "Expanded Galaxy Main Installer\tslpatchdata\Override"

for /d %%f in (Expanded Galaxy Main Installer\source\Modules\*) do (
	for /r %%i in (Expanded Galaxy Main Installer\source\Modules\%%f\*.ncs) do (
		move "%%i" "Expanded Galaxy Main Installer\tslpatchdata\%%f"
	)
)

echo new scripts must be added to the changes.ini for each module! for now...

pause