@echo off
rem Thor110
rem find all scripts that use includes

if exist includes.txt (
	del includes.txt
)

for /r %%F in (./*.nss) do (
  if not "%%~nF"=="nwscript" (
	findstr /M "k_inc_" "%%~npF.nss">> includes.txt
  ) else (
    echo Skipping: %%F
  )
)

pause