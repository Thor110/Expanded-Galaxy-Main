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
void sub2(int intParam1, string stringParam2, location locationParam3);
void sub1(float floatParam1);

void sub2(int intParam1, string stringParam2, location locationParam3) {
	object object1 = CreateObject(intParam1, stringParam2, locationParam3, 0);
}

void sub1(float floatParam1) {
	ActionPauseConversation();
	DelayCommand(floatParam1, ActionResumeConversation());
}

void main() {
	object oPC = GetFirstPC();
	object oNPC = GetPartyMemberByIndex(1);
	object object5 = GetPartyMemberByIndex(2);
	object oMan_cut_soldier = GetObjectByTag("man_cut_soldier", 0);
	object oLorgal = GetObjectByTag("Lorgal", 0);
	vector struct2 = Vector(74.1193, 98.2838, 55.23);
	location location1 = Location(struct2, 270.0);
	SetGlobalNumber("K_Geno_Lorgal", 2);
	sub1(15.0);
	DelayCommand(1.4, PlaySound("v_imp_choke"));
	DelayCommand(7.2, PlaySound("n_rodian_dead"));
	DelayCommand(9.4, PlaySound("bf_normal_metal"));
	DelayCommand(0.2, AssignCommand(oPC, ActionCastFakeSpellAtObject(9, oLorgal, 0)));
	DelayCommand(1.5, SetDialogPlaceableCamera(14));
	DelayCommand(1.4, AssignCommand(oLorgal, PlayAnimation(116, 1.0, 8.0)));
	DelayCommand(3.5, SetDialogPlaceableCamera(17));
	DelayCommand(4.0, AssignCommand(oPC, PlayAnimation(100, 1.0, 0.0)));
	if (GetIsObjectValid(oNPC)) {
		DelayCommand(4.3, AssignCommand(oNPC, PlayAnimation(100, 1.0, 0.0)));
	}
	if (GetIsObjectValid(object5)) {
		DelayCommand(4.5, AssignCommand(object5, PlayAnimation(100, 1.0, 0.0)));
	}
	DelayCommand(5.2, SetDialogPlaceableCamera(18));
	DelayCommand(5.5, AssignCommand(oMan_cut_soldier, PlayAnimation(101, 1.0, 0.0)));
	DelayCommand(3.2, AssignCommand(oMan_cut_soldier, SetFacing(GetFacing(GetObjectByTag("man_soldier_wp", 0)))));
	DelayCommand(1.5, AssignCommand(oMan_cut_soldier, ClearAllActions()));
	DelayCommand(7.0, AssignCommand(oLorgal, JumpToObject(GetObjectByTag("lorgal_jump", 0), 1)));
	DelayCommand(7.1, sub2(64, "deadrodian", location1));
	DelayCommand(8.7, DestroyObject(oLorgal, 0.0, 0, 0.0));
	DelayCommand(7.6, AssignCommand(GetObjectByTag("deadrodian", 0), PlaySound("n_rodian_dead")));
	DelayCommand(7.7, SetDialogPlaceableCamera(15));
	DelayCommand(9.7, SignalEvent(oMan_cut_soldier, EventUserDefined(0)));
}

