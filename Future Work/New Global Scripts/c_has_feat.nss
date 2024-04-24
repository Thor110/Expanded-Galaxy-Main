//Thor110
int StartingConditional()
{
  int nParam1 = GetScriptParameter (1);
  if(GetHasFeat(nParam1,GetFirstPC()) == TRUE )
  {
    return TRUE;
  }
  return FALSE;
}