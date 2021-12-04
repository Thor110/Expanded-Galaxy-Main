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
void sub5(float floatParam1);
void sub4(object objectParam1, float floatParam2);
void sub3(object objectParam1, int intParam2, int intParam3);
void sub2(object objectParam1);
void sub1(object objectParam1, float floatParam2);

void sub5(float floatParam1) {
	ActionPauseConversation();
	DelayCommand(floatParam1, ActionResumeConversation());
}

void sub4(object objectParam1, float floatParam2) {
	object object1 = OBJECT_SELF;
	DelayCommand(floatParam2, DestroyObject(object1, 0.0, 1, 0.0));
}

void sub3(object objectParam1, int intParam2, int intParam3) {
	int nLevel = GetHitDice(GetFirstPC());
	if ((intParam3 == 1)) {
		if (((((intParam2 == intGLOB_12) || (intParam2 == intGLOB_17)) || (intParam2 == intGLOB_18)) || (intParam2 == intGLOB_19))) {
			GiveXPToCreature(GetFirstPC(), (nLevel * 15));
		}
		else {
			if ((((intParam2 == intGLOB_13) || (intParam2 == intGLOB_20)) || (intParam2 == intGLOB_16))) {
				GiveXPToCreature(GetFirstPC(), (nLevel * 20));
			}
			else {
				if (((intParam2 == intGLOB_14) || (intParam2 == intGLOB_15))) {
					GiveXPToCreature(GetFirstPC(), (nLevel * 10));
				}
			}
		}
	}
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		if (((intParam3 == 1) || (intParam3 == 0))) {
			SetLocalBoolean(objectParam1, intParam2, intParam3);
		}
	}
}

void sub2(object objectParam1) {
	sub3(objectParam1, intGLOB_10, 1);
}

void sub1(object objectParam1, float floatParam2) {
	sub2(objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionDoCommand(sub4(GetObjectByTag("tar04_wpexodus0", 0), floatParam2)));
}

void main() {
	object object1 = OBJECT_SELF;
	object oGendar041 = GetObjectByTag("gendar041", 0);
	object oAreaObject;
	int int1;
	float float1 = 1.5;
	DestroyObject(GetObjectByTag("rakghoulvic00", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("rakghoulvic01", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("rakghoulvic02", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("infectedoutcastf", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("infectedoutcastm", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("outcastwoman043", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("outcastman045", 0), 0.0, 1, 0.0);
	DestroyObject(GetObjectByTag("outcastman046", 0), 0.0, 1, 0.0);
	SignalEvent(GetObjectByTag("tar04_maingate", 0), EventUserDefined(2000));
	ActionJumpToObject(GetObjectByTag("tar04_wprukil", 0), 1);
	AssignCommand(oGendar041, ActionJumpToObject(GetObjectByTag("tar04_wpgendar", 0), 1));
	SetGlobalFadeIn(1.0, 1.0, 0.0, 0.0, 0.0);
	oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	int1 = 0;
	while (GetIsObjectValid(oAreaObject)) {
		if (((FindSubString(GetTag(oAreaObject), "outcast") >= 0) || (GetTag(oAreaObject) == "Igear"))) {
			sub1(oAreaObject, 0.0);
			(int1++);
		}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
	location location1 = GetLocation(GetObjectByTag("tar_cut_actor1_wp", 0));
	location location3 = GetLocation(GetObjectByTag("tar_cut_actor2_wp", 0));
	location location5 = GetLocation(GetObjectByTag("tar_cut_actor3_wp", 0));
	location location7 = GetLocation(GetObjectByTag("tar_cut_actor4_wp", 0));
	location location9 = GetLocation(GetObjectByTag("tar_cut_actor5_wp", 0));
	location location11 = GetLocation(GetObjectByTag("tar_cut_actor6_wp", 0));
	object oTar_cut_actor1 = CreateObject(1, "tar_cut_actor1", location1, 0);
	object oTar_cut_actor2 = CreateObject(1, "tar_cut_actor2", location3, 0);
	object oTar_cut_actor3 = CreateObject(1, "tar_cut_actor3", location5, 0);
	object oTar_cut_actor4 = CreateObject(1, "tar_cut_actor4", location7, 0);
	object oTar_cut_actor5 = CreateObject(1, "tar_cut_actor5", location9, 0);
	object oTar_cut_actor6 = CreateObject(1, "tar_cut_actor6", location11, 0);
	location location13 = GetLocation(GetObjectByTag("tar_cut_actor1_move_wp", 0));
	location location15 = GetLocation(GetObjectByTag("tar_cut_actor2_move_wp", 0));
	location location17 = GetLocation(GetObjectByTag("tar_cut_actor3_move_wp", 0));
	location location19 = GetLocation(GetObjectByTag("tar_cut_actor4_move_wp", 0));
	location location21 = GetLocation(GetObjectByTag("tar_cut_actor5_move_wp", 0));
	location location23 = GetLocation(GetObjectByTag("tar_cut_actor6_move_wp", 0));
	sub5(7.0);
	DelayCommand(0.1, AssignCommand(oTar_cut_actor1, ActionMoveToLocation(location13, 0)));
	DelayCommand(0.2, AssignCommand(oTar_cut_actor2, ActionMoveToLocation(location15, 0)));
	DelayCommand(0.3, AssignCommand(oTar_cut_actor3, ActionMoveToLocation(location17, 0)));
	DelayCommand(0.4, AssignCommand(oTar_cut_actor4, ActionMoveToLocation(location19, 0)));
	DelayCommand(0.5, AssignCommand(oTar_cut_actor5, ActionMoveToLocation(location21, 0)));
	DelayCommand(0.6, AssignCommand(oTar_cut_actor6, ActionMoveToLocation(location23, 0)));
}

