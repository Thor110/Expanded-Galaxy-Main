void main() {
	int nParam1 = GetScriptParameter(1);
	if (nParam1) {
		if ((GetGlobalNumber("001EBO_Movie_End") == 0)) {
			SetGlobalNumber("001EBO_Movie_End", 1);
			PlayMovie("permov02", 0);
		}
	}
	if ((!GetIsXBox())) {
		SetPlanetAvailable(11, 0);
		SetPlanetSelectable(11, 0);
	}
	int int5 = 88;
	if ((!GetIsXBox())) {
		int5 = 89;
	}
	if (((GetJournalEntry("tutorial_3CFD") > 0) && (GetJournalEntry("tutorial_3CFD") < 90))) {
		AurPostString("Completing tutorial_3CFD", 5, 10, 5.0);
		AddJournalQuestEntry("tutorial_3CFD", int5, 0);
	}
	if (((GetJournalEntry("tutorial_heal_pc") > 0) && (GetJournalEntry("tutorial_heal_pc") < 90))) {
		AurPostString("Completing tutorial_heal_pc", 5, 11, 5.0);
		AddJournalQuestEntry("tutorial_heal_pc", 89, 0);
	}
	if (((GetJournalEntry("tutorial_garage") > 0) && (GetJournalEntry("tutorial_garage") < 90))) {
		AurPostString("Completing tutorial_garage", 5, 12, 5.0);
		AddJournalQuestEntry("tutorial_garage", 89, 0);
	}
	if ((GetJournalEntry("tutorial_fix_ebo") > 0)) {
		AurPostString("Completing tutorial_fix_ebo", 5, 13, 5.0);
		AddJournalQuestEntry("tutorial_fix_ebo", 90, 0);
	}
	SetGlobalNumber("001EBO_End", 1);
	DisableHealthRegen(0);
	SwitchPlayerCharacter(0xFFFFFFFF);
	RemoveAvailableNPC(8);
	RemoveAvailableNPC(7);
	StartNewModule("101PER", "", "", "", "", "", "", "");
}

