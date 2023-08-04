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
void sub4(object objectParam1, int intParam2, int intParam3);
void sub3(object objectParam1, int intParam2, int intParam3);
void sub2(int intParam1);
int sub1(int intParam1, int intParam2);

void sub4(object objectParam1, int intParam2, int intParam3) {
	int int1;
	if (((!GetIsObjectValid(objectParam1)) || (intParam2 == 0))) {
		return;
	}
	if (intParam3) {
		intParam2 = (-intParam2);
	}
	int1 = GetItemStackSize(objectParam1);
	if ((intParam2 > 0)) {
		SetItemStackSize(objectParam1, (int1 + intParam2));
	}
	else {
		if (((int1 + intParam2) <= 0)) {
			SetItemStackSize(objectParam1, 1);
			DestroyObject(objectParam1, 0.0, 1, 0.0);
		}
		else {
			SetItemStackSize(objectParam1, (int1 + intParam2));
		}
	}
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

void sub2(int intParam1) {
	object object1 = GetItemPossessedBy(GetFirstPC(), "K_REPAIR_PART");
	if (GetIsObjectValid(object1)) {
		int int2 = GetItemStackSize(object1);
		if ((intParam1 < int2)) {
			intParam1 = (int2 - intParam1);
			SetItemStackSize(object1, intParam1);
		}
		else {
			if (((intParam1 > int2) || (intParam1 == int2))) {
				DestroyObject(object1, 0.0, 0, 0.0);
			}
		}
	}
}

int sub1(int intParam1, int intParam2) {
	float float1 = IntToFloat(GetSkillRank(intParam2, GetPartyMemberByIndex(0)));
	int int2;
	float1 = (float1 / 4.0);
	int2 = (intParam1 - FloatToInt(float1));
	if ((int2 < 1)) {
		if ((int2 <= (-3))) {
			int2 = 0;
		}
		else {
			int2 = 1;
		}
	}
	return int2;
}

void main() {
	int int1 = sub1(4, 5);
	sub2(int1);
	sub3(OBJECT_SELF, intGLOB_18, 1);
	effect efAttackInc = EffectAttackIncrease(4, 0);
	ApplyEffectToObject(2, efAttackInc, OBJECT_SELF, 0.0);
	object oPC = GetFirstPC();
	object oInvItem = GetFirstItemInInventory(oPC);
	while ((oInvItem != OBJECT_INVALID)) {
		if ((((GetTag(oInvItem) == "G_I_TRAPKIT004") || (GetTag(oInvItem) == "G_I_TRAPKIT005")) || (GetTag(oInvItem) == "G_I_TRAPKIT006"))) {
			sub4(oInvItem, 1, 1);
			return;
		}
		oInvItem = GetNextItemInInventory(oPC);
	}
}

