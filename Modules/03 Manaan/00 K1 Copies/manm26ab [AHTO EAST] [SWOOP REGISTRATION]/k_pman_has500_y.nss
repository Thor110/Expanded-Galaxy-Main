int StartingConditional() {
	object oPC = GetFirstPC();
	if ((GetGold(oPC) >= 500)) {
		return 1;
	}
	else {
		return 0;
	}
}

