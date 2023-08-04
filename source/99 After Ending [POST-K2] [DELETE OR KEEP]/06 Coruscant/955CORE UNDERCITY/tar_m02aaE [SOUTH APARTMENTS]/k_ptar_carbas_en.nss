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
void sub4(string stringParam1, int intParam2, int intParam3, float floatParam4);
void sub3(int intParam1, string stringParam2, location locationParam3);
void sub2();
int sub1(object objectParam1);

void sub5(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, intGLOB_11, intParam2);
		}
	}
}

void sub4(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void sub3(int intParam1, string stringParam2, location locationParam3) {
	object object1 = CreateObject(intParam1, stringParam2, locationParam3, 0);
}

void sub2() {
	int int1;
	int1;
	while ((int1 <= 8)) {
		if (IsNPCPartyMember(int1)) {
			RemovePartyMember(int1);
		}
		(int1++);
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
	if (((IsAvailableCreature(0) && IsAvailableCreature(2)) && (!sub1(OBJECT_SELF)))) {
		location location1;
		object oPebn_zaalbar;
		object oZaalbar;
		int int4 = 0;
		sub2();
		if ((IsAvailableCreature(0) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("bastila", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_bastila");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_bastilla", location1));
			}
		}
		if ((IsAvailableCreature(1) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("cand", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_canderous");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_cand", location1));
			}
		}
		if ((IsAvailableCreature(2) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("carth", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_carth");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_carth", location1));
			}
		}
		if ((IsAvailableCreature(3) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("hk47", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_hk47");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_hk47", location1));
			}
		}
		if ((IsAvailableCreature(4) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("jolee", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_jolee");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_jolee", location1));
			}
		}
		if ((IsAvailableCreature(5) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("juhani", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_juhani");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_juhani", location1));
			}
		}
		if ((IsAvailableCreature(6) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("mission", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_mission");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_mission", location1));
			}
		}
		if ((IsAvailableCreature(7) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("t3m4", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_t3m4");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_t3m4", location1));
			}
		}
		if ((IsAvailableCreature(8) || (int4 == 1))) {
			oZaalbar = GetObjectByTag("zaalbar", 0);
			oPebn_zaalbar = GetWaypointByTag("pebn_zaalbar");
			location1 = GetLocation(oPebn_zaalbar);
			if ((GetIsObjectValid(oPebn_zaalbar) && (!GetIsObjectValid(oZaalbar)))) {
				DelayCommand(2.0, sub3(1, "p_zaalbar", location1));
			}
		}
		sub4("SPAWNING CARTH AND BASTILA", 5, 5, 5.0);
		sub5(OBJECT_SELF, 1);
		SetGlobalFadeIn(0.0, 2.0, 0.0, 0.0, 0.0);
		DelayCommand(2.0, AssignCommand(GetObjectByTag("bastila", 0), ActionStartConversation(GetObjectByTag("carth", 0), "tar02_carbast", 0, 0, 0, "", "", "", "", "", "")));
	}
}

