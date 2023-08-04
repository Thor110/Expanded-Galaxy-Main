int StartingConditional() {
	int int1 = GetGlobalBoolean("G_Paz_JustPlayed");
	if (int1) {
		SetGlobalBoolean("G_Paz_JustPlayed", 0);
	}
	return int1;
}

