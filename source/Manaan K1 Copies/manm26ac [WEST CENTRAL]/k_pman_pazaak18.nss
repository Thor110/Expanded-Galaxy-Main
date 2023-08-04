int StartingConditional() {
	int int1 = (GetGlobalNumber("MAN_JOLAN_NUM") == 10);
	if (int1) {
		SetGlobalBoolean("G_Paz_JustPlayed", 0);
	}
	return int1;
}

