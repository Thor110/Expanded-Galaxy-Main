@echo off
rem Thor110
rem compile all nss scripts in all sub directories

set value = "Expanded Galaxy Main Installer"

copy /y "%value%\source\Override\k_inc_hawk.nss" "%value%\tslpatchdata\Override\k_inc_hawk.nss"
copy /y "%value%\source\Override\k_inc_hawk.nss" "%value%\source\Modules\003ebo\k_inc_hawk.nss"

for /r %%F in (./*.nss) do (
  if not "%%~nF"=="nwscript" (
    "nwnnsscomp.exe" -c "%%~fF" -o "%%~npF.ncs"
  ) else (
    echo Skipping: %%F
  )
)

for /r "%value%\source\Override" %%x in (*.ncs) do move "%%x" "%value%\tslpatchdata\Override"

for /d %%f in (%value%\source\Modules\*) do (
	for /r %%i in (%value%\source\Modules\%%~nf\*.ncs) do (
		move "%%~fi" "%value%\tslpatchdata\%%~nf\%%~nxi"
	)
)

rem deleting ncs from source folders

for /d %%f in (%value%\source\*) do (
	for /r %%x in (./*.ncs) do del "%%~fx"
)

del /q "%value%\source\Modules\003ebo\k_inc_hawk.nss"

echo new scripts must be added to the changes.ini for each module! for now...

pause
exit

The system cannot find the file specified.
"D:\modules\Expanded"
"Expanded"
"Expanded"