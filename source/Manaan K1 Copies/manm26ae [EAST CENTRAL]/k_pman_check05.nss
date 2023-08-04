int StartingConditional() {
	int int1 = ((GetGlobalNumber("MAN_PLANET_PLOT") == 4) || (GetGlobalBoolean("MAN_SITHBASE_SEALED") == 1));
	return int1;
}

