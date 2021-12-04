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
void sub2(object objectParam1, location locationParam2);
void sub1(object objectParam1, int intParam2, int intParam3);

void sub2(object objectParam1, location locationParam2) {
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionJumpToLocation(locationParam2));
}

void sub1(object objectParam1, int intParam2, int intParam3) {
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

void main() {
	int int1;
	object object1;
	object oTar08_roomc;
	sub1(OBJECT_SELF, intGLOB_2, 1);
	ActionPauseConversation();
	SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0);
	int1 = 0;
	while ((int1 < GetPartyMemberCount())) {
		switch (int1) {
			case 0:
				oTar08_roomc = GetObjectByTag("tar08_rooma", 0);
				break;
			case 1:
				oTar08_roomc = GetObjectByTag("tar08_roomb", 0);
				break;
			default:
				oTar08_roomc = GetObjectByTag("tar08_roomc", 0);
				break;
		}
		DelayCommand(1.0, sub2(GetPartyMemberByIndex(int1), GetLocation(oTar08_roomc)));
		(int1++);
	}
	DelayCommand(1.0, AssignCommand(GetObjectByTag("calo081", 0), ActionJumpToObject(GetObjectByTag("tar08_wpcalointro", 0), 0)));
	ActionWait(1.0);
	ActionJumpToObject(GetObjectByTag("tar08_wpdavtour2", 0), 0);
	ActionResumeConversation();
}

