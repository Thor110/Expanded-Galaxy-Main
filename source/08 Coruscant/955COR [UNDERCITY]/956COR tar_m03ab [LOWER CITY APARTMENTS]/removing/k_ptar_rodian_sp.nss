// Globals
	int intGLOB_1 = 1;
	int intGLOB_2 = 2;
	int intGLOB_3 = 3;
	int intGLOB_4 = 4;
	int intGLOB_5 = 5;
	int intGLOB_6 = 6;
	int intGLOB_7 = 3;
	int intGLOB_8 = 4;
	int intGLOB_9 = 5;
	int intGLOB_10 = 6;
	int intGLOB_11 = 7;
	int intGLOB_12 = 1;
	int intGLOB_13 = 2;
	int intGLOB_14 = 3;
	int intGLOB_15 = 4;
	int intGLOB_16 = 5;
	int intGLOB_17 = 6;
	int intGLOB_18 = 7;
	int intGLOB_19 = 8;
	int intGLOB_20 = 9;
	int intGLOB_21 = 10;
	int intGLOB_22 = 11;
	int intGLOB_23 = 12;
	int intGLOB_24 = 13;
	int intGLOB_25 = 14;
	int intGLOB_26 = 15;
	int intGLOB_27 = 16;
	int intGLOB_28 = 17;
	int intGLOB_29 = 18;
	int intGLOB_30 = 19;
	int intGLOB_31 = 20;
	int intGLOB_32 = 21;
	int intGLOB_33 = 22;
	int intGLOB_34 = 23;
	int intGLOB_35 = 24;
	int intGLOB_36 = 25;
	int intGLOB_37 = 26;
	int intGLOB_38 = 27;
	int intGLOB_39 = 28;
	int intGLOB_40 = 29;
	int intGLOB_41 = 30;
	int intGLOB_42 = 59;
	int intGLOB_43 = 0;
	int intGLOB_44 = 1;
	int intGLOB_45 = 2;
	int intGLOB_46 = 29;
	int intGLOB_47 = 30;
	int intGLOB_48 = 34;
	int intGLOB_49 = 35;
	int intGLOB_50 = 36;
	int intGLOB_51 = 37;
	int intGLOB_52 = 38;
	int intGLOB_53 = 39;
	int intGLOB_54 = 41;
	int intGLOB_55 = 42;
	int intGLOB_56 = 46;
	int intGLOB_57 = 47;
	int intGLOB_58 = 15;
	int intGLOB_59 = 10;
	int intGLOB_60 = 5;
	int intGLOB_61 = 2;
	int intGLOB_62;
	int intGLOB_63;
	int intGLOB_64;
	object objectGLOB_1;
	int intGLOB_65;
	int intGLOB_66;
	int intGLOB_67;
	int intGLOB_68;
	int intGLOB_69;
	int intGLOB_70;
	int intGLOB_71 = 1;
	int intGLOB_72 = 2;
	int intGLOB_73 = 3;
	int intGLOB_74 = 20;
	int intGLOB_75 = 21;
	int intGLOB_76 = 22;
	int intGLOB_77 = 23;
	int intGLOB_78 = 24;
	int intGLOB_79 = 25;
	int intGLOB_80 = 26;
	int intGLOB_81 = 27;
	int intGLOB_82 = 28;
	int intGLOB_83 = 31;
	int intGLOB_84 = 32;
	int intGLOB_85 = 33;
	int intGLOB_86 = 40;
	int intGLOB_87 = 43;
	int intGLOB_88 = 44;
	int intGLOB_89 = 45;
	int intGLOB_90 = 48;
	int intGLOB_91 = 49;
	int intGLOB_92 = 50;
	int intGLOB_93 = 51;
	int intGLOB_94 = 52;
	int intGLOB_95 = 53;
	int intGLOB_96 = 54;
	int intGLOB_97 = 55;
	int intGLOB_98 = 56;
	int intGLOB_99 = 57;
	int intGLOB_100 = 58;
	int intGLOB_101 = 60;
	int intGLOB_102 = 61;
	int intGLOB_103 = 62;
	int intGLOB_104 = 63;
	int intGLOB_105 = 64;
	int intGLOB_106 = 65;
	int intGLOB_107 = 66;
	int intGLOB_108 = 67;
	int intGLOB_109 = 68;
	int intGLOB_110 = 69;
	int intGLOB_111 = 70;
	int intGLOB_112 = 71;
	int intGLOB_113 = 72;
	int intGLOB_114 = 1;
	int intGLOB_115 = 2;
	int intGLOB_116 = 3;
	int intGLOB_117 = 4;

