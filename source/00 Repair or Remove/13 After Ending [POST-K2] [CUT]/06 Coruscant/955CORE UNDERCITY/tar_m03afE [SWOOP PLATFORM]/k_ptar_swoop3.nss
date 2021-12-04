int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_SwoopRaceCounter") == 3) && (GetGlobalNumber("Tar_SwoopStatus") == 1));
	return int1;
}

