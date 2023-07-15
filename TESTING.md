# Testing new mod updates

## Reusing old saves

### In both K1 and K2, saves can be used to quickly load back in to a specific state in the story. However, when dealing with changes to game files, there are certain rules that must be followed:

#### Changes to files in 'Modules' folder:
So the hard rule is if one enters a module even *once*, that module will never be able to be modified again unless one of the following conditions are met:
- the save file is modified using external tools
- the .mod file isn't modified directly but instead replaced by using the Override folder
- the user creates a new save in a new playthrough

- - .DLG files:
    +  Only one script is allowed to be called per dialog option, therefore two can't edit the same option.
- .DDS/.TPC/.TGA Texture files:
    + Priority order: DDS -> TPC -> TGA (what about TXI?)
- .nss/.ncs:
  + Priority order: ncs only, nss isn't read by game
  + nss is source, must be compiled as ncs. (this info conflicts with pykotor source which renames a .nss file to .ncs somewhere randomly in its 'process nss files' method)
  + Straight up incompatible unless rewritten by hand.
- dialog.TLK
  + These mods must be installed before installing anything else, in most cases.
- .uti
  + .UTI files represent item templates and define the properties and behavior of in-game items.
  + Conflicts may arise if two mods modify the same .UTI file, resulting in inconsistent item attributes, incorrect item functionality, or overlapping item IDs.
- .2DA Files:
  + 2DA files contain data tables used for various aspects of the game, such as character attributes, item properties, spell effects, and more.
  + Conflicts can occur if multiple mods modify the same .2DA file or if there are discrepancies in the structure or values within the file. Conflicting changes can lead to incorrect gameplay behavior, broken functionalities, or even crashes.
