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
void sub2(object objectParam1, int intParam2);
int sub1(object objectParam1);

void sub2(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, intGLOB_11, intParam2);
		}
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
	object oEntering = GetEnteringObject();
	object oTar10_kandona001;
	object oAreaObject;
	if (((GetIsPC(oEntering) && GetGlobalBoolean("Tar_GadonDead")) && (!sub1(OBJECT_SELF)))) {
		sub2(OBJECT_SELF, 1);
		oTar10_kandona001 = CreateObject(1, "tar10_kandona001", GetLocation(GetObjectByTag("tar10_spkand", 0)), 0);
		oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
		while (GetIsObjectValid(oAreaObject)) {
			if (((GetTag(oAreaObject) == "kandonguard02") || (GetTag(oAreaObject) == "kandonark102"))) {
				ChangeToStandardFaction(oAreaObject, 5);
			}
			oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
		}
		AssignCommand(oTar10_kandona001, ActionWait(2.0));
		AssignCommand(oTar10_kandona001, ActionStartConversation(oEntering, "", 0, 0, 1, "", "", "", "", "", ""));
	}
}

