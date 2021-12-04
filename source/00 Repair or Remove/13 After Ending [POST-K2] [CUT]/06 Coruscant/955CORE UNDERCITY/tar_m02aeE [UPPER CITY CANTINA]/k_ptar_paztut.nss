void main() {
	SetGlobalBoolean("G_PazzakDeck", 1);
	CreateItemOnObject("g_i_pazdeck", GetPCSpeaker(), 1);
	TakeGoldFromCreature(50, GetPCSpeaker(), 0);
}

