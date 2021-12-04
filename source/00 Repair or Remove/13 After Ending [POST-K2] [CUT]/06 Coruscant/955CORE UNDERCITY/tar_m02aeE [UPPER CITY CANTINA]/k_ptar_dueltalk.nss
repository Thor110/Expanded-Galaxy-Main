int StartingConditional() {
	int int1 = (((GetGlobalNumber("TAR_RANDOM_TALK") == 0) && (GetGlobalNumber("TAR_DUEL") >= 1)) && (GetPCSpeaker() == GetFirstPC()));
	return int1;
}

