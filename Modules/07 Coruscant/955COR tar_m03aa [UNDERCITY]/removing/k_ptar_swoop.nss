int StartingConditional() {
	int int1 = ((GetGlobalBoolean("Tar_SwoopRace") == 1) && (GetPCSpeaker() == GetFirstPC()));
	return int1;
}

