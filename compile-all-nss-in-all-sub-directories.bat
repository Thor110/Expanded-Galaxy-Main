@echo off
rem Thor110
rem compile all nss scripts in all sub directories

echo script broken!!!

pause
exit

for /r "includes" %%x in (*.nss) do copy "%%x" "Expanded Galaxy Main Installer\tslpatchdata\Override"

rem edited include scripts must also be copied temporarily

copy /y "Expanded Galaxy Main Installer\tslpatchdata\source\Override\k_inc_hawk.nss" "Expanded Galaxy Main Installer\tslpatchdata\Override"

for /d %%f in (Expanded Galaxy Main Installer\source\Modules\*) do (
	copy /y "Expanded Galaxy Main Installer\tslpatchdata\source\Override\k_inc_hawk.nss" "%%f"
)

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

rem deleting temporary include scripts

for /r "includes" %%x in (Expanded Galaxy Main Installer\source\Override\*.nss) do del /q "Expanded Galaxy Main Installer\tslpatchdata\Override\%%x"

for /d %%f in (Expanded Galaxy Main Installer\source\Modules\*) do (
	for /r "includes" %%x in (*.nss) do del "%%f\%%x"
	del /q "%%f\k_inc_hawk.nss"
)

echo new scripts must be added to the changes.ini for each module! for now...

pause