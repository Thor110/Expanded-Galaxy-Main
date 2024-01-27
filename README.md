# Expanded-Galaxy-Main
Expanded Galaxy : Main

Expanded Galaxy is a mod that adds the planets from the first game and a bunch of fixes / changes / additions.

## Repository folder and file structure
# Folders
00 Manual Install - leftover files from the manual install version of the game that I need to double / triple check before deleting. [TO BE DELETED EVENTUALLY]
99 Clutter - contains a note regarding what files or folders are used to create the release. [TO BE DELETED EVENTUALLY]
Expanded Galaxy Main Installer - the main installer folder containing the source folder an tslpatchdata folder as well as the installer scripts.
Modules - contains the level files organised into folders denoting the planet and module names as well as the .mod files themselves, I use this to quickly and easily repack levels.
Movies - the necessary movie files from KotOR1 for the planets added to TSL in Expanded Galaxy.
Override - the contents of the Override folder.
OverrideFilesToDiff - Some leftover files from prior to changing the project over to using HoloPatcher that I need to diff before deleting. [TO BE DELETED EVENTUALLY]
StreamMusic - the contents of the StreamMusic folder.
StreamVoice - the contents of the StreamVoice folder.
Test - some old dialog files that I should diff at some point. [TO BE DELETED EVENTUALLY]
# Files
.gitattributes - the gitattributes file.
create-release.bat - a batch file for creating the release 7zip file.
KotOR2-Expanded-Galaxy.toml - a .toml file for KotORModSync.
README.md - the readme.md file.
TESTING.md - the testing.md file.
version.txt - this text file contains the version number and is used by "create-release.bat" in order to number and name the 7zip file it produces.

## Terms to know right off the bat:
*K1/KOTOR1*: Knights of the Old Republic 1
*Base game*: the currently installed game that the mod is written on top of.
*K2/KOTOR2/TSL*: Knights of the Old Republic 2: The Sith Lords
*Port*: https://github.com/Thor110/Expanded-Galaxy-Port
*Hood*: https://github.com/Thor110/Expanded-Galaxy-Hood

This is the main repository, there are two other ports of this project:
(*K1 Brotherhood of Shadows + K1 Solomon's Revenge + K1 Expanded Galaxy in base install KOTOR 2 TSL*)[https://github.com/Thor110/Expanded-Galaxy-Hood]
(*K1 in base game KOTOR 2 TSL, with Expanded Galaxy*)[https://github.com/Thor110/Expanded-Galaxy-Port]

The following install order is *required* for Expanded Galaxy Main:
1: (KOTOR 2 TSL)[https://store.steampowered.com/app/208580/STAR_WARS_Knights_of_the_Old_Republic_II__The_Sith_Lords/]
2: (TSLRCM)[https://deadlystream.com/topic/3394-modtsl-restored-content-mod/]
3: M4-78EP
4: Coruscant
5: K2 Expanded Galaxy (the mod provided by this repo)
6: (Port)[https://github.com/Thor110/Expanded-Galaxy-Port]

## (Testing)[https://github.com/Thor110/Expanded-Galaxy-Main/blob/main/TESTING.md]
