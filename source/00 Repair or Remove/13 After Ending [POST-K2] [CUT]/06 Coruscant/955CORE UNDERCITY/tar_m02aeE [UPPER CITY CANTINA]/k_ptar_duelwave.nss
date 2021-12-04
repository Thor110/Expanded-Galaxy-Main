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
	object oBendakstar021;
	int nGlobal = GetGlobalNumber("tar_duel");
	object oPC = GetFirstPC();
	float float1;
	switch (nGlobal) {
		case 0:
			oBendakstar021 = GetObjectByTag("deadeyedun021", 0);
			float1 = 6.0;
			break;
		case 1:
			oBendakstar021 = GetObjectByTag("gerlontwof021", 0);
			float1 = 7.0;
			break;
		case 2:
			oBendakstar021 = GetObjectByTag("ice021", 0);
			float1 = 9.0;
			break;
		case 3:
			oBendakstar021 = GetObjectByTag("marl021", 0);
			float1 = 5.0;
			break;
		case 4:
			oBendakstar021 = GetObjectByTag("twitch021", 0);
			float1 = 12.0;
			break;
		case 6:
			sub1("BENDAK MAD", 5, 5, 1.0);
			oBendakstar021 = GetObjectByTag("Bendakstar021", 0);
			float1 = 12.0;
			break;
	}
	sub1(("WAVING - " + GetTag(oBendakstar021)), 5, 5, 5.0);
	AssignCommand(oBendakstar021, ClearAllActions());
	DelayCommand(float1, AssignCommand(oBendakstar021, ActionPlayAnimation(108, 0.5, 0.0)));
	ActionPauseConversation();
	ActionWait(float1);
	ActionResumeConversation();
}

