@echo off
rem Thor110
rem compile all nss scripts in all sub directories

set value="Expanded Galaxy Main Installer

rem update inc hawk in override ( not necessary but it's there atm )

copy /y %value%\source\Override\k_inc_hawk.nss" %value%\tslpatchdata\Override\k_inc_hawk.nss"

rem update inc hawk in 003ebo where a script uses it

copy /y %value%\source\Override\k_inc_hawk.nss" %value%\source\Modules\003ebo\k_inc_hawk.nss"

rem compile all scripts

for /r %%F in (./*.nss) do (
  if not "%%~nF"=="nwscript" (
    "nwnnsscomp.exe" -c "%%~fF" -o "%%~npF.ncs"
  ) else (
    echo Skipping: %%F
  )
)

rem move all ncs files from override folder

for /r %value%\source\Override" %%s in (*.ncs) do move "%%~fs" %value%\tslpatchdata\Override\%%~nxs"

rem move all ncs files from individual modules folders

for /d %%t in (%value%\source\Modules\*") do (
	for /r %%i in (%value%\source\Modules\%%~nt\*.ncs") do (
		move %value%\source\Modules\%%~nt\%%~nxi" %value%\tslpatchdata\%%~nt\%%~nxi"
	)
)

rem delete updated k_inc_hawk in 003ebo copied in line 13

del /q %value%\source\Modules\003ebo\k_inc_hawk.nss"

rem delete the following script because it is properly updated in the HACKList of the changes.ini

del /q %value%\tslpatchdata\Override\k_trp_generic.ncs"

rem things still need to be properly checked over, added to the changes.ini to ensure everything is accurate

cls

echo new scripts must be added to the changes.ini for each module! for now...

pause
exit