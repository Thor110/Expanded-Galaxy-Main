int StartingConditional() {
	int int1 = (GetGlobalBoolean("Tar_DuelLost") && (!GetGlobalBoolean("TAR_DUELINPROGRESS")));
	return int1;
}

