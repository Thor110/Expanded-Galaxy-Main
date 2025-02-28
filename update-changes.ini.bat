@echo off
rem Thor110
rem generate override file list for changes.ini

echo compiling all modules in all relevant directories
echo run this third

del "Expanded Galaxy Main Installer\tslpatchdata\changes-amazon.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-android.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-disc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-gog.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-legacypc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-steam.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-switch.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-xbox.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-macdisc.ini"
del "Expanded Galaxy Main Installer\tslpatchdata\changes-macaspyr.ini"

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

type changes\changes-amazon-intro.ini		changes\changes.ini changes\changes-amazon-outro.ini		override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-amazon.ini"
type changes\changes-android-intro.ini		changes\changes.ini changes\changes-android-outro.ini		override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-android.ini"
type changes\changes-disc-intro.ini			changes\changes.ini changes\changes-disc-outro.ini			override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-disc.ini"
type changes\changes-gog-intro.ini			changes\changes.ini changes\changes-gog-outro.ini			override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-gog.ini"
type changes\changes-legacypc-intro.ini		changes\changes.ini changes\changes-legacypc-outro.ini		override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-legacypc.ini"
type changes\changes-steam-intro.ini		changes\changes.ini changes\changes-steam-outro.ini			override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-steam.ini"
type changes\changes-switch-intro.ini		changes\changes.ini changes\changes-switch-outro.ini		override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-switch.ini"
type changes\changes-xbox-intro.ini			changes\changes.ini changes\changes-xbox-outro.ini			override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-xbox.ini"
type changes\changes-macdisc-intro.ini		changes\changes.ini changes\changes-macdisc-outro.ini		override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-macdisc.ini"
type changes\changes-macaspyr-intro.ini		changes\changes.ini changes\changes-macaspyr-outro.ini		override.txt > "Expanded Galaxy Main Installer\tslpatchdata\changes-macaspyr.ini"

del override.txt

echo changes.ini files created!