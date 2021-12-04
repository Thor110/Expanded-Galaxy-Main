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
	object oNPC = GetPartyMemberByIndex(1);
	object object3 = GetPartyMemberByIndex(2);
	int int1 = 0;
	while ((int1 <= 8)) {
		RemovePartyMember(int1);
		(int1++);
	}
	DestroyObject(oNPC, 0.0, 1, 0.0);
	DestroyObject(object3, 0.0, 1, 0.0);
	ClearAllActions();
	ActionJumpToObject(GetObjectByTag("tar11_wppcsleep", 0), 1);
	CreateObject(1, "tar11_csbek", GetLocation(GetObjectByTag("tar11_wpcsbek", 0)), 0);
}

void main() {
	SetGlobalFadeOut(6.0, 1.0, 0.0, 0.0, 0.0);
	DelayCommand(7.0, AssignCommand(GetFirstPC(), sub1()));
	ActionPauseConversation();
	ActionWait(8.0);
	ActionResumeConversation();
}

