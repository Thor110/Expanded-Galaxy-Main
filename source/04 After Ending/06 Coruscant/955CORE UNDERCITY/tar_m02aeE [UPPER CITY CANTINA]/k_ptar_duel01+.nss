int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_Duel") >= 1) && (!GetGlobalBoolean("TAR_DUELINPROGRESS")));
	return int1;
}

