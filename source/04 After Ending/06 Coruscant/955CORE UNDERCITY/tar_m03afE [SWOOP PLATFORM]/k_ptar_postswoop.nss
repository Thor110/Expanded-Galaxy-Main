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
void sub2();
int sub1(int intParam1, int intParam2, int intParam3);

void sub2() {
	int nGlobal;
	int int2;
	int int3;
	nGlobal = GetGlobalNumber("TAR_SWOOP_MIN");
	int2 = GetGlobalNumber("TAR_SWOOP_SEC");
	int3 = GetGlobalNumber("TAR_SWOOP_MSEC");
	int3 = (int3 - 25);
	if ((int3 < 0)) {
		int2 = (int2 - 1);
		int3 = (int3 + 100);
	}
	if ((int2 < 0)) {
		nGlobal = (nGlobal - 1);
		int2 = (int2 + 60);
	}
	if (((nGlobal <= 0) && (int2 < 22))) {
		nGlobal = 0;
		int2 = 30;
		int3 = 0;
	}
	SetGlobalNumber("TAR_SWOOP_MIN_BEAT", nGlobal);
	SetGlobalNumber("TAR_SWOOP_SEC_BEAT", int2);
	SetGlobalNumber("TAR_SWOOP_MSEC_BEAT", int3);
	SetCustomToken(30, ((((IntToString(nGlobal) + ":") + IntToString(int2)) + ":") + IntToString(int3)));
}

int sub1(int intParam1, int intParam2, int intParam3) {
	return (((intParam1 * 10000) + (intParam2 * 100)) + intParam3);
}

void main() {
	if (GetGlobalBoolean("TAR_SWOOP_RUN")) {
		SetGlobalBoolean("TAR_SWOOP_RUN", 0);
		if ((sub1(GetGlobalNumber("TAR_SWOOP_MIN"), GetGlobalNumber("TAR_SWOOP_SEC"), GetGlobalNumber("TAR_SWOOP_MSEC")) < sub1(GetGlobalNumber("TAR_SWOOP_MIN_BEAT"), GetGlobalNumber("TAR_SWOOP_SEC_BEAT"), GetGlobalNumber("TAR_SWOOP_MSEC_BEAT")))) {
			SetGlobalNumber("Tar_SwoopStatus", 2);
			sub2();
		}
		else {
			SetGlobalNumber("Tar_SwoopStatus", 1);
		}
		SetGlobalNumber("TAR_SWOOP_ACCEL", (GetGlobalNumber("TAR_SWOOP_ACCEL") + 1));
		if (((GetGlobalNumber("Tar_SwoopRaceCounter") == 5) && (GetGlobalNumber("Tar_SwoopStatus") == 1))) {
			DelayCommand(1.0, ApplyEffectToObject(0, EffectDeath(0, 1), GetFirstPC(), 0.0));
		}
		else {
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			AssignCommand(GetObjectByTag("tar03_Mechanic", 0), ActionStartConversation(GetFirstPC(), "", 0, 0, 1, "", "", "", "", "", ""));
		}
	}
}

