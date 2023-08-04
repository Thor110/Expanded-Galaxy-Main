int StartingConditional() {
	int int1 = GetGender(GetPCSpeaker());
	int int3;
	if ((int1 == 0)) {
		int3 = 1;
	}
	else {
		int3 = 0;
	}
	int3;
	return (int3 && (!GetGlobalBoolean("TAR_DUELINPROGRESS")));
}

