int StartingConditional() {
	object oPC = GetFirstPC();
	if ((GetGold(oPC) >= 20)) {
		return 1;
	}
	else {
		return 0;
	}
}

