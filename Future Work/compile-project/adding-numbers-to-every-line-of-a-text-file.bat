@echo off
    
set x=0
setlocal EnableDelayedExpansion

for /f "delims=|" %%i in (file-list.txt) do (
  echo Replace!x!=%%i>> main-output.txt
  set /a x=!x!+1
)