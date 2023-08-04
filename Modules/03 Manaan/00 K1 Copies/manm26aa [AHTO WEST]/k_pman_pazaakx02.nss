int StartingConditional() {
	int int1;
	int nGlobal;
	int1 = ((GetGlobalBoolean("G_Paz_JustPlayed") == 1) && (GetLastPazaakResult() == 1));
	if (int1) {
		nGlobal = GetGlobalNumber("MAN_GONTON");
		SetGlobalNumber("MAN_GONTON", (nGlobal + 1));
		SetGlobalBoolean("G_Paz_JustPlayed", 0);
	}
	return int1;
}

