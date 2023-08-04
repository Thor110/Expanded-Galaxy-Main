int StartingConditional() {
	int int1 = ((GetGlobalBoolean("MAN_SUNRYF_DONE") == 1) || (GetGlobalBoolean("MAN_SUNRYJF_DONE") == 1));
	return int1;
}

