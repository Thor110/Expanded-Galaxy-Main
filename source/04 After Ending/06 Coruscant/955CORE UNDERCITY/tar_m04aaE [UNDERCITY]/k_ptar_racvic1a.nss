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
void sub3(location locationParam1);
void sub2(object objectParam1, location locationParam2);
void sub1(object objectParam1);

void sub3(location locationParam1) {
	CreateObject(1, "tar04_rakghoulvi", locationParam1, 0);
}

void sub2(object objectParam1, location locationParam2) {
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	if ((GetCurrentHitPoints(objectParam1) < 1)) {
		ApplyEffectToObject(0, EffectResurrection(), objectParam1, 0.0);
		ApplyEffectToObject(0, EffectHeal(1), objectParam1, 0.0);
	}
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionJumpToLocation(locationParam2));
}

void sub1(object objectParam1) {
	location location1 = GetLocation(objectParam1);
	object oPtar_wpgraveyard = GetObjectByTag("ptar_wpgraveyard", 0);
	sub2(objectParam1, GetLocation(oPtar_wpgraveyard));
	sub3(location1);
}

void main() {
	object oRakghoulvic00 = GetObjectByTag("rakghoulvic00", 0);
	object oRakghoulvic01 = GetObjectByTag("rakghoulvic01", 0);
	object oRakghoulvic02 = GetObjectByTag("rakghoulvic02", 0);
	PlaySound("cs_ghoulchange");
	sub1(oRakghoulvic00);
	sub1(oRakghoulvic01);
	sub1(oRakghoulvic02);
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
}

