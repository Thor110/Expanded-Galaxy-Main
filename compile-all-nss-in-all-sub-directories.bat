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

pause