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
	int intGLOB_12 = 8;
	int intGLOB_13 = 9;
	int intGLOB_14 = 10;
	int intGLOB_15 = 11;
	int intGLOB_16 = 1;
	int intGLOB_17 = 2;
	int intGLOB_18 = 3;
	int intGLOB_19 = 4;
	int intGLOB_20 = 5;
	int intGLOB_21 = 6;
	int intGLOB_22 = 7;
	int intGLOB_23 = 8;
	int intGLOB_24 = 9;
	int intGLOB_25 = 10;
	int intGLOB_26 = 11;
	int intGLOB_27 = 12;
	int intGLOB_28 = 13;
	int intGLOB_29 = 14;
	int intGLOB_30 = 15;
	int intGLOB_31 = 16;
	int intGLOB_32 = 17;
	int intGLOB_33 = 18;
	int intGLOB_34 = 19;
	int intGLOB_35 = 20;
	int intGLOB_36 = 21;
	int intGLOB_37 = 22;
	int intGLOB_38 = 23;
	int intGLOB_39 = 24;
	int intGLOB_40 = 25;
	int intGLOB_41 = 26;
	int intGLOB_42 = 27;
	int intGLOB_43 = 28;
	int intGLOB_44 = 29;
	int intGLOB_45 = 30;
	int intGLOB_46 = 31;
	int intGLOB_47 = 32;
	int intGLOB_48 = 84;
	int intGLOB_49 = 0;
	int intGLOB_50 = 1;
	int intGLOB_51 = 2;
	int intGLOB_52 = 29;
	int intGLOB_53 = 65;
	int intGLOB_54 = 98;
	int intGLOB_55 = 99;
	int intGLOB_56 = 100;
	int intGLOB_57 = 101;
	int intGLOB_58 = 103;
	int intGLOB_59 = 104;
	int intGLOB_60 = 105;
	int intGLOB_61 = 106;
	int intGLOB_62 = 102;
	int intGLOB_63 = 107;
	int intGLOB_64 = 108;
	int intGLOB_65 = 102;
	int intGLOB_66 = 107;
	int intGLOB_67 = 108;
	int intGLOB_68 = 109;
	int intGLOB_69 = 15;
	int intGLOB_70 = 10;
	int intGLOB_71 = 5;
	int intGLOB_72 = 2;
	int intGLOB_73;
	int intGLOB_74;
	int intGLOB_75;
	object objectGLOB_1;
	int intGLOB_76;
	int intGLOB_77;
	int intGLOB_78;
	int intGLOB_79;
	int intGLOB_80;
	int intGLOB_81;
	int intGLOB_82 = 1;
	int intGLOB_83 = 2;
	int intGLOB_84 = 3;
	int intGLOB_85 = 20;
	int intGLOB_86 = 21;
	int intGLOB_87 = 22;
	int intGLOB_88 = 23;
	int intGLOB_89 = 24;
	int intGLOB_90 = 25;
	int intGLOB_91 = 26;
	int intGLOB_92 = 27;
	int intGLOB_93 = 28;
	int intGLOB_94 = 66;
	int intGLOB_95 = 67;
	int intGLOB_96 = 68;
	int intGLOB_97 = 69;
	int intGLOB_98 = 70;
	int intGLOB_99 = 71;
	int intGLOB_100 = 72;
	int intGLOB_101 = 73;
	int intGLOB_102 = 74;
	int intGLOB_103 = 75;
	int intGLOB_104 = 76;
	int intGLOB_105 = 77;
	int intGLOB_106 = 78;
	int intGLOB_107 = 79;
	int intGLOB_108 = 80;
	int intGLOB_109 = 81;
	int intGLOB_110 = 82;
	int intGLOB_111 = 83;
	int intGLOB_112 = 85;
	int intGLOB_113 = 86;
	int intGLOB_114 = 87;
	int intGLOB_115 = 88;
	int intGLOB_116 = 89;
	int intGLOB_117 = 90;
	int intGLOB_118 = 91;
	int intGLOB_119 = 92;
	int intGLOB_120 = 94;
	int intGLOB_121 = 95;
	int intGLOB_122 = 96;
	int intGLOB_123 = 97;
	int intGLOB_124 = 1;
	int intGLOB_125 = 2;
	int intGLOB_126 = 3;
	int intGLOB_127 = 4;
	int intGLOB_128 = 5;

