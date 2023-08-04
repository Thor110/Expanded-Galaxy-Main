int StartingConditional() {
	int int1 = ((((GetGlobalNumber("K_GenoHaradan") >= 3) && (GetGlobalNumber("K_GenoHaradan") != 99)) && (GetPartyMemberByIndex(1) == OBJECT_INVALID)) && (GetPartyMemberByIndex(2) == OBJECT_INVALID));
	return int1;
}

