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
void sub2(object objectParam1, int intParam2, int intParam3);
void sub1(object objectParam1);

void sub2(object objectParam1, int intParam2, int intParam3) {
	int nLevel = GetHitDice(GetFirstPC());
	if ((intParam3 == 1)) {
		if (((((intParam2 == intGLOB_12) || (intParam2 == intGLOB_17)) || (intParam2 == intGLOB_18)) || (intParam2 == intGLOB_19))) {
			GiveXPToCreature(GetFirstPC(), (nLevel * 15));
		}
		else {
			if ((((intParam2 == intGLOB_13) || (intParam2 == intGLOB_20)) || (intParam2 == intGLOB_16))) {
				GiveXPToCreature(GetFirstPC(), (nLevel * 20));
			}
			else {
				if (((intParam2 == intGLOB_14) || (intParam2 == intGLOB_15))) {
					GiveXPToCreature(GetFirstPC(), (nLevel * 10));
				}
			}
		}
	}
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		if (((intParam3 == 1) || (intParam3 == 0))) {
			SetLocalBoolean(objectParam1, intParam2, intParam3);
		}
	}
}

void sub1(object objectParam1) {
	sub2(objectParam1, intGLOB_10, 1);
}

void main() {
	object oTar11_csvulkar = GetObjectByTag("tar11_csvulkar", 0);
	object oTar11_wpcsvulkar = GetObjectByTag("tar11_wpcsvulkar", 0);
	SetGlobalFadeIn(0.0, 1.0, 0.0, 0.0, 0.0);
	sub1(oTar11_csvulkar);
	AssignCommand(oTar11_csvulkar, ActionMoveToObject(GetFirstPC(), 0, 1.0));
	DelayCommand(9.0, AssignCommand(oTar11_csvulkar, ActionMoveToObject(oTar11_wpcsvulkar, 0, 1.0)));
	DelayCommand(10.0, AssignCommand(GetFirstPC(), ActionMoveToObject(oTar11_wpcsvulkar, 0, 1.0)));
	DelayCommand(11.0, SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0));
	ActionPauseConversation();
	ActionWait(12.0);
	ActionResumeConversation();
}

