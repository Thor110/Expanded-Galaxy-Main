int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_SwoopStatus") == 1) || (GetGlobalNumber("Tar_SwoopStatus") == 2));
	return int1;
}

