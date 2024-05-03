void main() {
	if ((GetGlobalNumber("000_HK47_Sensor") >= 1)) {
		if ((GetGlobalNumber("000_HK_50_Encounter") == 0)) {
			AddJournalQuestEntry("HKfactory", 20, 1);
		}
		else {
			if ((GetGlobalNumber("000_HK_50_Encounter") == 1)) {
				AddJournalQuestEntry("HKfactory", 30, 1);
			}
			else {
				if ((GetGlobalNumber("000_HK_50_Encounter") == 2)) {
					AddJournalQuestEntry("HKfactory", 40, 1);
				}
			}
		}
	}
}

