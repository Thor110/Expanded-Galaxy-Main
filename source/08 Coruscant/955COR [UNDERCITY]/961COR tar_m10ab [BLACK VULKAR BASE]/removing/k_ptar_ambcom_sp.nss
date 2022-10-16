// Globals
	int intGLOB_1 = 1;
	int intGLOB_2 = 2;
	int intGLOB_3 = 3;
	int intGLOB_4 = 4;
	int intGLOB_5 = 5;
	int intGLOB_6 = 3;
	int intGLOB_7 = 4;
	int intGLOB_8 = 5;
	int intGLOB_9 = 6;
	int intGLOB_10 = 1;
	int intGLOB_11 = 2;
	int intGLOB_12 = 3;
	int intGLOB_13 = 4;
	int intGLOB_14 = 5;
	int intGLOB_15 = 6;
	int intGLOB_16 = 7;
	int intGLOB_17 = 8;
	int intGLOB_18 = 9;
	int intGLOB_19 = 10;
	int intGLOB_20 = 11;
	int intGLOB_21 = 12;
	int intGLOB_22 = 13;
	int intGLOB_23 = 14;
	int intGLOB_24 = 15;
	int intGLOB_25 = 16;
	int intGLOB_26 = 17;
	int intGLOB_27 = 18;
	int intGLOB_28 = 19;
	int intGLOB_29 = 20;
	int intGLOB_30 = 21;
	int intGLOB_31 = 22;
	int intGLOB_32 = 23;
	int intGLOB_33 = 24;
	int intGLOB_34 = 25;
	int intGLOB_35 = 26;
	int intGLOB_36 = 27;
	int intGLOB_37 = 28;
	int intGLOB_38 = 29;
	int intGLOB_39 = 59;
	int intGLOB_40 = 0;
	int intGLOB_41 = 1;
	int intGLOB_42 = 2;
	int intGLOB_43 = 29;
	int intGLOB_44 = 30;
	int intGLOB_45 = 34;
	int intGLOB_46 = 35;
	int intGLOB_47 = 36;
	int intGLOB_48 = 37;
	int intGLOB_49 = 38;
	int intGLOB_50 = 39;
	int intGLOB_51 = 41;
	int intGLOB_52 = 42;
	int intGLOB_53 = 46;
	int intGLOB_54 = 47;
	int intGLOB_55 = 15;
	int intGLOB_56 = 10;
	int intGLOB_57 = 5;
	int intGLOB_58 = 2;
	int intGLOB_59;
	int intGLOB_60;
	int intGLOB_61;
	object objectGLOB_1;
	int intGLOB_62;
	int intGLOB_63;
	int intGLOB_64;
	int intGLOB_65;
	int intGLOB_66;
	int intGLOB_67;
	int intGLOB_68 = 1;
	int intGLOB_69 = 2;
	int intGLOB_70 = 3;
	int intGLOB_71 = 20;
	int intGLOB_72 = 21;
	int intGLOB_73 = 22;
	int intGLOB_74 = 23;
	int intGLOB_75 = 24;
	int intGLOB_76 = 25;
	int intGLOB_77 = 26;
	int intGLOB_78 = 27;
	int intGLOB_79 = 28;
	int intGLOB_80 = 31;
	int intGLOB_81 = 32;
	int intGLOB_82 = 33;
	int intGLOB_83 = 40;
	int intGLOB_84 = 43;
	int intGLOB_85 = 44;
	int intGLOB_86 = 45;
	int intGLOB_87 = 48;
	int intGLOB_88 = 49;
	int intGLOB_89 = 50;
	int intGLOB_90 = 51;
	int intGLOB_91 = 52;
	int intGLOB_92 = 53;
	int intGLOB_93 = 54;
	int intGLOB_94 = 55;
	int intGLOB_95 = 56;
	int intGLOB_96 = 57;
	int intGLOB_97 = 58;
	int intGLOB_98 = 60;
	int intGLOB_99 = 61;
	int intGLOB_100 = 62;
	int intGLOB_101 = 63;
	int intGLOB_102 = 64;
	int intGLOB_103 = 65;
	int intGLOB_104 = 66;
	int intGLOB_105 = 67;
	int intGLOB_106 = 68;
	int intGLOB_107 = 1;
	int intGLOB_108 = 2;
	int intGLOB_109 = 3;
	int intGLOB_110 = 4;

