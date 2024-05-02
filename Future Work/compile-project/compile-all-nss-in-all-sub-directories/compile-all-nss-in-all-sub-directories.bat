@echo off

set nwnsscompdir=C:\Program Files (x86)\KotOR Tools\TSLPatcher1210b1

for /r %%F in (./*.nss) do (
  if not "%%~nF"=="nwscript" (
    "%nwnsscompdir%\nwnnsscomp.exe" -c "%%~fF" -o "%%~npF.ncs"
  ) else (
    echo Skipping: %%F
  )
)

pause