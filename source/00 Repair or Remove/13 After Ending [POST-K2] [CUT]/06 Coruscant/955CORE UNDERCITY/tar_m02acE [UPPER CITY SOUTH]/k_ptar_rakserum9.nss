int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_RakSerum") == 1) && (GetGlobalBoolean("Tar_Gurney_Talk") == 1));
	return int1;
}

