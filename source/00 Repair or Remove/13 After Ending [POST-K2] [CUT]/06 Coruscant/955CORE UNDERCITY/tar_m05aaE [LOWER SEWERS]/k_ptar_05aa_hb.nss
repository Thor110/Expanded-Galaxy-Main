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

void main() {
	object oTar05_tcceiling2 = GetObjectByTag("tar05_tcceiling2", 0);
	if ((GetGlobalNumber("TAR_TRASHTRAPON") > 0)) {
		SetGlobalNumber("TAR_TRASHTRAPON", (GetGlobalNumber("TAR_TRASHTRAPON") + 6));
	}
	if ((GetGlobalNumber("TAR_TRASHTRAPON") > 12)) {
		object oNPC;
		int int4;
		DelayCommand(1.0, AssignCommand(oTar05_tcceiling2, ActionPlayAnimation(201, 1.0, 0.0)));
		int4 = 0;
		while ((int4 < GetPartyMemberCount())) {
			oNPC = GetPartyMemberByIndex(int4);
			DelayCommand(1.0, ApplyEffectToObject(0, EffectDeath(0, 1), oNPC, 0.0));
			(int4++);
		}
		SetGlobalNumber("TAR_TRASHTRAPON", 0);
	}
}

