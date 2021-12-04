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
void sub6(object objectParam1, location locationParam2);
void sub5();
void sub4(object objectParam1, object objectParam2, object objectParam3);
void sub3(string stringParam1, int intParam2, int intParam3, float floatParam4);
int sub2(object objectParam1);
int sub1(object objectParam1);

void sub6(object objectParam1, location locationParam2) {
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	if ((GetCurrentHitPoints(objectParam1) < 1)) {
		ApplyEffectToObject(0, EffectResurrection(), objectParam1, 0.0);
		ApplyEffectToObject(0, EffectHeal(1), objectParam1, 0.0);
	}
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionJumpToLocation(locationParam2));
}

void sub5() {
	int int1 = 0;
	object oNPC = GetPartyMemberByIndex(int1);
	while (GetIsObjectValid(oNPC)) {
		if ((GetCurrentHitPoints(oNPC) < 1)) {
			ApplyEffectToObject(0, EffectResurrection(), oNPC, 0.0);
			ApplyEffectToObject(0, EffectHeal(1), oNPC, 0.0);
		}
		(int1++);
		oNPC = GetPartyMemberByIndex(int1);
	}
}

void sub4(object objectParam1, object objectParam2, object objectParam3) {
	object oNPC = GetPartyMemberByIndex(0);
	object object3 = GetPartyMemberByIndex(1);
	object object5 = GetPartyMemberByIndex(2);
	sub5();
	if (GetIsObjectValid(oNPC)) {
		sub6(oNPC, GetLocation(objectParam1));
		AssignCommand(oNPC, SetFacing(GetFacing(objectParam1)));
	}
	if (GetIsObjectValid(object3)) {
		sub6(object3, GetLocation(objectParam2));
		DelayCommand(0.3, AssignCommand(object3, SetFacing(GetFacing(objectParam2))));
	}
	if (GetIsObjectValid(object5)) {
		sub6(object5, GetLocation(objectParam3));
		DelayCommand(0.3, AssignCommand(object5, SetFacing(GetFacing(objectParam3))));
	}
}

void sub3(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

int sub2(object objectParam1) {
	object oNearest = GetNearestCreature(3, 1, objectParam1, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	if (GetIsObjectValid(oNearest)) {
		if ((GetDistanceBetween(oNearest, objectParam1) < 10.0)) {
			return 1;
		}
	}
	return 0;
}

int sub1(object objectParam1) {
	int nLocalBool;
	if (GetIsObjectValid(objectParam1)) {
		nLocalBool = GetLocalBoolean(objectParam1, intGLOB_11);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void main() {
	object oEntering = GetEnteringObject();
	object oExiting = GetExitingObject();
	object oTar05_celltalker = GetObjectByTag("tar05_celltalker", 0);
	if (((((!sub1(oTar05_celltalker)) && (GetIsPC(oEntering) || GetIsPC(oExiting))) && IsNPCPartyMember(6)) && (!sub2(GetPartyMemberByIndex(0))))) {
		sub3("DOOR TALK", 5, 5, 5.0);
		CancelCombat(GetPartyMemberByIndex(0));
		CancelCombat(GetPartyMemberByIndex(1));
		CancelCombat(GetPartyMemberByIndex(2));
		sub4(GetObjectByTag("tar05_wpmissiondoora", 0), GetObjectByTag("tar05_wpmissiondoorb", 0), GetObjectByTag("tar05_wpmissiondoorc", 0));
		AssignCommand(oTar05_celltalker, ActionStartConversation(oTar05_celltalker, "", 0, 0, 0, "", "", "", "", "", ""));
	}
}

