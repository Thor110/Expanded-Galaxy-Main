int StartingConditional() {
	int int1 = ((((((GetGlobalNumber("K_GenoHaradan") >= 3) && (GetGlobalNumber("K_GenoHaradan") != 99)) && (GetGlobalNumber("K_Kotor_master") >= 20)) && (GetPartyMemberByIndex(1) == OBJECT_INVALID)) && (GetPartyMemberByIndex(2) == OBJECT_INVALID)) && (GetGlobalBoolean("K_Hulas_Revan") == 0));
	return int1;
}

