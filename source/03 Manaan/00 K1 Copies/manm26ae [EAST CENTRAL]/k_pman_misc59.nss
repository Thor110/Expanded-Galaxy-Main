int StartingConditional() {
	int int1 = ((GetGlobalBoolean("MAN_TYVARKS_DONE") == 0) && (GetGlobalNumber("man_ManaanRaceState") == 3));
	if (int1) {
		SetGlobalBoolean("MAN_TYVARKS_DONE", 1);
	}
	return int1;
}

