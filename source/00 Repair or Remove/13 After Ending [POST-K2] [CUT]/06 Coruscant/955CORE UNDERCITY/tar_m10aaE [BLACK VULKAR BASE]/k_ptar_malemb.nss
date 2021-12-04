int StartingConditional() {
	int int1 = ((GetGlobalNumber("TAR_RANDOM_TALK") == 1) && (GetGlobalBoolean("Tar_MilBase") == 1));
	return int1;
}

