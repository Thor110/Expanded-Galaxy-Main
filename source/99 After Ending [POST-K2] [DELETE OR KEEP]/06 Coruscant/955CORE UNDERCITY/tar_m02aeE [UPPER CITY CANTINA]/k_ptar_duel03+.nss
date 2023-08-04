int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_Duel") >= 3) && (!GetGlobalBoolean("TAR_DUELINPROGRESS")));
	return int1;
}

