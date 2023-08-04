void main() 
{
	SetGlobalBoolean("LEAVING_POLAR",TRUE);
  if (( GetGlobalNumber("G_PC_Align_Val") > 49 ) && ( GetGlobalNumber("GBL_GAME_COMPLETE") >= 2 ))
  {
		IncrementGlobalNumber("GBL_GAME_COMPLETE", 1);
	}
	else if (( GetGlobalNumber("G_PC_Align_Val") > 49 ) && ( GetGlobalNumber("GBL_GAME_COMPLETE") == 0 ))
  {
		SetGlobalNumber("GBL_GAME_COMPLETE", 1);
	}
  else if (GetGlobalNumber("GBL_GAME_COMPLETE") == 1)
  {
		SetGlobalNumber("GBL_GAME_COMPLETE", 3);
	}
	else if (GetGlobalNumber("GBL_GAME_COMPLETE") == 0)
  {
		SetGlobalNumber("GBL_GAME_COMPLETE", 2);
	}
  SetGlobalNumber("GBL_MAIN_SITH_LORD",4);
	UnlockAllSongs();

	//EndGame(FALSE);
}