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
void sub3(object objectParam1, int intParam2);
void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4);
int sub1(object objectParam1);

void sub3(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, intGLOB_11, intParam2);
		}
	}
}

void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
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
	object oTar03_brejik031;
	object oTar03_bastila;
	object oTar03_raceannoun;
	object oEntering = GetEnteringObject();
	if (((GetIsPC(oEntering) && GetGlobalBoolean("Tar_SwoopRace")) && (!sub1(OBJECT_SELF)))) {
		sub2("SPAWN CUTSCENE", 5, 5, 1.0);
		sub3(OBJECT_SELF, 1);
		oTar03_brejik031 = CreateObject(1, "tar03_brejik031", GetLocation(GetObjectByTag("tar03_wpsrcut_01", 0)), 0);
		oTar03_bastila = CreateObject(1, "tar03_bastila", GetLocation(GetObjectByTag("tar03_wpsrcut_03", 0)), 0);
		oTar03_raceannoun = CreateObject(1, "tar03_raceannoun", GetLocation(GetObjectByTag("tar03_wpsrcut_02", 0)), 0);
		AssignCommand(oTar03_raceannoun, ActionWait(2.0));
		AssignCommand(oTar03_raceannoun, ActionStartConversation(oEntering, "", 0, 0, 0, "", "", "", "", "", ""));
	}
}

