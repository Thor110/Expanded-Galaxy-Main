int StartingConditional() {
	int int1 = ((GetGlobalNumber("MAN_PLANET_PLOT") > 1) && (GetGlobalBoolean("MAN_INFO") == 1));
	return int1;
}

