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
int sub2(int intParam1, int intParam2, object objectParam3);
void sub1();

int sub2(int intParam1, int intParam2, object objectParam3) {
	if ((!GetIsObjectValid(objectParam3))) {
		return 0;
	}
	if (((GetAbilityScore(objectParam3, intParam2) + (Random(20) + 1)) >= intParam1)) {
		return 1;
	}
	else {
		return 0;
	}
}

void sub1() {
	ActionMoveToObject(GetObjectByTag("tar03_wpdancebehind", 0), 0, 0.2);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("bibsurool", 0))));
	if (sub2(11, 1, GetFirstPC())) {
		ActionPlayAnimation(16, 1.0, 3.0);
		ActionPlayAnimation(108, 1.0, 1.0);
		ActionPlayAnimation(16, 1.0, 3.0);
		ActionPlayAnimation(108, 1.0, 1.0);
		ActionPlayAnimation(16, 1.0, 2.0);
		SetGlobalBoolean("TAR_DANCEGOOD", 1);
	}
	else {
		ActionPlayAnimation(16, 1.0, 3.0);
		ActionPlayAnimation(108, 1.0, 1.0);
		ActionPlayAnimation(16, 1.0, 2.0);
		ActionPlayAnimation(23, 1.0, 4.0);
		SetGlobalBoolean("TAR_DANCEGOOD", 0);
	}
}

void main() {
	object object1 = OBJECT_SELF;
	AssignCommand(GetFirstPC(), sub1());
	ActionPauseConversation();
	ActionWait(1.0);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("bibsurool", 0))));
	ActionPlayAnimation(16, 1.0, 3.0);
	ActionPlayAnimation(108, 1.0, 1.0);
	ActionPlayAnimation(16, 1.0, 3.0);
	ActionPlayAnimation(108, 1.0, 1.0);
	ActionPlayAnimation(16, 1.0, 2.0);
	ActionResumeConversation();
}

