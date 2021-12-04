int StartingConditional() {
	int int1 = 9;
	if ((GetGlobalNumber("man_ManaanRaceState") == 3)) {
		int1 = (int1 + 2);
	}
	if (GetGlobalBoolean("Kas_ChuundarDead")) {
		int1 = (int1 + 1);
	}
	int int4 = ((((GetGlobalNumber("MAN_RANDOM") == 3) || (GetGlobalNumber("MAN_RANDOM") == 4)) && (GetGlobalNumber("KOR_FINAL_TEST") > 3)) && (Random(int1) == 0));
	return int4;
}

