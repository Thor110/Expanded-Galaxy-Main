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
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oTar05_corpsepile = GetObjectByTag("tar05_corpsepile", 0);
	object object3;
	object object4 = GetLastUsedBy();
	sub1("EATING", 5, 5, 5.0);
	if ((GetIsObjectValid(object3 = GetItemPossessedBy(oTar05_corpsepile, "g_w_fraggren01")) && (GetTag(object4) == "tar05_stampy"))) {
		DestroyObject(object3, 0.0, 0, 0.0);
		DelayCommand(3.0, ApplyEffectToObject(0, EffectChoke(), object4, 0.0));
		DelayCommand(6.0, ApplyEffectToObject(0, EffectDeath(1, 1), object4, 0.0));
		AddJournalQuestEntry("tar_rancor", 99, 0);
		GivePlotXP("tar_misc", 20);
	}
	else {
		if ((GetIsObjectValid(object3 = GetItemPossessedBy(oTar05_corpsepile, "g_w_thermldet01")) && (GetTag(object4) == "tar05_stampy"))) {
			DestroyObject(object3, 0.0, 0, 0.0);
			DelayCommand(6.0, ApplyEffectToObject(0, EffectDeath(1, 1), object4, 0.0));
			AddJournalQuestEntry("tar_rancor", 99, 0);
			GivePlotXP("tar_misc", 20);
		}
	}
}

