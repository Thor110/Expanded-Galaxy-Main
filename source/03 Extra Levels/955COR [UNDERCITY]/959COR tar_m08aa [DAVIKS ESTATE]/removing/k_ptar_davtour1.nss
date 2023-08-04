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
void sub1(string stringParam1, int intParam2, int intParam3, int intParam4);

void sub1(string stringParam1, int intParam2, int intParam3, int intParam4) {
	int int1 = 1;
	object object1;
	int int2;
	if ((intParam2 > intParam3)) {
		int1 = (-1);
	}
	int2 = (intParam2 - int1);
	while (((abs((intParam3 - int2)) > 0) && (abs((intParam3 - int2)) <= abs(((intParam3 - intParam2) + 1))))) {
		object1 = GetObjectByTag((stringParam1 + IntToString((int2 + int1))), 0);
		if (GetIsObjectValid(object1)) {
			ActionForceMoveToObject(object1, intParam4, 1.0, 30.0);
		}
		int2 = (int2 + int1);
	}
	ActionDoCommand(SetCommandable(1, OBJECT_SELF));
	SetCommandable(0, OBJECT_SELF);
}

void main() {
	object oTar08_wptour1_02 = GetObjectByTag("tar08_wptour1_02", 0);
	sub1("tar08_wptour1_0", 1, 5, 0);
}

