@echo off
rem Thor110
rem generate override file list for changes.ini

del "Expanded Galaxy Main Installer\tslpatchdata\changes-amazon.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-android.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-disc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-gog.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-legacypc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-steam.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-switch.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-xbox.ini"

dir "Expanded Galaxy Main Installer\tslpatchdata\Override" /b > temp-list.txt

echo Generating Override Install List entries for the changes.ini files...

set x=0
setlocal EnableDelayedExpansion

for /f "delims=|" %%i in (temp-list.txt) do (
  echo Replace!x!=%%i>> override.txt
  set /a x=!x!+1
)

echo.>> override.txt
echo ; ===================================================================>> override.txt

del temp-list.txt

echo Override Install List Generated!

echo Creating changes.ini files...

copy changes\changes-amazon-intro.ini		+ changes\changes.ini + changes\changes-amazon-outro.ini		+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-amazon.ini"
copy changes\changes-android-intro.ini		+ changes\changes.ini + changes\changes-android-outro.ini		+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-android.ini"
copy changes\changes-disc-intro.ini			+ changes\changes.ini + changes\changes-disc-outro.ini			+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-disc.ini"
copy changes\changes-gog-intro.ini			+ changes\changes.ini + changes\changes-gog-outro.ini			+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-gog.ini"
copy changes\changes-legacypc-intro.ini		+ changes\changes.ini + changes\changes-legacypc-outro.ini		+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-legacypc.ini"
copy changes\changes-steam-intro.ini		+ changes\changes.ini + changes\changes-steam-outro.ini			+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-steam.ini"
copy changes\changes-switch-intro.ini		+ changes\changes.ini + changes\changes-switch-outro.ini		+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-switch.ini"
copy changes\changes-xbox-intro.ini			+ changes\changes.ini + changes\changes-xbox-outro.ini			+ override.txt "Expanded Galaxy Main Installer\tslpatchdata\changes-xbox.ini"

del override.txt

echo changes.ini files created!

pause