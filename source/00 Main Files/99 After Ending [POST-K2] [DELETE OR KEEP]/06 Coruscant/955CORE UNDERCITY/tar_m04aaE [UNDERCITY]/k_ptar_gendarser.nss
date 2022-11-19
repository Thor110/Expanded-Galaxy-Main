int StartingConditional() {
	int int1 = ((GetGlobalNumber("TAR_OUT_DISEASE") != 99) && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "RakghoulSerum")));
	return int1;
}

