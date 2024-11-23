@echo off
set /p choice=Please enter what you wish to search for : 
findstr /L /S /M "%choice%" *.* > search-all-files-for-reference-%choice%-y-logfile.txt

pause