int StartingConditional() {
	int nGlobal = GetGlobalNumber("K_SWG_CARTH");
	int nLevel = GetHitDice(GetFirstPC());
	int int5 = GetGlobalNumber("K_SWG_CARTH_LEVEL");
	int int7 = GetGlobalNumber("K_STAR_MAP");
	if ((((nGlobal == 12) && (int7 > 29)) && (nLevel > int5))) {
		return 1;
	}
	return 0;
}

