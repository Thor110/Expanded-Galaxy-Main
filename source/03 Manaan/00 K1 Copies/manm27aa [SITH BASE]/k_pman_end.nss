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
void sub4(string stringParam1);
void sub3(object objectParam1);
void sub2(string stringParam1);
void sub1(string stringParam1);

void sub4(string stringParam1) {
	int int1 = 1;
	object object1 = GetNearestObjectByTag(stringParam1, OBJECT_SELF, 1);
	while (GetIsObjectValid(object1)) {
		ChangeToStandardFaction(object1, 1);
		(int1++);
		object1 = GetNearestObjectByTag(stringParam1, OBJECT_SELF, int1);
	}
}

void sub3(object objectParam1) {
	AssignCommand(objectParam1, ActionAttack(GetNearestCreature(3, 1, objectParam1, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF), 0));
}

void sub2(string stringParam1) {
	int int1 = 1;
	object object1 = GetNearestObjectByTag(stringParam1, OBJECT_SELF, 1);
	while (GetIsObjectValid(object1)) {
		ChangeToStandardFaction(object1, 6);
		sub3(object1);
		(int1++);
		object1 = GetNearestObjectByTag(stringParam1, OBJECT_SELF, int1);
	}
}

void sub1(string stringParam1) {
	effect effect1 = EffectDroidStun();
	int int1 = 1;
	object object1 = GetNearestObjectByTag(stringParam1, OBJECT_SELF, 1);
	while (GetIsObjectValid(object1)) {
		ApplyEffectToObject(2, effect1, object1, 0.0);
		(int1++);
		object1 = GetNearestObjectByTag(stringParam1, OBJECT_SELF, int1);
	}
}

void main() {
	SetGlobalBoolean("MAN_LOWCOMP", 0);
	SetGlobalBoolean("MAN_TOPCOMP", 0);
	if ((GetGlobalBoolean("MAN_SEO") == 1)) {
		sub1("man27_adroid01");
		sub1("Drdmktwo");
	}
	else {
		if ((GetGlobalBoolean("MAN_SE") == 1)) {
			sub2("man27_adroid01");
			sub2("Drdmktwo");
		}
		else {
			sub4("man27_adroid01");
			sub4("Drdmktwo");
		}
	}
	if ((GetGlobalBoolean("MAN_FCO") == 1)) {
		sub1("man27_room1");
	}
	else {
		if ((GetGlobalBoolean("MAN_FC") == 1)) {
			sub2("man27_room1");
		}
		else {
			sub4("man27_room1");
		}
	}
	if ((GetGlobalBoolean("MAN_DIO") == 1)) {
		sub1("man27_room2");
	}
	else {
		if ((GetGlobalBoolean("MAN_DI") == 1)) {
			sub2("man27_room2");
		}
		else {
			sub4("man27_room2");
		}
	}
}

