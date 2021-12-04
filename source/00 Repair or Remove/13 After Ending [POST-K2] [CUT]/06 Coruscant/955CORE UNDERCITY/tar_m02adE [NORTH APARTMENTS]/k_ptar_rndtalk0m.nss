int StartingConditional() {
	if((GetGlobalNumber("TAR_RANDOM_TALK") == 0) && (GetGlobalBoolean("Tar_MilBase") == 1)) {
    return TRUE;
  }
  else {
    return FALSE;
  }
}