// Prototypes
void sub14();
int sub13(int intParam1, int intParam2);
int sub12(int intParam1);
void sub11();
void sub10();
void sub9();
void sub8();
void sub7();
void sub6(object objectParam1);
int sub5(object objectParam1);
void sub4();
void sub3();
void sub2(int intParam1);
void sub1(int intParam1, int intParam2);

void sub14() {
	int nRandom = d8(1);
	if ((nRandom == 1)) {
		ActionPlayAnimation(103, 1.0, 0.0);
	}
	else {
		if ((nRandom == 2)) {
			ActionPlayAnimation(102, 1.0, 0.0);
		}
		else {
			if ((nRandom == 3)) {
				ActionPlayAnimation(1, 1.0, 3.0);
			}
			else {
				if ((((nRandom == 4) || (nRandom == 5)) && (GetRacialType(OBJECT_SELF) != 5))) {
					if ((GetGender(OBJECT_SELF) == 0)) {
						sub1(intGLOB_43, 0);
						ActionPlayAnimation(24, 1.0, 20.4);
						ActionDoCommand(sub1(intGLOB_43, 1));
					}
					else {
						if ((GetGender(OBJECT_SELF) == 1)) {
							sub1(intGLOB_43, 0);
							ActionPlayAnimation(24, 1.0, 13.3);
							ActionDoCommand(sub1(intGLOB_43, 1));
						}
					}
				}
				else {
					if ((((nRandom == 6) || (nRandom == 4)) || (nRandom == 5))) {
						ActionPlayAnimation(100, 1.0, 0.0);
					}
					else {
						if ((nRandom == 7)) {
							ActionPlayAnimation(101, 1.0, 0.0);
						}
						else {
							if ((nRandom == 8)) {
								sub1(intGLOB_43, 0);
								ActionPlayAnimation(1, 1.0, 5.0);
								ActionDoCommand(sub1(intGLOB_43, 1));
							}
						}
					}
				}
			}
		}
	}
}

int sub13(int intParam1, int intParam2) {
	int int1;
	int int2 = sub12(intGLOB_51);
	if (((intParam1 == intParam2) && (int2 == 0))) {
		int1 = (-1);
		sub1(intGLOB_51, 1);
	}
	else {
		if (((intParam2 == 1) && (int2 == 1))) {
			int1 = 1;
			sub1(intGLOB_51, 0);
		}
		else {
			if ((int2 == 0)) {
				int1 = 1;
			}
			else {
				if ((int2 == 1)) {
					int1 = (-1);
				}
			}
		}
	}
	return int1;
}

int sub12(int intParam1) {
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, intParam1);
	if ((nLocalBool > 0)) {
		return 1;
	}
	return 0;
}

void sub11() {
	if ((!sub12(intGLOB_52))) {
		string string1 = "POST_";
		string string2 = "WP_";
		string string3;
		int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_40);
		int int4 = GetLocalNumber(OBJECT_SELF, intGLOB_41);
		int int6 = GetLocalNumber(OBJECT_SELF, intGLOB_42);
		if (((nLocal < 10) && (nLocal > 0))) {
			string3 = ("0" + IntToString(nLocal));
		}
		else {
			if ((nLocal == 0)) {
				if (sub12(intGLOB_49)) {
					nLocal = (Random(int4) + 1);
					if ((nLocal < 10)) {
						string3 = ("0" + IntToString(nLocal));
					}
					else {
						string3 = IntToString(nLocal);
					}
				}
				else {
					string3 = "01";
				}
			}
			else {
				if ((nLocal < 10)) {
					string3 = ("0" + IntToString(nLocal));
				}
				else {
					string3 = IntToString(nLocal);
				}
			}
		}
		string string9;
		string string10;
		if ((int6 > 0)) {
			string string11;
			if ((int6 < 10)) {
				string11 = ("0" + IntToString(int6));
			}
			else {
				string11 = IntToString(int6);
			}
			string10 = ((string2 + string11) + "_02");
		}
		else {
			string10 = ((string2 + GetTag(OBJECT_SELF)) + "_02");
		}
		object oWP = GetWaypointByTag(string10);
		if (((int4 == 0) && GetIsObjectValid(oWP))) {
		}
		if (GetIsObjectValid(oWP)) {
			int nLen = GetStringLength(string10);
			string9 = (GetStringLeft(string10, (nLen - 2)) + string3);
		}
		else {
			string2 = "UNKNOWN";
			string9 = (string1 + GetTag(OBJECT_SELF));
		}
		object object3 = GetWaypointByTag(string9);
		int int14 = sub12(intGLOB_50);
		if ((GetDistanceToObject2D(object3) <= 2.5)) {
			int int16;
			if (sub12(intGLOB_49)) {
				nLocal = (Random(int4) + 1);
			}
			else {
				if (((nLocal < int4) && (!sub12(intGLOB_49)))) {
					int16 = sub13(int4, nLocal);
					nLocal = (nLocal + int16);
				}
				else {
					if ((nLocal == int4)) {
						int16 = sub13(int4, nLocal);
						if (sub12(intGLOB_45)) {
							sub1(intGLOB_52, 1);
						}
						else {
							if (sub12(intGLOB_46)) {
								nLocal = 1;
								sub1(intGLOB_51, 0);
							}
							else {
								nLocal = (nLocal + int16);
							}
						}
					}
				}
			}
		}
		if (GetIsObjectValid(GetWaypointByTag(string9))) {
			int nRandom;
			if (sub12(intGLOB_48)) {
				nRandom = d3(1);
			}
			else {
				if (sub12(intGLOB_53)) {
					nRandom = (d6(1) + 6);
				}
				else {
					if (sub12(intGLOB_54)) {
						nRandom = d12(1);
					}
					else {
						if ((nRandom > 0)) {
							PrintString("Wait being added to stack");
							ActionWait(IntToFloat(nRandom));
						}
					}
				}
			}
			object3 = GetWaypointByTag(string9);
			float float3 = (GetDistanceBetween2D(GetWaypointByTag(string9), OBJECT_SELF) / 1.25);
			if ((float3 < 30.0)) {
				float3 = 30.0;
			}
			ActionForceMoveToObject(object3, sub12(intGLOB_50), 2.5, float3);
			if (sub12(intGLOB_43)) {
				ActionDoCommand(sub14());
			}
			SetLocalNumber(OBJECT_SELF, intGLOB_40, nLocal);
			if ((string2 != "UNKNOWN")) {
				ActionDoCommand(sub11());
			}
		}
	}
}

