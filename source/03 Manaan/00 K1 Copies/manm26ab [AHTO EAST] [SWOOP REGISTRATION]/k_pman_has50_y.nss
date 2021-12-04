int StartingConditional() {
	object oPC = GetFirstPC();
	if ((GetGold(oPC) >= 50)) {
		return 1;
	}
	else {
		return 0;
	}
}

