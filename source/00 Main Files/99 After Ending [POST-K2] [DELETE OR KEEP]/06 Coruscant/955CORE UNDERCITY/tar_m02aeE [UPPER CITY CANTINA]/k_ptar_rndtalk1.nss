int StartingConditional() {
	int int1 = ((GetGlobalNumber("TAR_RANDOM_TALK") == 1) && (!GetGlobalBoolean("TAR_DUELINPROGRESS")));
	return int1;
}

