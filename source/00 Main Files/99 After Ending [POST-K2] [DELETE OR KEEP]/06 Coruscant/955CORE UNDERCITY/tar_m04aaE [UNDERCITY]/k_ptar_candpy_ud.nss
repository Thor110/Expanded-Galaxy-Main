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
void sub5(object objectParam1, int intParam2);
void sub4(object objectParam1);
void sub3(string stringParam1, int intParam2, int intParam3, float floatParam4);
void sub2(object objectParam1, int intParam2, int intParam3);
int sub1(object objectParam1, int intParam2);

void sub5(object objectParam1, int intParam2) {
	ActionForceMoveToObject(objectParam1, intParam2, 1.0, 30.0);
	ActionDoCommand(SetCommandable(1, OBJECT_SELF));
	SetCommandable(0, OBJECT_SELF);
}

void sub4(object objectParam1) {
	sub2(objectParam1, intGLOB_10, 1);
}

void sub3(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
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

int sub1(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 2000:
			if ((!sub1(OBJECT_SELF, intGLOB_1))) {
				sub2(OBJECT_SELF, intGLOB_1, 1);
			}
			else {
				if ((!sub1(OBJECT_SELF, intGLOB_2))) {
					sub2(OBJECT_SELF, intGLOB_2, 1);
				}
				else {
					if ((!sub1(OBJECT_SELF, intGLOB_3))) {
						sub2(OBJECT_SELF, intGLOB_3, 1);
					}
					else {
						int int6;
						object oNPC;
						sub3("CANDEROUS TALK", 5, 5, 5.0);
						ClearAllActions();
						SurrenderToEnemies();
						AssignCommand(GetObjectByTag("daviktroop041", 0), ClearAllActions());
						AssignCommand(GetObjectByTag("daviktroop041", 0), SurrenderToEnemies());
						AssignCommand(GetObjectByTag("daviktroop042", 0), ClearAllActions());
						AssignCommand(GetObjectByTag("daviktroop042", 0), SurrenderToEnemies());
						AssignCommand(GetObjectByTag("daviktroop043", 0), ClearAllActions());
						AssignCommand(GetObjectByTag("daviktroop043", 0), SurrenderToEnemies());
						int6 = 0;
						while ((int6 < GetPartyMemberCount())) {
							oNPC = GetPartyMemberByIndex(int6);
							AssignCommand(oNPC, ClearAllActions());
							CancelCombat(oNPC);
							(int6++);
						}
						if ((GetDistanceBetween(OBJECT_SELF, GetPartyMemberByIndex(0)) < 15.0)) {
							NoClicksFor(3.3);
							DelayCommand(3.0, ActionStartConversation(GetPartyMemberByIndex(0), "", 0, 0, 1, "", "", "", "", "", ""));
						}
						else {
							ExecuteScript("k_ptar_cander04", OBJECT_SELF, 0xFFFFFFFF);
						}
					}
				}
			}
			break;
		case 3000:
			ClearAllActions();
			sub4(OBJECT_SELF);
			DelayCommand(24.0, DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
			ChangeToStandardFaction(OBJECT_SELF, 5);
			{
				object oCanderous043 = GetObjectByTag("canderous043", 0);
				object oDaviktroop041 = GetObjectByTag("daviktroop041", 0);
				object oDaviktroop042 = GetObjectByTag("daviktroop042", 0);
				object oDaviktroop043 = GetObjectByTag("daviktroop043", 0);
				if ((OBJECT_SELF == oDaviktroop041)) {
					ActionWait(1.0);
				}
				if ((OBJECT_SELF == oDaviktroop042)) {
					ActionWait(2.0);
				}
				if ((OBJECT_SELF == oDaviktroop043)) {
					ActionWait(3.0);
				}
				sub5(GetObjectByTag("tar04_swcanext", 0), 0);
			}
			break;
		case 4000:
			ClearAllActions();
			ActionResumeConversation();
			break;
	}
}

