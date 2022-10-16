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
void sub1(string stringParam1, float floatParam2, int intParam3);

void sub1(string stringParam1, float floatParam2, int intParam3) {
	object oWP = GetWaypointByTag(stringParam1);
	object oPC = GetFirstPC();
	if (GetIsObjectValid(oWP)) {
		effect efVisual = EffectVisualEffect(3006, 0);
		ApplyEffectAtLocation(0, efVisual, GetLocation(oWP), 0.0);
		object oNearest = GetNearestCreature(0, 6, oWP, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
		int int2 = 1;
		while ((GetIsObjectValid(oNearest) && (GetDistanceBetween(oNearest, oWP) <= floatParam2))) {
			{
				float float2 = (3.0 + (IntToFloat(d10(1)) / 10.0));
				float float4 = ((float2 + 1.0) + (IntToFloat(d20(1)) / 10.0));
				if (((GetIsFriend(oNearest, oPC) || GetIsNeutral(oNearest, oPC)) && (intParam3 == 0))) {
					DelayCommand(float2, ApplyEffectToObject(1, EffectChoke(), oNearest, 3.0));
					DelayCommand(float4, ApplyEffectToObject(2, EffectPoison(2), oNearest, 0.0));
				}
				else {
				if ((GetIsEnemy(oNearest, oPC) || (intParam3 == 1))) {
					DelayCommand(float2, ApplyEffectToObject(1, EffectChoke(), oNearest, 10.0));
					DelayCommand(float4, ApplyEffectToObject(0, EffectDeath(0, 1), oNearest, 0.0));
				}
				}
				(int2++);
				oNearest = GetNearestCreature(0, 6, oWP, int2, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
			}
		}
	}
}

void main() {
	float float1 = 1.5;
	int int1;
	SetGlobalNumber("TAR_DAVGAS", (GetGlobalNumber("TAR_DAVGAS") | 4));
	int1 = 0;
	while ((int1 < 4)) {
		DelayCommand(float1, sub1(("tar08_wpgas2_" + IntToString(int1)), 10.0, 1));
		(int1++);
	}
	ActionPauseConversation();
	ActionWait(8.0);
	ActionResumeConversation();
}

