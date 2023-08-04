int StartingConditional() {
	int int1 = 9;
	if ((GetGlobalNumber("man_ManaanRaceState") == 3)) {
		int1 = 11;
	}
	int int3 = (GetGlobalBoolean("Kas_ChuundarDead") && (Random(int1) == 0));
	return int3;
}

