int StartingConditional() {
	int int1 = ((GetGlobalBoolean("MAN_TYVARKC_DONE") == 0) && (GetGlobalBoolean("Kas_ChuunderDead") == 1));
	if (int1) {
		SetGlobalBoolean("MAN_TYVARKC_DONE", 1);
	}
	return int1;
}

