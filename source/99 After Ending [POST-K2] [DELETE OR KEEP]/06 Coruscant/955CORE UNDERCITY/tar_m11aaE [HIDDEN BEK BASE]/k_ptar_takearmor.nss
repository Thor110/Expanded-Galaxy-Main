void main() {
	DestroyObject(GetItemPossessedBy(GetFirstPC(), "ptar_sitharmor"), 0.0, 0, 0.0);
	CreateItemOnObject("ptar_sithpapers", GetFirstPC(), 1);
}

