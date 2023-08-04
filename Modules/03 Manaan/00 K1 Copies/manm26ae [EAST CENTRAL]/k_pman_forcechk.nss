int StartingConditional() {
	int int1;
	if (GetHasSpell(9, GetFirstPC())) {
		return 1;
	}
	else {
		return 0;
	}
}

