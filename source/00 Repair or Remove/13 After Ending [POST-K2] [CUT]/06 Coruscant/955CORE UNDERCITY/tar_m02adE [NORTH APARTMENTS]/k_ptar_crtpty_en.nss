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
void sub3(object objectParam1, int intParam2, int intParam3);
void sub2(object objectParam1, int intParam2);
int sub1(object objectParam1);

void sub3(object objectParam1, int intParam2, int intParam3) {
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
	object oNearestPtar_lockde;
	if (((GetGlobalNumber("Tar_Sarna") == 99) && (!sub1(OBJECT_SELF)))) {
		SetMapPinEnabled(GetObjectByTag("sw_map_party", 0), 1);
		sub2(OBJECT_SELF, 1);
		SetMapPinEnabled(GetObjectByTag("tar02_mnsarnas", 0), 1);
		sub3(GetObjectByTag("tar02_sartlk", 0), intGLOB_1, 1);
		SetGlobalNumber("Tar_YunGend", 99);
		CreateObject(1, "tar02_sarna021", GetLocation(GetObjectByTag("tar02_sarnapty_01", 0)), 0);
		oNearestPtar_lockde = GetNearestObjectByTag("ptar_lockde", GetObjectByTag("tar02_sarnapty_01", 0), 1);
		sub3(GetNearestObjectByTag("tar02_playmusic", oNearestPtar_lockde, 1), intGLOB_1, 1);
		CreateObject(1, "tar02_yungenda21", GetLocation(GetObjectByTag("tar02_sarnapty_02", 0)), 0);
		CreateObject(64, "backpack001", GetLocation(GetObjectByTag("tar02_sarnapty_03", 0)), 0);
		CreateObject(1, "tar02_partyf", GetLocation(GetObjectByTag("tar02_sarnapty_04", 0)), 0);
		CreateObject(1, "tar02_partym", GetLocation(GetObjectByTag("tar02_sarnapty_05", 0)), 0);
		CreateObject(1, "tar02_partytlkf", GetLocation(GetObjectByTag("tar02_sarnapty_06", 0)), 0);
		CreateObject(1, "tar02_partytlkm", GetLocation(GetObjectByTag("tar02_sarnapty_07", 0)), 0);
		DestroyObject(GetObjectByTag("tar02_sithtrooper2", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("tar02_sithtrooper", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("tar02_sithcommander", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("tar02_alienprisoner", 0), 0.0, 0, 0.0);
	}
	if (((GetGlobalNumber("Tar_YunGend") == 99) && (!sub1(OBJECT_SELF)))) {
		SetMapPinEnabled(GetObjectByTag("tar02_mnyuns", 0), 1);
		sub2(OBJECT_SELF, 1);
		sub3(GetObjectByTag("tar02_yuntlk", 0), intGLOB_1, 1);
		SetGlobalNumber("Tar_Sarna", 99);
		CreateObject(1, "tar02_sarna021", GetLocation(GetObjectByTag("tar02_yunpty_01", 0)), 0);
		oNearestPtar_lockde = GetNearestObjectByTag("ptar_lockde", GetObjectByTag("tar02_yunpty_01", 0), 1);
		sub3(GetNearestObjectByTag("tar02_playmusic", oNearestPtar_lockde, 1), intGLOB_1, 1);
		CreateObject(1, "tar02_yungenda21", GetLocation(GetObjectByTag("tar02_yunpty_02", 0)), 0);
		CreateObject(64, "backpack001", GetLocation(GetObjectByTag("tar02_yunpty_03", 0)), 0);
		CreateObject(1, "tar02_partyf", GetLocation(GetObjectByTag("tar02_yunpty_04", 0)), 0);
		CreateObject(1, "tar02_partym", GetLocation(GetObjectByTag("tar02_yunpty_05", 0)), 0);
		CreateObject(1, "tar02_partytlkf", GetLocation(GetObjectByTag("tar02_yunpty_06", 0)), 0);
		CreateObject(1, "tar02_partytlkm", GetLocation(GetObjectByTag("tar02_yunpty_07", 0)), 0);
		DestroyObject(GetObjectByTag("tar02_sithtrooper2", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("tar02_sithtrooper", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("tar02_sithcommander", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("tar02_alienprisoner", 0), 0.0, 0, 0.0);
	}
}

