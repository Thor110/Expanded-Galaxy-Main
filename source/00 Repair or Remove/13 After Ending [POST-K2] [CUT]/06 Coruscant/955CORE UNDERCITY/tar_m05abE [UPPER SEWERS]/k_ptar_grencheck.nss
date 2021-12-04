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

int StartingConditional() {
	int int1;
	object oTar05_corpsepile = GetObjectByTag("tar05_corpsepile", 0);
	object oInvItem;
	int int2;
	int1 = ((((((((GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "g_w_fraggren01")) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "G_w_ThermlDet01"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "G_w_StunGren01"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "g_w_poisngren01"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "G_w_SonicGren01"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "g_w_adhsvgren001"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "G_W_CRYOBGREN001"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "G_W_FIREGREN001"))) || GetIsObjectValid(GetItemPossessedBy(oTar05_corpsepile, "g_w_iongren01")));
	int2 = 0;
	oInvItem = GetFirstItemInInventory(oTar05_corpsepile);
	while (GetIsObjectValid(oInvItem)) {
		sub1(("EATING - " + GetTag(oInvItem)), 5, (5 + int2), 5.0);
		DestroyObject(oInvItem, 0.0, 1, 0.0);
		oInvItem = GetNextItemInInventory(oTar05_corpsepile);
		(int2++);
	}
	return int1;
}

