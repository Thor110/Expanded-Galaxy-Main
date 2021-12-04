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
int sub2(int intParam1);
int sub1(int intParam1, int intParam2);

int sub2(int intParam1) {
	string string1;
	int int1 = 0;
	if ((intParam1 == 0)) {
		string1 = "K_COMPUTER_SPIKE";
	}
	else {
		if ((intParam1 == 5)) {
			string1 = "K_REPAIR_PART";
		}
	}
	object object1 = GetItemPossessedBy(GetFirstPC(), string1);
	if (GetIsObjectValid(object1)) {
		int1 = GetNumStackedItems(object1);
	}
	return int1;
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

int StartingConditional() {
	if ((sub1(5, 5) <= sub2(5))) {
		return 1;
	}
	return 0;
}