void sub10() {
	string string1;
	int int1 = 1;
	int nRandom = Random(6);
	switch (nRandom) {
		case 0:
			string1 = "g_i_drdrepeqp001";
			break;
		case 1:
			string1 = "g_i_credits001";
			int1 = 5;
			sub9();
			break;
		case 2:
			string1 = "g_i_credits002";
			int1 = 10;
			sub9();
			break;
		case 3:
			string1 = "g_i_credits003";
			int1 = 25;
			sub9();
			break;
		case 4:
			string1 = "g_i_medeqpmnt01";
			break;
		case 5:
			string1 = "g_w_fraggren01";
			break;
	}
	CreateItemOnObject(string1, OBJECT_SELF, int1);
}

void sub9() {
	CreateItemOnObject("g_i_credits015", OBJECT_SELF, (Random(4) + 1));
}

void sub8() {
	string string1;
	int int1 = 1;
	int nRandom = Random(15);
	switch (nRandom) {
		case 0:
			string1 = "g_i_drdrepeqp002";
			break;
		case 1:
			string1 = "g_i_credits004";
			int1 = 50;
			sub9();
			break;
		case 2:
			string1 = "g_i_medeqpmnt02";
			break;
		case 3:
			string1 = "g_i_cmbtshot001";
			break;
		case 4:
			string1 = "g_i_adrnaline003";
			break;
		case 5:
			string1 = "g_i_adrnaline002";
			break;
		case 6:
			string1 = "g_i_adrnaline001";
			break;
		case 7:
			string1 = "g_w_stungren01";
			int1 = 2;
			break;
		case 8:
			string1 = "g_w_fraggren01";
			int1 = 2;
			break;
		case 9:
			string1 = "g_w_poisngren01";
			break;
		case 10:
			string1 = "g_w_sonicgren01";
			break;
		case 11:
			string1 = "g_w_adhsvgren001";
			break;
		case 12:
			string1 = "g_w_cryobgren001";
			break;
		case 13:
			string1 = "g_w_firegren001";
			break;
		case 14:
			string1 = "g_w_iongren01";
			break;
	}
	CreateItemOnObject(string1, OBJECT_SELF, int1);
}

