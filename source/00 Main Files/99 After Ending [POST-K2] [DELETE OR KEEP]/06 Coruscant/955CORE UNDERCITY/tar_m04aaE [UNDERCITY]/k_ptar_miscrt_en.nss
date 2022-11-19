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
void sub4(object objectParam1, int intParam2);
int sub3(object objectParam1, int intParam2);
int sub2(object objectParam1);
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub4(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, intGLOB_11, intParam2);
		}
	}
}

int sub3(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

int sub2(object objectParam1) {
	int nLocalBool;
	if (GetIsObjectValid(objectParam1)) {
		nLocalBool = GetLocalBoolean(objectParam1, intGLOB_11);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oNearestTar04_spmission = OBJECT_INVALID;
	object oTar04_mission;
	object oEntering = GetEnteringObject();
	float float1 = 1000.0;
	sub1("MISSION TRIGGER", 5, 5, 5.0);
	oTar04_mission = GetObjectByTag("hendarsfate", 0);
	if (GetIsObjectValid(oTar04_mission)) {
		sub1("RAKGHOUL LIVES", 5, 6, 5.0);
	}
	if ((((oEntering == GetPartyMemberByIndex(0)) && (!sub2(OBJECT_SELF))) && sub3(OBJECT_SELF, intGLOB_1))) {
		sub1("SPAWNING MISSION...", 5, 6, 5.0);
		sub4(OBJECT_SELF, 1);
		oNearestTar04_spmission = GetNearestObjectByTag("tar04_spmission", GetFirstPC(), 1);
		oTar04_mission = CreateObject(1, "tar04_mission", GetLocation(oNearestTar04_spmission), 0);
		AssignCommand(oTar04_mission, ActionStartConversation(oEntering, "", 0, 0, 1, "", "", "", "", "", "", 0));
	}
}

