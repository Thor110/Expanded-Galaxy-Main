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
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub2(object objectParam1) {
	SignalEvent(objectParam1, EventUserDefined(2000));
	CreateObject(64, "tar08_rubblebar", GetLocation(objectParam1), 0);
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oNearestTar08_ceilingfall = GetNearestObjectByTag("tar08_ceilingfall", OBJECT_SELF, 1);
	object object3 = OBJECT_SELF;
	sub1("DO CAND DIALOGUE", 5, 5, 5.0);
	SetGlobalBoolean("TAR_ESTATEEXPLOSIONS", 1);
	sub2(oNearestTar08_ceilingfall);
	SetPlotFlag(object3, 0);
	SetMinOneHP(object3, 0);
	DelayCommand(0.5, ApplyEffectToObject(0, EffectDeath(0, 1), object3, 0.0));
}

