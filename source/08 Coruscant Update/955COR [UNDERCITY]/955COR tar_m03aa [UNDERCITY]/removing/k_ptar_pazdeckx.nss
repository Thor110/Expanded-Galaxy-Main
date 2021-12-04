int StartingConditional() {
	int int1 = ((GetGlobalBoolean("G_PazzakDeck") == 0) && (GetGold(GetPCSpeaker()) >= 50));
	return int1;
}

