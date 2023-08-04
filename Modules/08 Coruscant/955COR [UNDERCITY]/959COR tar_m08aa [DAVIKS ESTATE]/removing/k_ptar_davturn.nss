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
void sub2(object objectParam1);
void sub1(object objectParam1);

void sub2(object objectParam1) {
	SignalEvent(objectParam1, EventUserDefined(2000));
	CreateObject(64, "tar08_rubblebar", GetLocation(objectParam1), 0);
}

void sub1(object objectParam1) {
	object oArea = GetArea(OBJECT_SELF);
	SignalEvent(objectParam1, EventUserDefined(2000));
}

void main() {
	object oNearestTar08_ceilingfall = GetNearestObjectByTag("tar08_ceilingfall", GetObjectByTag("tar08_wpcollapse1", 0), 1);
	object object4 = GetNearestObjectByTag("tar08_ceilingfall", GetObjectByTag("tar08_wpcollapse0", 0), 1);
	AssignCommand(GetObjectByTag("Davik082", 0), SetFacing(GetFacing(GetObjectByTag("tar08_wpdavtour4", 0))));
	AssignCommand(GetObjectByTag("Calo082", 0), SetFacing(GetFacing(GetObjectByTag("tar08_wpspcalo2", 0))));
	sub1(GetNearestObjectByTag("tar08_wpexplosion", oNearestTar08_ceilingfall, 1));
	sub2(oNearestTar08_ceilingfall);
}

