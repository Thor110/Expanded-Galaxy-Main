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
void sub1();

void sub1() {
	int int1;
	object oNearest = GetItemActivated();
	if ((GetTag(oNearest) != "ptar_sitharmor")) {
		return;
	}
	int1 = 1;
	oNearest = GetNearestCreature(0, 7, GetFirstPC(), int1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	while (GetIsObjectValid(oNearest)) {
		if (((GetDistanceBetween(oNearest, GetFirstPC()) < 10.0) && (!IsObjectPartyMember(oNearest)))) {
			ActionStartConversation(GetFirstPC(), "ptar_armor_dlg", 0, 0, 0, "", "", "", "", "", "");
			return;
		}
		(int1++);
		oNearest = GetNearestCreature(0, 7, GetFirstPC(), int1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	}
	ActionStartConversation(GetFirstPC(), "ptar_armon_dlg", 0, 0, 0, "", "", "", "", "", "");
	SetGlobalBoolean("TAR_SITHARMOR", (!GetGlobalBoolean("TAR_SITHARMOR")));
}

void main() {
	sub1();
}

