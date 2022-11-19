int StartingConditional() {
	int int1;
	object oPtar_elevdoor = GetObjectByTag("ptar_elevdoor", 0);
	int1 = (!GetIsOpen(oPtar_elevdoor));
	return int1;
}

