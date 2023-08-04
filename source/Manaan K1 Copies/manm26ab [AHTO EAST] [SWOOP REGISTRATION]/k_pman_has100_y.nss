int StartingConditional() {
	object oPC = GetFirstPC();
	if ((GetGold(oPC) >= 100)) {
		return 1;
	}
	else {
		return 0;
	}
}

