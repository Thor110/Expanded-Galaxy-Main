// Globals
	int intGLOB_1 = 0;
	int intGLOB_2 = 1;
	int intGLOB_3 = 2;
	int intGLOB_4 = 3;
	int intGLOB_5 = 4;
	int intGLOB_6 = 5;
	int intGLOB_7 = 6;
	int intGLOB_8 = 7;
	int intGLOB_9 = 8;
	int intGLOB_10 = 9;
	int intGLOB_11 = 10;
	int intGLOB_12 = 11;
	int intGLOB_13 = 12;
	int intGLOB_14 = 13;
	int intGLOB_15 = 14;
	int intGLOB_16 = 15;
	int intGLOB_17 = 16;
	int intGLOB_18 = 17;
	int intGLOB_19 = 18;
	int intGLOB_20 = 19;
	int intGLOB_21 = 1100;
	int intGLOB_22 = (-6);
	int intGLOB_23 = (-5);
	int intGLOB_24 = (-4);
	int intGLOB_25 = (-2);
	int intGLOB_26 = (-1);
	int intGLOB_27 = 0;

// Prototypes
void sub3();
void sub2();
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub3() {
	StartNewModule("stunt_06", "", "05", "", "", "", "", "");
	//StartNewModule("danm13aa", "", "05", "", "", "", "", "");
	//StartNewModule("danm13aa", "", "05", "06a", "05_1c", "", "", "");
}

void sub2() {
	object oNPC;
	int int1 = 0;
	int1;
	while ((int1 < 3)) {
		oNPC = GetPartyMemberByIndex(int1);
		if (GetIsObjectValid(oNPC)) {
			ApplyEffectToObject(0, EffectHeal(500), oNPC, 0.0);
			ApplyEffectToObject(0, EffectHealForcePoints(500), oNPC, 0.0);
		}
		(int1++);
	}
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	if ((!GetIsObjectValid(GetObjectByTag("calo082", 0)))) {

  //ActionTakeItem("taris_armband", GetFirstPC());

DestroyObject(GetObjectByTag("taris_armband"));

  CreateItemOnObject("ebon_armband",GetFirstPC(),1,0);

		sub1("TRIGGERFIRE", 5, 5, 3.0);
		SetGlobalNumber("K_CURRENT_PLANET", 15);
		SetGlobalBoolean("Tar_Destroyed", 1);
		RemoveJournalQuestEntry("tar_party");
		RemoveJournalQuestEntry("k_rapidtransit");
		RemoveJournalQuestEntry("Tar_rancor");
		RemoveJournalQuestEntry("end_attack");
		RemoveJournalQuestEntry("tar_bendakbounty");
		RemoveJournalQuestEntry("tar_diabounty");
		RemoveJournalQuestEntry("tar_infectedoutcasts");
		RemoveJournalQuestEntry("tar_vulkarbase");
		RemoveJournalQuestEntry("tar_largobounty");
		RemoveJournalQuestEntry("tar_matrik");
		RemoveJournalQuestEntry("tar_rakghoulserum");
		RemoveJournalQuestEntry("k_rapidtransit");
		RemoveJournalQuestEntry("tar_rukilapprentice");
		RemoveJournalQuestEntry("tar_selvenbounty");
		RemoveJournalQuestEntry("tar_duelring");
		RemoveJournalQuestEntry("tar_promisedland");
		RemoveJournalQuestEntry("tar_bastsearch");
		RemoveJournalQuestEntry("tar_buydroid");
		AddJournalQuestEntry("tar_escape", 99, 0);
		AddJournalQuestEntry("tar_planetinfo", 99, 0);
		GivePlotXP("tar_main", 20);
		SetPartyLeader((-1));
		ApplyEffectToObject(0, EffectResurrection(), GetFirstPC(), 0.0);
		sub2();
		sub3();
	}
}

