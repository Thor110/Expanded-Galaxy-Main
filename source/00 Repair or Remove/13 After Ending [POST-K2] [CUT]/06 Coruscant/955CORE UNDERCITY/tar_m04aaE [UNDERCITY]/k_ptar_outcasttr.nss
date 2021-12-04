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
void sub3(object objectParam1, int intParam2, int intParam3);
void sub2(object objectParam1, int intParam2, int intParam3);
int sub1(object objectParam1, int intParam2);

void sub3(object objectParam1, int intParam2, int intParam3) {
	int int1;
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	int1 = 0;
	while ((int1 < intParam3)) {
		switch (intParam2) {
			case 0:
				switch (Random(3)) {
					case 0:
						CreateItemOnObject("G_I_CREDITS001", objectParam1, (Random(20) + 1));
						break;
					case 1:
						CreateItemOnObject("G_I_DRDREPEQP001", objectParam1, 1);
						break;
					case 2:
						CreateItemOnObject("G_I_MEDEQPMNT04", objectParam1, 1);
						break;
					default:
						CreateItemOnObject("G_I_MEDEQPMNT01", objectParam1, 1);
				}
				break;
			case 1:
				switch (Random(11)) {
					case 0:
						CreateItemOnObject("G_W_BLSTRPSTL001", objectParam1, 1);
						break;
					case 1:
						CreateItemOnObject("G_I_SECSPIKE01", objectParam1, 1);
						break;
					case 2:
						CreateItemOnObject("G_I_PROGSPIKE01", objectParam1, 1);
						break;
					case 3:
						CreateItemOnObject("G_A_CLASS5001", objectParam1, 1);
						break;
					case 4:
						CreateItemOnObject("G_W_FRAGGREN01", objectParam1, 1);
						break;
					case 5:
						CreateItemOnObject("G_W_STUNGREN01", objectParam1, 1);
						break;
					case 6:
						CreateItemOnObject("G_W_IONGREN01", objectParam1, 1);
						break;
					case 7:
						CreateItemOnObject("G_W_SONICGREN01", objectParam1, 1);
						break;
					case 8:
						CreateItemOnObject("G_W_VBROSHORT01", objectParam1, 1);
						break;
					case 9:
						CreateItemOnObject("G_W_STUNBATON01", objectParam1, 1);
						break;
					default:
						CreateItemOnObject("G_I_CREDITS001", objectParam1, (Random(40) + 20));
						break;
				}
				break;
			case 2:
				switch (Random(5)) {
					case 0:
						CreateItemOnObject("G_W_BLSTRPSTL001", objectParam1, 1);
						break;
					case 1:
						CreateItemOnObject("G_W_QTRSTAFF01", objectParam1, 1);
						break;
					case 2:
						CreateItemOnObject("G_I_MEDEQPMNT01", objectParam1, 1);
						break;
					case 3:
						CreateItemOnObject("G_A_CLASS4001", objectParam1, 1);
						break;
					default:
						CreateItemOnObject("G_I_CREDITS001", objectParam1, (Random(20) + 1));
						break;
				}
				break;
		}
		(int1++);
	}
}

void sub2(object objectParam1, int intParam2, int intParam3) {
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

int sub1(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void main() {
	if ((!sub1(OBJECT_SELF, intGLOB_1))) {
		sub2(OBJECT_SELF, intGLOB_1, 1);
		sub3(OBJECT_SELF, 0, 3);
	}
}

