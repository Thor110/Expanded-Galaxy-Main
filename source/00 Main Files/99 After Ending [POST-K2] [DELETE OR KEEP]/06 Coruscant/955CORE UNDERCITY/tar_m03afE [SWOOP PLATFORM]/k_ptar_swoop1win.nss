int StartingConditional() {
	int int1 = (((GetGlobalNumber("Tar_SwoopRaceCounter") <= 2) && (GetGlobalNumber("Tar_SwoopStatus") == 2)) && (GetGlobalBoolean("Tar_SwoopDouble") == 0));
	return int1;
}

