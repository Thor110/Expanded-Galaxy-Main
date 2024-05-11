/*
    Returns TRUE if the passed in string parameter is equal to
    the current module name.

    Created by: Anthony Davis-OEI
    Modified (hardly) by: Thor110
*/
int StartingConditional()
{
  string modName = GetScriptStringParameter();
  string currentMod = GetModuleName();
  if(modName == currentMod)
    return FALSE;
  return TRUE;
}