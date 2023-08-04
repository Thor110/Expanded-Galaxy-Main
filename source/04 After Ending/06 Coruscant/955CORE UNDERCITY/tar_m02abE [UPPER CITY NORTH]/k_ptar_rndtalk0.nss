int StartingConditional() {
	//int int1 = (GetGlobalNumber("TAR_RANDOM_TALK") == 0);
	//return int1;
	if(GetGlobalNumber("TAR_RANDOM_TALK") == 0) {
    return TRUE;
  }
  else {
    return FALSE;
  }
}

