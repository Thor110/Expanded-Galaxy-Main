# Expanded Galaxy Main
Expanded Galaxy is a mod that adds the planets from the first game and a bunch of fixes / changes / additions.

I recently updated the installer to accomodate the different versions of the game ( Disc, LegacyPC & Steam ) however I have not yet tested anything other than the Steam version.

## WORK IN PROGRESS

As I am actively working on the project, things may be broken from time to time, I apologise in advance for any bugs or faults you may encounter when downloading directly from the repository.

Hoping to put out a proper release of all three parts of the project again some time soon.

## Installation
The following install order is *required* for Expanded Galaxy Main:

NOTE : Do not use the Steam Workshop for any mods when using this project, generally I advise avoiding the Steam Workshop altogether for mods when it comes to this game. I would also advise not using other mods with this project as they are not to be considered compatible.

1: (KotOR 2 TSL) [https://store.steampowered.com/app/208580/STAR_WARS_Knights_of_the_Old_Republic_II__The_Sith_Lords/]

2: 1.0B Patch "sw_pc_english_from200424_to210427.exe" ( GoG & Steam Users Must Skip This Step - This Step Is For Disc Users Only ) [https://www.moddb.com/games/star-wars-knights-of-the-old-republic-ii/downloads/patch-1-0b-us]

3: TSLRCM [https://deadlystream.com/files/file/578-tsl-restored-content-mod/]

4: M4-78EP [https://deadlystream.com/files/file/277-m4-78-enhancement-project/]

5: Coruscant [https://deadlystream.com/files/file/585-coruscant-jedi-temple-by-deathdisco/]

- Ignore the following warning while installing Coruscant : "Done. Changes have been applied, but 1 warnings were encountered."

6: TSL Expanded Galaxy (Main) (the mod provided by this repo)

## Optional Add-ons
7: KotOR Expanded Galaxy (Port) [https://github.com/Thor110/Expanded-Galaxy-Port]

8: Brotherhood (Hood) [https://github.com/Thor110/Expanded-Galaxy-Hood]

## Terms to know right off the bat:
*K1/KotOR1*: Knights of the Old Republic 1

*K2/KotOR2/TSL*: Knights of the Old Republic 2: The Sith Lords

*BoS/BoSSR*: Brotherhood of Shadow: Solomon's Revenge

*Main*: TSL: Expanded Galaxy

*Port*: KotOR: Expanded Galaxy

*Hood*: Brotherhood of Shadow: Solomon's Revenge: Expanded Galaxy

## Repository folder and file structure
# Folders
changes - contains the components of the changes.ini files.

Expanded Galaxy Main Installer - the main installer folder containing the source folder and tslpatchdata folder as well as HoloPatcher.

future - future stuff to work on.
- 00 Design Documents - some old design documents.
- 001MAL - to remind me to work on a version of the Ebon Hawk to be used on Malachor based on 001EBO.
- 08 M478EP Update - my edited versions of M478EP which need fixing.
- 98 Texture Comparison Check - notes on the texture reference comparison that I ran, some things still need doing.
- 201TEL - might not be used, was considering adding the ability to travel back to the Telos surface.
- Decompiler Anomaly - an anomaly with some scripts that cannot be decompiled after being recompiled but the current versions can be decompiled.
- Kashyyyk Maze - notes on an idea.
- LegacySupport - notes and files for legacy support.
- New Global Scripts - new global scripts.
- New Worlds Setup - template script for setting up new worlds.
- Texture Overhaul - the beginnings of a set of lists that will eventually be used as a basis for working on a texture overhaul for the project.
- Things To Add - things to add.
- Animated Galaxy Map Placeable.txt - notes on an idea.
- mobile.png - notes on converting audio for the mobile release.
- switch-or-xbox.txt - reminder to check if the Switch uses the Xbox TSL Model Format or just it's .gui files.
- template files.txt - reminder on conflicting files between parts of the project.

modules - contains the level files organised into folders denoting the planet and module names as well as the .mod files themselves, I use this to quickly and easily repack levels.

saves - the latest common save for testing purposes.

Scripts Left To Decompile - scripts that haven't been decompiled yet exist here.

# Files
- .gitattributes - the gitattributes file.
- .gitignore - the gitignore file.
- find-includes.bat - a batch script to generate a list of all scripts that use include scripts.
- k2-main-bugs.ods - bug tracking.
- nwnnsscomp.exe - nwnnsscomp
- nwscript.nss - nwscript.nss source script
- README.md - the readme.md file.
- TESTING.md - the testing.md file.
- update-changes.ini.bat - A batch file used for updating the changes.ini files by constructing them from the parts in the changes folder.
- update-everything.bat - A batch script that runs through all of the relevant steps to recompile scripts, modules, the changes.ini file and zip the latest release of the project.
- update-modules.bat - A batch file used for recompiling and updating the .mod files inside the "Expanded Galaxy Main Installer\tslpatchdata\modules" directory using those from the "modules" folder.
- update-release.bat - A batch file for zipping the latest release of the project.
- update-scripts.bat - A batch script for compiling all scripts in all sub-directories.
- version.txt - the current version number.