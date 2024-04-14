void main() {
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 1)) {
		SetGlobalNumber("200TEL_Control", 1);
		if ((GetGlobalNumber("201TEL_Chano_Spawn") == 3)) {
			SetGlobalNumber("201TEL_Chano_Spawn", 4);
			DestroyObject(GetObjectByTag("201_chano", 0), 0.0, 0, 0.0, 0);
		}
		if ((GetGlobalNumber("203TEL_Czerka_Attack") == 1)) {
			SetGlobalNumber("203TEL_Czerka_Attack", 2);
			SetGlobalNumber("200TEL_Control", 2);
			AddJournalQuestEntry("czerka_attack", 35, 0);
		}
		if ((GetGlobalNumber("201TEL_Shuttle_Ready") == 1)) {
			SetGlobalNumber("201TEL_Shuttle_Ready", 2);
		}
		PlayMovie("TelMov03", 0);
		PlayMovie("TelMov04", 0);
		StartNewModule("235TEL", "", "", "", "", "", "", "");
	}
	else {
		if ((nParam1 == 2)) {
			SetGlobalNumber("200TEL_Control", 2);
			StartNewModule("261TEL", "from_201TEL", "", "", "", "", "", "");
		}
	}
}

