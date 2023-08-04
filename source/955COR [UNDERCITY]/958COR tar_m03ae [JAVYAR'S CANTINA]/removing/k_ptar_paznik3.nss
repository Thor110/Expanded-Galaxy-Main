int StartingConditional() {
	int int1 = ((GetGlobalBoolean("G_Paz_JustPlayed") == 1) && (GetGlobalNumber("Tar_PazNik") >= 5));
	return int1;
}

