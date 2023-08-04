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
void sub1();

void sub1() {
	SetPartyLeader(0xFFFFFFFF);
	int int2 = 0;
	while ((int2 < 12)) {
		if (IsNPCPartyMember(int2)) {
			RemoveNPCFromPartyToBase(int2);
		}
		(int2++);
	}
}

void main() {
	int nParam1 = GetScriptParameter(1);
	object o202_rem;
	object oWP_batu_panel;
	object oD_Jail = GetObjectByTag("d_Jail", 0);
	if ((nParam1 == 1)) {
		SetLocked(oD_Jail, 0);
		AssignCommand(oD_Jail, ActionOpenDoor(oD_Jail));
		oWP_batu_panel = GetWaypointByTag("wp_202_gren_1");
		o202_rem = GetObjectByTag("202_gren", 0);
		DelayCommand(1.6, AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 0, 1.0)));
		oWP_batu_panel = GetWaypointByTag("wp_202_tsf1_1");
		o202_rem = GetObjectByTag("202_tsf1", 0);
		DelayCommand(1.9, AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 0, 1.0)));
		oWP_batu_panel = GetWaypointByTag("wp_202_tsf2_1");
		o202_rem = GetObjectByTag("202_tsf2", 0);
		DelayCommand(2.5, AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 0, 1.0)));
		DelayCommand(6.0, AssignCommand(oD_Jail, ActionCloseDoor(oD_Jail)));
		SetLocked(oD_Jail, 1);
	}
	else {
		if ((nParam1 == 2)) {
			CreateObject(1, "n_202_rem", GetLocation(GetObjectByTag("wp_batu_rem", 0)), 0);
			oWP_batu_panel = GetWaypointByTag("wp_store1");
			o202_rem = GetObjectByTag("202_gren", 0);
			AssignCommand(o202_rem, ActionJumpToObject(oWP_batu_panel, 1));
			oWP_batu_panel = GetWaypointByTag("wp_store2");
			o202_rem = GetObjectByTag("202_tsf1", 0);
			AssignCommand(o202_rem, ActionJumpToObject(oWP_batu_panel, 1));
			oWP_batu_panel = GetWaypointByTag("wp_store3");
			o202_rem = GetObjectByTag("202_tsf2", 0);
			AssignCommand(o202_rem, ActionJumpToObject(oWP_batu_panel, 1));
		}
		else {
			if ((nParam1 == 3)) {
				o202_rem = GetObjectByTag("202_rem", 0);
				SetLocked(oD_Jail, 0);
				DelayCommand(0.5, AssignCommand(oD_Jail, ActionOpenDoor(oD_Jail)));
			}
			else {
				if ((nParam1 == 4)) {
					oWP_batu_panel = GetWaypointByTag("wp_batu_rem_1");
					o202_rem = GetObjectByTag("202_rem", 0);
					AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 0, 1.0));
					DelayCommand(4.0, AssignCommand(oD_Jail, ActionCloseDoor(oD_Jail)));
					SetLocked(oD_Jail, 1);
					object oKreia = GetObjectByTag("kreia", 0);
					vector struct2 = GetPositionFromLocation(GetLocation(GetFirstPC()));
					AssignCommand(oKreia, SetFacingPoint(struct2));
					SetLockOrientationInDialog(oKreia, 1);
				}
				else {
					if ((nParam1 == 5)) {
						o202_rem = GetObjectByTag("202_rem", 0);
						oWP_batu_panel = GetWaypointByTag("wp_202_gren_1");
						o202_rem = GetObjectByTag("202_gren", 0);
						AssignCommand(o202_rem, ActionJumpToObject(oWP_batu_panel, 1));
						oWP_batu_panel = GetWaypointByTag("wp_202_tsf1_1");
						o202_rem = GetObjectByTag("202_tsf1", 0);
						AssignCommand(o202_rem, ActionJumpToObject(oWP_batu_panel, 1));
						oWP_batu_panel = GetWaypointByTag("wp_202_tsf2_1");
						o202_rem = GetObjectByTag("202_tsf2", 0);
						AssignCommand(o202_rem, ActionJumpToObject(oWP_batu_panel, 1));
						DestroyObject(GetObjectByTag("forcecage_kreia", 0), 0.0, 1, 0.0, 0);
						DestroyObject(GetObjectByTag("forcecage_atton", 0), 0.0, 1, 0.0, 0);
						DestroyObject(GetObjectByTag("forcecage_player", 0), 0.0, 1, 0.0, 0);
						DelayCommand(0.2, AssignCommand(GetObjectByTag("cage_player", 0), ActionPlayAnimation(202, 1.0, 0.0)));
						DelayCommand(0.2, AssignCommand(GetObjectByTag("cage_party", 0), ActionPlayAnimation(202, 1.0, 0.0)));
						DelayCommand(0.2, AssignCommand(GetObjectByTag("cage_party", 1), ActionPlayAnimation(202, 1.0, 0.0)));
						AddPartyMember(0, GetObjectByTag("atton", 0));
						AddPartyMember(6, GetObjectByTag("kreia", 0));
						DelayCommand(0.4, ChangeToStandardFaction(GetObjectByTag("202_rem", 0), 1));
						DelayCommand(0.5, AssignCommand(GetObjectByTag("202_rem", 0), ActionAttack(GetFirstPC(), 0)));
					}
					else {
						if ((nParam1 == 6)) {
							SetLocked(oD_Jail, 0);
							AssignCommand(oD_Jail, ActionOpenDoor(oD_Jail));
							oWP_batu_panel = GetWaypointByTag("wp_202_gren_2");
							o202_rem = GetObjectByTag("202_gren", 0);
							AssignCommand(o202_rem, ClearAllActions());
							DelayCommand(0.8, AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 1, 1.0)));
							oWP_batu_panel = GetWaypointByTag("wp_202_tsf1_2");
							o202_rem = GetObjectByTag("202_tsf1", 0);
							DelayCommand(1.2, AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 1, 1.0)));
							oWP_batu_panel = GetWaypointByTag("wp_202_tsf2_2");
							o202_rem = GetObjectByTag("202_tsf2", 0);
							DelayCommand(1.4, AssignCommand(o202_rem, ActionMoveToObject(oWP_batu_panel, 1, 1.0)));
						}
						else {
							if ((nParam1 == 7)) {
								SetGlobalNumber("202TEL_Spawn_Killers", 1);
								sub1();
								DelayCommand(1.0, SetGlobalFadeOut(1.0, 1.0, 0.0, 0.0, 0.0));
								DestroyObject(GetObjectByTag("202_tsf1", 0), 0.0, 0, 0.0, 0);
								DestroyObject(GetObjectByTag("202_tsf2", 0), 0.0, 0, 0.0, 0);
								DelayCommand(2.5, AssignCommand(GetObjectByTag("202_gren", 0), ActionJumpToObject(GetObjectByTag("wp_grenn", 0), 1)));
DelayCommand(2.0, SetLockOrientationInDialog(OBJECT_SELF, 0));
DelayCommand(2.0, AssignCommand(OBJECT_SELF,
            SetFacingPoint(GetPosition(
            GetObjectByTag("202_TSFDroid")))));

								DelayCommand(3.0, StartNewModule("203TEL", "From_202TEL_intro", "", "", "", "", "", ""));
							}
							else {
								if ((nParam1 == 8)) {
									AssignCommand(GetObjectByTag("kreia", 0), ActionPlayAnimation(35, 1.0, (-1.0)));
								}
								else {
									if ((nParam1 == 9)) {
										object object54 = GetObjectByTag("202_rem", 0);
										if (GetIsObjectValid(object54)) {
											oWP_batu_panel = GetObjectByTag("WP_batu_panel", 0);
											if (GetIsObjectValid(oWP_batu_panel)) {
												AssignCommand(object54, ActionForceMoveToObject(oWP_batu_panel, 0, 1.0, 30.0));
												AssignCommand(object54, ActionForceMoveToObject(GetObjectByTag("computerpanel", 0), 0, 1.0, 30.0));
												vector struct4 = GetPositionFromLocation(GetLocation(GetObjectByTag("computerpanel", 0)));
												AssignCommand(object54, ActionDoCommand(SetFacingPoint(struct4)));
												AssignCommand(object54, ActionPlayAnimation(15, 1.0, 2.0));
												object object59 = GetObjectByTag("wp_batu_rem_1", 0);
												struct4 = GetPositionFromLocation(GetLocation(GetFirstPC()));
												AssignCommand(object54, ActionDoCommand(SetFacingPoint(struct4)));
												AssignCommand(object54, ActionForceMoveToObject(object59, 0, 1.0, 30.0));
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