// Prototypes
void sub14();
int sub13(int intParam1, int intParam2);
void sub12();
int sub11(int intParam1);
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
						sub1(intGLOB_46, 0);
						ActionPlayAnimation(24, 1.0, 20.4);
						ActionDoCommand(sub1(intGLOB_46, 1));
					}
					else {
						if ((GetGender(OBJECT_SELF) == 1)) {
							sub1(intGLOB_46, 0);
							ActionPlayAnimation(24, 1.0, 13.3);
							ActionDoCommand(sub1(intGLOB_46, 1));
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
								sub1(intGLOB_46, 0);
								ActionPlayAnimation(1, 1.0, 5.0);
								ActionDoCommand(sub1(intGLOB_46, 1));
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
	int int2 = sub11(intGLOB_54);
	if (((intParam1 == intParam2) && (int2 == 0))) {
		int1 = (-1);
		sub1(intGLOB_54, 1);
	}
	else {
		if (((intParam2 == 1) && (int2 == 1))) {
			int1 = 1;
			sub1(intGLOB_54, 0);
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

void sub12() {
	if ((!sub11(intGLOB_55))) {
		string string1 = "POST_";
		string string2 = "WP_";
		string string3;
		int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_43);
		int int4 = GetLocalNumber(OBJECT_SELF, intGLOB_44);
		int int6 = GetLocalNumber(OBJECT_SELF, intGLOB_45);
		if (((nLocal < 10) && (nLocal > 0))) {
			string3 = ("0" + IntToString(nLocal));
		}
		else {
			if ((nLocal == 0)) {
				if (sub11(intGLOB_52)) {
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
		int int14 = sub11(intGLOB_53);
		if ((GetDistanceToObject2D(object3) <= 2.5)) {
			int int16;
			if (sub11(intGLOB_52)) {
				nLocal = (Random(int4) + 1);
			}
			else {
				if (((nLocal < int4) && (!sub11(intGLOB_52)))) {
					int16 = sub13(int4, nLocal);
					nLocal = (nLocal + int16);
				}
				else {
					if ((nLocal == int4)) {
						int16 = sub13(int4, nLocal);
						if (sub11(intGLOB_48)) {
							sub1(intGLOB_55, 1);
						}
						else {
							if (sub11(intGLOB_49)) {
								nLocal = 1;
								sub1(intGLOB_54, 0);
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
			if (sub11(intGLOB_51)) {
				nRandom = d3(1);
			}
			else {
				if (sub11(intGLOB_56)) {
					nRandom = (d6(1) + 6);
				}
				else {
					if (sub11(intGLOB_57)) {
						nRandom = d12(1);
					}
					else {
						if ((nRandom > 0)) {
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
			ActionForceMoveToObject(object3, sub11(intGLOB_53), 2.5, float3);
			if (sub11(intGLOB_46)) {
				ActionDoCommand(sub14());
			}
			SetLocalNumber(OBJECT_SELF, intGLOB_43, nLocal);
			if ((string2 != "UNKNOWN")) {
				ActionDoCommand(sub12());
			}
		}
	}
}

int sub11(int intParam1) {
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, intParam1);
	if ((nLocalBool > 0)) {
		return 1;
	}
	return 0;
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
			string1 = "g_w_iongren01";
			break;
	}
	CreateItemOnObject(string1, OBJECT_SELF, int1);
}

void sub7() {
	string string1;
	int int1 = 1;
	int nRandom = Random(16);
	switch (nRandom) {
		case 0:
			string1 = "g_i_drdrepeqp003";
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
			string1 = "g_i_adrnaline006";
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
		case 15:
			string1 = "g_w_firegren001";
			break;
	}
	CreateItemOnObject(string1, OBJECT_SELF, int1);
}

void sub6(object objectParam1) {
	int nLevel = GetHitDice(objectParam1);
	if ((nLevel > intGLOB_58)) {
		sub7();
		if ((Random(2) == 0)) {
			sub7();
		}
		if ((Random(2) == 0)) {
			sub8();
		}
	}
	else {
		if (((nLevel <= intGLOB_58) && (nLevel > intGLOB_59))) {
			sub8();
			if ((Random(3) == 0)) {
				sub7();
			}
			if ((Random(2) == 0)) {
				sub8();
			}
		}
		else {
			if (((nLevel <= intGLOB_59) && (nLevel > intGLOB_60))) {
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
	if ((((Random(4) == 0) && (nRace != 5)) && (int5 != intGLOB_61))) {
		sub6(objectParam1);
		return 1;
	}
	return 0;
}

void sub4() {
	string string1;
	int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_45);
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
		SetLocalNumber(OBJECT_SELF, intGLOB_44, int3);
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
	string string1 = GetTag(OBJECT_SELF);
	if (((((((((((string1 != "Carth") && (string1 != "Bastila")) && (string1 != "Cand")) && (string1 != "HK47")) && (string1 != "Jolee")) && (string1 != "Juhani")) && (string1 != "Mission")) && (string1 != "T3M4")) && (string1 != "Zaalbar")) && (!GetIsPC(OBJECT_SELF)))) {
		sub5(OBJECT_SELF);
	}
	if ((sub11(intGLOB_112) || GetIsEncounterCreature(OBJECT_SELF))) {
		string string3;
		int int7 = 1;
		object object1;
		object object2;
		float fDistance;
		float float2 = 100.0;
		int7;
		while ((int7 < 40)) {
			if ((int7 < 10)) {
				string3 = (("ZoneController" + "0") + IntToString(int7));
			}
			else {
				string3 = ("ZoneController" + IntToString(int7));
			}
			object2 = GetObjectByTag(string3, 0);
			if (GetIsObjectValid(object2)) {
				fDistance = GetDistanceBetween(OBJECT_SELF, object2);
				if ((fDistance < float2)) {
					float2 = fDistance;
					object1 = object2;
				}
			}
			(int7++);
		}
		if ((GetIsObjectValid(object1) && (float2 < 30.0))) {
			int int10 = StringToInt(GetStringRight(GetTag(object1), 2));
			SetLocalNumber(OBJECT_SELF, intGLOB_11, int10);
		}
	}
}

void sub2(int intParam1) {
}

void sub1(int intParam1, int intParam2) {
	SetLocalBoolean(OBJECT_SELF, intParam1, intParam2);
}

void main() {
	sub1(intGLOB_46, 1);
	sub1(intGLOB_81, 1);
	sub2(intGLOB_73);
	sub3();
	sub12();
}

