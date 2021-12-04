int StartingConditional() {
	int int1 = ((GetGlobalBoolean("G_Paz_JustPlayed") == 1) && (GetLastPazaakResult() == 0));
	return int1;
}

