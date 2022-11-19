void main() {
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 1)) {
		object oGrenn = GetObjectByTag("Grenn", 0);
		object oRepublic_Grenn = GetObjectByTag("Republic_Grenn", 0);
		AssignCommand(oGrenn, ActionJumpToLocation(Location(Vector(-66.120719909668, -5.2385835647583, -5.36441802978516), (2.10325))));
		AssignCommand(oRepublic_Grenn, ActionJumpToLocation(Location(Vector(-67.4208984375, -6.1798734664917, -4.76837158203125), (2.10325))));
		AssignCommand(GetFirstPC(), ActionMoveToObject(GetObjectByTag("wp_pc_1", 0), 0, 1.0));
		AssignCommand(GetObjectByTag("TSF_Officer", 0), ActionMoveToObject(GetObjectByTag("wp_tsfm_1", 0), 1, 1.0));
		AssignCommand(GetObjectByTag("TSF_Officer", 1), ActionMoveToObject(GetObjectByTag("wp_tsff_1", 0), 1, 1.0));
	}
	else {
		if ((nParam1 == 2)) {
			AssignCommand(GetObjectByTag("Grenn", 0), ActionMoveToObject(GetObjectByTag("wp_grenn_1", 0), 0, 1.0));
			AssignCommand(GetObjectByTag("Republic_Grenn", 0), ActionMoveToObject(GetObjectByTag("wp_repoff_1", 0), 0, 1.0));
		}
		else {
			if ((nParam1 == 3)) {
				object oGrenn = GetObjectByTag("Grenn", 0);
				object oRepublic_Grenn = GetObjectByTag("Republic_Grenn", 0);
				object oPC = GetFirstPC();
				AssignCommand(oGrenn, ActionMoveToObject(GetObjectByTag("wp_grenn_2", 0), 0, 1.0));
				AssignCommand(oRepublic_Grenn, ActionMoveToObject(GetObjectByTag("wp_repoff_2", 0), 0, 1.0));
				AssignCommand(oPC, ActionMoveToObject(GetObjectByTag("wp_pc_2", 0), 0, 1.0));
				DelayCommand(2.0, AssignCommand(oGrenn, ActionJumpToObject(GetObjectByTag("wp_grenn_3", 0), 1)));
				DelayCommand(2.0, AssignCommand(oRepublic_Grenn, ActionJumpToObject(GetObjectByTag("wp_repoff_3", 0), 1)));
				DelayCommand(2.0, AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("wp_pc_3", 0), 1)));
			}
			else {
				if ((nParam1 == 4)) {
					object object23 = GetObjectByTag("Grenn", 0);
					object object25 = GetObjectByTag("Republic_Grenn", 0);
					AssignCommand(object23, ActionMoveToObject(GetObjectByTag("wp_grenn_4", 0), 0, 1.0));
					AssignCommand(object25, ActionMoveToObject(GetObjectByTag("wp_repoff_4", 0), 0, 1.0));
					DelayCommand(10.0, DestroyObject(object23, 0.0, 0, 0.0, 0));
					DelayCommand(10.0, DestroyObject(object25, 0.0, 0, 0.0, 0));
				}
				else {
					if ((nParam1 == 5)) {
						AssignCommand(GetFirstPC(), ActionMoveToObject(GetObjectByTag("wp_pc_4", 0), 0, 1.0));
						CreateObject(1, "bastila", GetLocation(GetObjectByTag("wp_bastila_sp", 0)), 0);
						object oD_Carth = GetObjectByTag("d_Carth", 0);
						DelayCommand(7.0, AssignCommand(oD_Carth, ActionCloseDoor(oD_Carth)));
					}
					else {
						if ((nParam1 == 6)) {
							AssignCommand(GetObjectByTag("Bastila", 0), ActionMoveToObject(GetObjectByTag("wp_bastila_1", 0), 0, 1.0));
						}
						else {
							if ((nParam1 == 7)) {
								DelayCommand(0.5, AssignCommand(GetObjectByTag("Carth", 0), SetFacingPoint(GetPosition(GetObjectByTag("Carth_Window", 0)))));
							}
							else {
								if ((nParam1 == 8)) {
									DelayCommand(7.0, AssignCommand(GetObjectByTag("Carth", 0), SetFacingPoint(GetPosition(GetFirstPC()))));
								}
								else {
									if ((nParam1 == 9)) {
										object object37 = GetObjectByTag("Grenn", 0);
										object object39 = GetObjectByTag("Republic_Grenn", 0);
										AssignCommand(object39, ActionMoveToObject(GetObjectByTag("wp_repoff_2", 0), 0, 1.0));
										AssignCommand(object37, ActionMoveToObject(GetObjectByTag("wp_grenn_2", 0), 0, 1.0));
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