// Prototypes
void sub3(object objectParam1, int intParam2);
void sub2(object objectParam1, object objectParam2, int intParam3);
void sub1(object objectParam1, int intParam2);

void sub3(object objectParam1, int intParam2) {
	if (intParam2) {
		SetMinOneHP(objectParam1, 0);
		ApplyEffectToObject(0, EffectDamage((GetCurrentHitPoints(objectParam1) - 1), 8, 0), objectParam1, 0.0);
	}
	ApplyEffectToObject(1, EffectAssuredHit(), OBJECT_SELF, 3.0);
	ActionAttack(objectParam1, 0);
}

void sub2(object objectParam1, object objectParam2, int intParam3) {
	if (((!GetIsObjectValid(objectParam1)) || (!GetIsObjectValid(objectParam2)))) {
		return;
	}
	AssignCommand(objectParam1, ActionDoCommand(sub3(objectParam2, intParam3)));
}

void sub1(object objectParam1, int intParam2) {
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	SetLocalBoolean(objectParam1, intGLOB_114, 1);
	AurPostString(("TURNING AI OFF - " + GetTag(objectParam1)), 5, 5, 5.0);
	ChangeToStandardFaction(objectParam1, intParam2);
	SetMinOneHP(objectParam1, 1);
}

void main() {
	int nParam1 = GetScriptParameter(1);
	object oMerc01 = GetObjectByTag("merc01", 0);
	object object3 = GetObjectByTag("merc01", 1);
	object oSullustan = GetObjectByTag("sullustan", 0);
	object oGuard = GetObjectByTag("guard", 0);
	object oGuard2 = GetObjectByTag("guard", 1);
	object oGuard3 = GetObjectByTag("guard", 2);
	object oWp_merc_exit = GetObjectByTag("wp_merc_exit", 0);
	switch (nParam1) {
		case 0:
			AssignCommand(oMerc01, ClearAllActions());
			AssignCommand(object3, ClearAllActions());
			DelayCommand(0.5, AssignCommand(oMerc01, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
			DelayCommand(0.5, AssignCommand(object3, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
			DelayCommand(0.8, ActionDoCommand(ChangeToStandardFaction(oMerc01, 1)));
			DelayCommand(0.8, ActionDoCommand(ChangeToStandardFaction(object3, 1)));
			DelayCommand(0.8, ActionDoCommand(ChangeToStandardFaction(oGuard, 2)));
			DelayCommand(0.8, ActionDoCommand(ChangeToStandardFaction(oGuard2, 2)));
			DelayCommand(0.8, ActionDoCommand(ChangeToStandardFaction(oGuard3, 2)));
			break;
		case 1:
			ChangeToStandardFaction(oSullustan, 2);
			AssignCommand(oSullustan, ActionPlayAnimation(18, 1.0, (-1.0)));
			sub1(oMerc01, 4);
			sub1(object3, 4);
			DelayCommand(0.5, sub2(oMerc01, oSullustan, 0));
			DelayCommand(0.6, AssignCommand(object3, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
			DelayCommand(1.1, AssignCommand(object3, ActionDoCommand(CutsceneAttack(oSullustan, 217, 3, GetCurrentHitPoints(oSullustan)))));
			DelayCommand(4.1, AssignCommand(oMerc01, ClearAllActions()));
			DelayCommand(4.1, AssignCommand(object3, ClearAllActions()));
			DelayCommand(4.2, AssignCommand(oMerc01, ActionMoveToObject(oWp_merc_exit, 1, 1.0)));
			DelayCommand(4.2, AssignCommand(oMerc01, DelayCommand(5.0, DestroyObject(oMerc01, 0.0, 1, 0.0, 0))));
			DelayCommand(4.2, AssignCommand(object3, ActionMoveToObject(oWp_merc_exit, 1, 1.0)));
			DelayCommand(4.2, AssignCommand(object3, DelayCommand(5.0, DestroyObject(object3, 0.0, 1, 0.0, 0))));
			break;
		case 2:
			break;
		case 3:
			AssignCommand(oSullustan, ClearAllActions());
			AssignCommand(oSullustan, DelayCommand(0.2, ActionMoveToObject(oWp_merc_exit, 1, 1.0)));
			AssignCommand(oSullustan, DelayCommand(5.0, DestroyObject(oSullustan, 0.0, 1, 0.0, 0)));
			break;
		case 4:
			DelayCommand(0.5, AssignCommand(oSullustan, ActionPlayAnimation(18, 1.0, (-1.0))));
			break;
	}
}

