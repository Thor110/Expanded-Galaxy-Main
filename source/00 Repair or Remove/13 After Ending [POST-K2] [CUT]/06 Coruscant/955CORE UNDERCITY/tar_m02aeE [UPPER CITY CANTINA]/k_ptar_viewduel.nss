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

void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	object oDuelAnnoun021 = GetObjectByTag("DuelAnnoun021", 0);
	float float1 = 1.0;
	SetPartyLeader((-1));
	SetGlobalBoolean("TAR_DUELINPROGRESS", 1);
	SetGlobalLocation("TAR_DUELCUT_START1", GetLocation(oDeadeyeDun021));
	SetGlobalLocation("TAR_DUELCUT_START2", GetLocation(oGerlonTwof021));
	DelayCommand(float1, AssignCommand(oDeadeyeDun021, ActionJumpToObject(GetObjectByTag("tar02_wpopparena", 0), 0)));
	DelayCommand(float1, AssignCommand(oGerlonTwof021, ActionJumpToObject(GetObjectByTag("tar02_wppcarena", 0), 0)));
}

