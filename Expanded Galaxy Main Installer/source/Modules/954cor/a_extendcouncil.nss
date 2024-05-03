void main() {
	if ((GetGlobalBoolean("CORUSCANT_QUEST") == 0)) {
		AddJournalQuestEntry("extendcouncil", 10, 1);
		SetGlobalBoolean("CORUSCANT_QUEST", 1);
		CreateItemOnObject("hawk_armband", GetFirstPC(), 1, 0);
	}
}

