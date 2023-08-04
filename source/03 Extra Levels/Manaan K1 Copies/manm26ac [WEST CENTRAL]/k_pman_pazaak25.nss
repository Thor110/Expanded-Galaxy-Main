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
void sub1(int intParam1);

void sub1(int intParam1) {
	object oSW_EXIT = GetWaypointByTag("SW_EXIT");
	object oK_EXIT = GetWaypointByTag("K_EXIT");
	if ((GetIsObjectValid(oSW_EXIT) && GetIsObjectValid(oK_EXIT))) {
		if ((GetDistanceBetween(OBJECT_SELF, oSW_EXIT) > GetDistanceBetween(OBJECT_SELF, oK_EXIT))) {
			oSW_EXIT = oK_EXIT;
		}
	}
	else {
		if ((GetIsObjectValid(oK_EXIT) && (!GetIsObjectValid(oSW_EXIT)))) {
			oSW_EXIT = oK_EXIT;
		}
	}
	ActionForceMoveToObject(oSW_EXIT, intParam1, 1.0, 30.0);
	ActionDoCommand(SetCommandable(1, OBJECT_SELF));
	ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	SetCommandable(0, OBJECT_SELF);
}

void main() {
	sub1(0);
}