void sub7() {
	string string1;
	int int1 = 1;
	int nRandom = Random(15);
	switch (nRandom) {
		case 0:
			string1 = "g_i_drdrepeqp001";
			break;
		case 1:
			string1 = "g_w_thermldet01";
			break;
		case 2:
			string1 = "g_i_medeqpmnt03";
			break;
		case 3:
			string1 = "g_i_cmbtshot003";
			break;
		case 4:
			string1 = "g_i_cmbtshot002";
			break;
		case 5:
			string1 = "g_i_adrnaline005";
			break;
		case 6:
			string1 = "g_i_adrnaline005";
			break;
		case 7:
			string1 = "g_i_adrnaline004";
			break;
		case 8:
			string1 = "g_w_poisngren01";
			int1 = 2;
			break;
		case 9:
			string1 = "g_w_sonicgren01";
			int1 = 2;
			break;
		case 10:
			string1 = "g_w_adhsvgren001";
			int1 = 2;
			break;
		case 11:
			string1 = "g_w_cryobgren001";
			int1 = 2;
			break;
		case 12:
			string1 = "g_w_firegren001";
			int1 = 2;
			break;
		case 13:
			string1 = "g_w_iongren01";
			int1 = 2;
			break;
		case 14:
			string1 = "g_i_credits015";
			int1 = (Random(50) + 50);
			break;
	}
	CreateItemOnObject(string1, OBJECT_SELF, int1);
}

void sub6(object objectParam1) {
	int nLevel = GetHitDice(objectParam1);
	if ((nLevel > intGLOB_55)) {
		sub7();
		if ((Random(2) == 0)) {
			sub7();
		}
		if ((Random(2) == 0)) {
			sub8();
		}
	}
	else {
		if (((nLevel <= intGLOB_55) && (nLevel > intGLOB_56))) {
			sub8();
			if ((Random(3) == 0)) {
				sub7();
			}
			if ((Random(2) == 0)) {
				sub8();
			}
		}
		else {
			if (((nLevel <= intGLOB_56) && (nLevel > intGLOB_57))) {
				sub8();
				if ((Random(2) == 0)) {
					sub10();
				}
			}
			else {
				sub10();
				if ((Random(3) == 0)) {
					sub10();
				}
				if ((Random(4) == 0)) {
					sub8();
				}
			}
		}
	}
}

int sub5(object objectParam1) {
	int nRace = GetRacialType(objectParam1);
	int int3 = GetStandardFaction(objectParam1);
	int int5 = GetSubRace(objectParam1);
	if ((((Random(4) == 0) && (nRace != 5)) && (int5 != intGLOB_58))) {
		sub6(objectParam1);
		return 1;
	}
	return 0;
}

void sub4() {
	string string1;
	int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_42);
	if ((nLocal > 0)) {
		string string2;
		if ((nLocal < 10)) {
			string2 = ("0" + IntToString(nLocal));
		}
		else {
			string2 = IntToString(nLocal);
		}
		string1 = ("WP_" + string2);
	}
	else {
		string1 = ("WP_" + GetTag(OBJECT_SELF));
	}
	int int3 = 1;
	string string6 = (string1 + "_01");
	object oWP = GetWaypointByTag(string6);
	while (GetIsObjectValid(oWP)) {
		(int3++);
		if ((int3 < 10)) {
			string6 = ((string1 + "_0") + IntToString(int3));
		}
		else {
			string6 = ((string1 + "_") + IntToString(int3));
		}
		oWP = GetWaypointByTag(string6);
	}
	int3 = (int3 - 1);
	if ((int3 > 0)) {
		SetLocalNumber(OBJECT_SELF, intGLOB_41, int3);
	}
}

void sub3() {
	SetListening(OBJECT_SELF, 1);
	SetListenPattern(OBJECT_SELF, "GEN_I_WAS_ATTACKED", 1);
	SetListenPattern(OBJECT_SELF, "GEN_I_AM_DEAD", 3);
	SetListenPattern(OBJECT_SELF, "GEN_CALL_TO_ARMS", 6);
	if ((GetHasSpell(48, OBJECT_SELF) || GetHasSpell(19, OBJECT_SELF))) {
		SetListenPattern(OBJECT_SELF, "GEN_SUPRESS_FORCE", 9);
	}
	SetListenPattern(OBJECT_SELF, "GEN_GRENADE_TOSSED", 12);
	SetListenPattern(OBJECT_SELF, "GEN_I_SEE_AN_ENEMY", 14);
	SetListenPattern(OBJECT_SELF, "GEN_COMBAT_ACTIVE", 15);
	sub4();
	sub5(OBJECT_SELF);
}

void sub2(int intParam1) {
}

void sub1(int intParam1, int intParam2) {
	SetLocalBoolean(OBJECT_SELF, intParam1, intParam2);
}

void main() {
	sub1(intGLOB_43, 1);
	sub2(intGLOB_70);
	sub3();
	sub11();
}

