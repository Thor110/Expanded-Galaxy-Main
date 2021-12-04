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
void sub3(object objectParam1, object objectParam2);
void sub2(object objectParam1, int intParam2, int intParam3);
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub3(object objectParam1, object objectParam2) {
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionMoveToObject(objectParam2, 1, 1.0));
}

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

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oTar04_maingate = GetObjectByTag("tar04_maingate", 0);
	object oHendarsfate = GetObjectByTag("hendarsfate", 0);
	object oOutcastMan046 = GetObjectByTag("OutcastMan046", 0);
	object object7;
	int int1;
	sub1("UNLOCKING GATE", 5, 5, 5.0);
	SetPlotFlag(oHendarsfate, 0);
	AssignCommand(oTar04_maingate, ActionOpenDoor(oTar04_maingate));
	sub2(oTar04_maingate, intGLOB_1, 1);
	AssignCommand(GetPartyMemberByIndex(0), ActionMoveToObject(GetObjectByTag("tar04_wpparty", 0), 1, 1.0));
	DelayCommand(1.0, sub3(GetPartyMemberByIndex(1), GetObjectByTag("tar04_wpparty1", 0)));
	ActionPauseConversation();
	sub2(GetObjectByTag("tar04_tpparty", 0), intGLOB_1, 1);
	ExecuteScript("k_act_cmusic_on", OBJECT_SELF, 0xFFFFFFFF);
}

