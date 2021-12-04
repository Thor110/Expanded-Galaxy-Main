void main() {
	TakeGoldFromCreature(100, GetPCSpeaker(), 1);
	SetGlobalBoolean("G_PazzakDeck", 1);
	CreateItemOnObject("g_i_pazdeck", GetPCSpeaker(), 1);
}

