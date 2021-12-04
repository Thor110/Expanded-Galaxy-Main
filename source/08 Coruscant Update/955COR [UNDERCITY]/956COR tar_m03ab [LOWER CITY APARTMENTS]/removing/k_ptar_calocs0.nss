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
void sub1(object objectParam1, location locationParam2);

void sub1(object objectParam1, location locationParam2) {
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

void main() {
	object oCalo032 = GetObjectByTag("calo032", 0);
	object oRodian035 = GetObjectByTag("rodian035", 0);
	object oRodian036 = GetObjectByTag("rodian036", 0);
	object oNPC = GetPartyMemberByIndex(0);
	object object9 = GetPartyMemberByIndex(1);
	object object11 = GetPartyMemberByIndex(2);
	location location1 = GetLocation(GetObjectByTag("ASSOC0_WP", 0));
	location location3 = GetLocation(GetObjectByTag("ASSOC1_WP", 0));
	location location5 = GetLocation(GetObjectByTag("ASSOC2_WP", 0));
	SetGlobalFadeIn(0.7, 2.5, 0.0, 0.0, 0.0);
	sub1(oNPC, location1);
	if (GetIsObjectValid(object9)) {
		sub1(object9, location3);
	}
	if (GetIsObjectValid(object11)) {
		sub1(object11, location5);
	}
	ActionPauseConversation();
	SetLockHeadFollowInDialog(oNPC, 1);
	SetLockHeadFollowInDialog(object9, 1);
	ActionWait(6.2);
	ActionResumeConversation();
	AssignCommand(oRodian035, ActionMoveToObject(GetObjectByTag("tar03_wpvic0", 0), 0, 1.0));
	DelayCommand(0.5, AssignCommand(oRodian036, ActionMoveToObject(GetObjectByTag("tar03_wpvic1", 0), 0, 1.0)));
}

