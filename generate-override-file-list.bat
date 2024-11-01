@echo off
rem Thor110
rem generate override file list for changes.ini

del "Expanded Galaxy Main Installer\tslpatchdata\changes-amazon.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-android.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-disc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-gog.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-legacypc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-steam.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-xbox.ini"

dir "Expanded Galaxy Main Installer\tslpatchdata\Override" /b > temp-list.txt

echo Generating Replace List entries for the changes.ini file.

set x=0
setlocal EnableDelayedExpansion

for /f "delims=|" %%i in (temp-list.txt) do (
  echo Replace!x!=%%i>> override.txt
  set /a x=!x!+1
)

REM echo.>> override.txt
REM echo ; ===================================================================>> override.txt

del temp-list.txt

echo Replace List generated as override.txt

echo Copying changes.ini files...

for /f %%f in ('dir /b changes') do copy /y "changes\%%f" "Expanded Galaxy Main Installer\tslpatchdata\%%f"

echo updating changes.ini files...

for /f "delims=|" %%o in (override.txt) do (
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-amazon.ini"
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-android.ini"
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-disc.ini"
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-gog.ini"
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-legacypc.ini"
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-steam.ini"
  echo %%o>> "Expanded Galaxy Main Installer\tslpatchdata\changes-xbox.ini"
)

del override.txt

pause