int StartingConditional() {
	int int1 = ((GetGlobalNumber("TAR_RANDOM_TALK") == 2) && (!GetGlobalBoolean("TAR_DUELINPROGRESS")));
	return int1;
}

