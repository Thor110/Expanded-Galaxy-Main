int StartingConditional() {
	int int1 = ((GetGlobalBoolean("Tar_DuelOver") == 1) && (GetGlobalBoolean("Tar_DuelLost") == 0));
	return int1;
}

