void main() {
	SetGlobalBoolean("Tar_SwoopEng", 1);
	CreateItemOnObject("tar10_accelerato", GetFirstPC(), 1);
	DestroyObject(OBJECT_SELF, 0.0, 0, 0.0);
	AddJournalQuestEntry("tar_bastsearch", 37, 0);
}

