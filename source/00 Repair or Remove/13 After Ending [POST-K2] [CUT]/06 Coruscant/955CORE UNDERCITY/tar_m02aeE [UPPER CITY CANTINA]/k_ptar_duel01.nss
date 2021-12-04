int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_Duel") == 1) && (GetPCSpeaker() == GetFirstPC()));
	return int1;
}

