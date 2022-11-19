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
int sub3(object objectParam1, int intParam2);
void sub2(object objectParam1);
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

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

void sub2(object objectParam1) {
	object oAreaObject = GetFirstObjectInArea(objectParam1, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if (sub3(oAreaObject, intGLOB_10)) {
			DestroyObject(oAreaObject, 0.0, 1, 0.0);
		}
		oAreaObject = GetNextObjectInArea(objectParam1, 1);
	}
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oTar02_levinthug;
	object oTar02_cantdoor = GetObjectByTag("tar02_cantdoor", 0);
	AddJournalQuestEntry("k_rapidtransit", 1, 0);
	sub1("RUNNING AREA EVENT", 5, 5, 5.0);
	AssignCommand(oTar02_cantdoor, ActionCloseDoor(oTar02_cantdoor));
	if ((!GetLoadFromSaveGame())) {
		sub2(OBJECT_SELF);
	}
	if (((GetGlobalNumber("Tar_Gana") == 20) && (!GetIsObjectValid(GetObjectByTag("GanaLavin021", 0))))) {
		sub1("SPAWNING GANA", 5, 5, 5.0);
		oTar02_levinthug = CreateObject(1, "tar02_gana02ac", GetLocation(GetObjectByTag("tar02_wpgana02", 0)), 0);
		if ((GetIsObjectValid(oTar02_levinthug) && GetIsObjectValid(GetObjectByTag("tar02_wpgana02", 0)))) {
			sub1("GANA SPAWNED", 5, 6, 5.0);
		}
		sub1("CREATING THUGS", 5, 7, 5.0);
		oTar02_levinthug = CreateObject(1, "tar02_levinthug", GetLocation(GetObjectByTag("tar02_wpgana00", 0)), 0);
		oTar02_levinthug = CreateObject(1, "tar02_levinthug", GetLocation(GetObjectByTag("tar02_wpgana01", 0)), 0);
	}
}

