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
void sub4();
void sub3(int intParam1, int intParam2);
void sub2();
object sub1(string stringParam1, float floatParam2, float floatParam3, float floatParam4);

void sub4() {
	if ((GetGlobalNumber("301NAR_HK_Spawn") == 0)) {
		CreateObject(1, "p_hk048", GetLocation(GetObjectByTag("wp_hk1_1", 0)), 0);
		CreateObject(1, "p_hk049", GetLocation(GetObjectByTag("wp_hk2_1", 0)), 0);
		CreateObject(1, "p_hk050", GetLocation(GetObjectByTag("wp_hk3_1", 0)), 0);
		DestroyObject(GetObjectByTag("ZhugThug6", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("ZhugThug7", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("ZhugThug2", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("ZhugThug3", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("ZhugThug4", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("ZhugThug5", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("GandFind2", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("Gand1", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("Gand2", 0), 0.0, 0, 0.0, 0);
		SetGlobalNumber("301NAR_HK_spawn", 1);
	}
	else {
		return;
	}
}

void sub3(int intParam1, int intParam2) {
	int int1 = (intParam2 / 6000);
	int int2 = ((intParam2 % 6000) / 100);
	int int3 = ((intParam2 % 6000) % 100);
	string string1 = IntToString(int1);
	string string3;
	string string4;
	if ((int2 < 10)) {
		string3 = ("0" + IntToString(int2));
	}
	else {
		string3 = IntToString(int2);
	}
	if ((int3 < 10)) {
		string4 = ("0" + IntToString(int3));
	}
	else {
		string4 = IntToString(int3);
	}
	SetCustomToken(intParam1, ((((string1 + ":") + string3) + ":") + string4));
}

void sub2() {
	int int1 = (((GetGlobalNumber("371NAR_SWOOP_B_MIN") * 6000) + (GetGlobalNumber("371NAR_SWOOP_B_SEC") * 100)) + GetGlobalNumber("371NAR_SWOOP_B_MSEC"));
	sub3(54, int1);
	SetCustomToken(55, "00:00:0000");
	object oModo = GetObjectByTag("Modo", 0);
	if ((!GetLocalBoolean(oModo, 50))) {
		return;
	}
	int int6 = (((GetGlobalNumber("371NAR_SWOOP_MIN") * 6000) + (GetGlobalNumber("371NAR_SWOOP_SEC") * 100)) + GetGlobalNumber("371NAR_SWOOP_MSEC"));
	sub3(55, int6);
	if (((((GetGlobalNumber("371NAR_SWOOP_MIN") == 59) && (GetGlobalNumber("371NAR_SWOOP_SEC") == 59)) && (GetGlobalNumber("371NAR_SWOOP_MSEC") == 99)) || GetGlobalBoolean("FORFEIT_SWOOPRACE"))) {
		SetLocalBoolean(oModo, 28, 1);
		return;
	}
	if (((int6 < int1) || (int1 == 0))) {
		int1 = int6;
		SetGlobalNumber("371NAR_SWOOP_B_MIN", GetGlobalNumber("371NAR_SWOOP_MIN"));
		SetGlobalNumber("371NAR_SWOOP_B_SEC", GetGlobalNumber("371NAR_SWOOP_SEC"));
		SetGlobalNumber("371NAR_SWOOP_B_MSEC", GetGlobalNumber("371NAR_SWOOP_MSEC"));
		sub3(54, int1);
		SetLocalBoolean(oModo, 52, 1);
	}
	else {
		SetLocalBoolean(oModo, 52, 0);
	}
	if (GetLocalBoolean(oModo, 40)) {
		int int18;
		if ((int6 < 10000)) {
			SetLocalBoolean(oModo, 32, 1);
			int18 = (int6 + Random(1200));
			sub3(51, int18);
		}
		else {
			SetLocalBoolean(oModo, 31, 1);
			if ((int6 < 12000)) {
				int18 = (10000 - Random(1400));
			}
			else {
				int18 = (12000 - Random(1400));
			}
			sub3(52, int18);
		}
	}
	else {
		int int22;
		SetLocalBoolean(oModo, 30, 1);
		if ((int6 < 7000)) {
			int22 = (int6 - Random(500));
		}
		else {
			if ((int1 < 7000)) {
				int22 = (int1 - Random(500));
			}
			else {
				int22 = (7000 - Random(1200));
			}
		}
		sub3(50, int22);
	}
	SetGlobalNumber("371NAR_SWOOP_MIN", 0);
	SetGlobalNumber("371NAR_SWOOP_SEC", 0);
	SetGlobalNumber("371NAR_SWOOP_MSEC", 0);
}

object sub1(string stringParam1, float floatParam2, float floatParam3, float floatParam4) {
	location location1 = Location(Vector(floatParam2, floatParam3, 0.0), floatParam4);
	return CreateObject(1, stringParam1, location1, 0);
}

void main() {
	object oEntering = GetEnteringObject();
	if ((oEntering == GetFirstPC())) {
		if ((((((GetObjectByTag("AirTaxi", 0) == OBJECT_INVALID) && GetGlobalNumber("302NAR_Airspeeder_41")) && GetGlobalNumber("302NAR_Airspeeder_42")) && GetGlobalNumber("302NAR_Airspeeder_43")) && (GetGlobalNumber("302NAR_Airspeeder_44") == 2))) {
			CreateObject(64, "lndspdr003", GetLocation(GetObjectByTag("wp_airtaxi", 0)), 0);
		}
		object oBik = GetObjectByTag("bik", 0);
		if (GetIsObjectValid(oBik)) {
			SetOrientOnClick(OBJECT_SELF, 0);
			AssignCommand(oBik, ActionPlayAnimation(30, 1.0, (-1.0)));
		}
		if (GetGlobalBoolean("300NAR_From_MiraApt")) {
			AurPostString("from Mira's Apt", 9, 9, 3.0);
			DestroyObject(GetObjectByTag("Vossk", 0), 0.0, 0, 0.0, 0);
			SetGlobalBoolean("300NAR_From_MiraApt", 0);
			sub1("te_zhugthug6", (-14.7), 25.0, 0.0);
			sub1("te_zhugthug7", 11.65, 25.0, 180.0);
			sub1("te_zhugthug2", (-14.7), 21.0, 0.0);
			sub1("te_zhugthug3", (-14.7), 29.0, 0.0);
			sub1("te_zhugthug4", 11.65, 21.0, 180.0);
			sub1("te_zhugthug5", 11.65, 29.0, 180.0);
			sub1("te_gandfind2", (-35.5), 3.95, 0.0);
			sub1("te_gand1", (-37.5), 5.15, 0.0);
			sub1("te_Gand2", (-37.5), 2.75, 0.0);
			object oAreaObject = GetFirstObjectInArea(GetArea(OBJECT_SELF), 8);
			while ((oAreaObject != OBJECT_INVALID)) {
				if ((((GetTag(oAreaObject) != "GarageDoor") && (GetTag(oAreaObject) != "d_refugee3")) && (GetTag(oAreaObject) != "DockDoor"))) {
					SetLocked(oAreaObject, 1);
				}
				AssignCommand(oAreaObject, ActionCloseDoor(oAreaObject));
				oAreaObject = GetNextObjectInArea(GetArea(OBJECT_SELF), 8);
			}
		}
		sub2();
		if ((GetGlobalNumber("351NAR_Ebon_Released") != 0)) {
			object object24 = GetFirstObjectInArea(GetArea(OBJECT_SELF), 8);
			while ((object24 != OBJECT_INVALID)) {
				if ((((GetTag(object24) != "GarageDoor") && (GetTag(object24) != "d_refugee3")) && (GetTag(object24) != "DockDoor"))) {
					SetLocked(object24, 0);
				}
				object24 = GetNextObjectInArea(GetArea(OBJECT_SELF), 8);
			}
			sub4();
			SetAreaUnescapable(0);
		}
	}
}

