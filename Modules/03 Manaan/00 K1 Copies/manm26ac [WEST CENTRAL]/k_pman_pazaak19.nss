int StartingConditional() {
	int int1 = (GetGlobalBoolean("MAN_JOLAN_GIFT") == 0);
	if (int1) {
		SetGlobalBoolean("MAN_JOLAN_GIFT", 1);
	}
	return int1;
}

