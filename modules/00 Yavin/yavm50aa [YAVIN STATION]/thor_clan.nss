void main() {
	int nGlobal = GetGlobalNumber("000_Clans_Gath");
	nGlobal = (nGlobal + 1);
	SetGlobalNumber("000_Clans_Gath", nGlobal);
	SetGlobalBoolean("CLAN_YAVIN", 1);
}

