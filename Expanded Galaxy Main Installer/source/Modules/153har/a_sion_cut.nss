void main() {
	object oDarthSion = GetObjectByTag("DarthSion", 0);
	if ((!GetIsObjectValid(oDarthSion))) {
		AurPostString("Darth Sion isn't here, don't bother with the rest of the cut scene", 5, 7, 10.0);
		return;
	}
	SetPartyLeader(0xFFFFFFFF);
	object oPC = GetFirstPC();
	object oAtton = GetObjectByTag("atton", 0);
	object oKreia = GetObjectByTag("kreia", 0);
	if (((!GetIsObjectValid(oAtton)) || (!GetIsObjectValid(oKreia)))) {
		AurPostString("No Atton or Kreia, don't bother with the rest of the cut scene", 5, 7, 10.0);
		return;
	}
	int int5 = (!GetIsObjectValid(GetObjectByTag("RSldCrpsSw", 0)));
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 0:
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oKreia, ClearAllActions());
			AssignCommand(oAtton, ClearAllActions());
			AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_pc", 0))));
			AssignCommand(oKreia, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_npc2", 0))));
			AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_npc3", 0))));
			{
				object oWP_SION_PC1 = GetObjectByTag("WP_SION_PC1", 0);
				object oWP_SION_PC2 = GetObjectByTag("WP_SION_PC2", 0);
				object oWP_SION_PC3 = GetObjectByTag("WP_SION_PC3", 0);
				vector struct2 = GetPositionFromLocation(GetLocation(GetObjectByTag("WP_pc_look", 0)));
				AssignCommand(oPC, ActionForceMoveToLocation(GetLocation(oWP_SION_PC1), 0, 30.0));
				AssignCommand(oPC, ActionDoCommand(SetFacingPoint(struct2)));
				AssignCommand(oPC, SetLockOrientationInDialog(oPC, 1));
				DelayCommand(0.1, AssignCommand(oKreia, ActionForceMoveToLocation(GetLocation(oWP_SION_PC2), 0, 30.0)));
				DelayCommand(0.1, AssignCommand(oAtton, ActionForceMoveToLocation(GetLocation(oWP_SION_PC3), 0, 30.0)));
			}
			break;
		case 1:
			AssignCommand(oPC, ActionWait(1.8));
			AssignCommand(oPC, ActionPlayAnimation(100, 1.0, 0.0));
			break;
		case 2:
			vector struct4 = GetPositionFromLocation(GetLocation(oDarthSion));
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oKreia, ClearAllActions());
			AssignCommand(oAtton, ClearAllActions());
			AssignCommand(oPC, SetLockOrientationInDialog(oPC, 0));
			AssignCommand(oPC, ActionDoCommand(SetFacingPoint(struct4)));
			AssignCommand(oKreia, ActionDoCommand(SetFacingPoint(struct4)));
			DelayCommand(0.5, AssignCommand(oAtton, ActionDoCommand(SetFacingPoint(struct4))));
			break;
		case 3:
			break;
		case 4:
			{
				effect effect1 = EffectMovementSpeedDecrease(50);
				AssignCommand(oDarthSion, ClearAllActions());
				ApplyEffectToObject(1, effect1, oDarthSion, 4.0);
				AssignCommand(oDarthSion, ActionForceMoveToObject(GetObjectByTag("WP_SION_2", 0), 0, 1.0, 30.0));
			}
			break;
		case 5:
			vector struct6 = GetPositionFromLocation(GetLocation(oPC));
			if (int5) {
				AssignCommand(oKreia, ClearAllActions());
				AssignCommand(oKreia, ActionEquipItem(CreateItemOnObject("lsbkresion", oKreia, 1, 0), 4, 0));
				AurPostString("Kreia flourish.", 5, 12, 10.0);
				AssignCommand(oKreia, SetLockOrientationInDialog(oKreia, 1));
				DelayCommand(5.0, AssignCommand(oKreia, SetLightsaberPowered(oKreia, 1, 1, 0)));
				AssignCommand(oKreia, CreatureFlourishWeapon(oKreia));
			}
			else {
				object oRSldCrpsSw = GetObjectByTag("RSldCrpsSw", 0);
				AssignCommand(oKreia, ClearAllActions());
				AssignCommand(oKreia, SetFacingPoint(GetPosition(oRSldCrpsSw)));
				AssignCommand(oKreia, ActionPlayAnimation(10040, 1.0, 0.0));
				DelayCommand(1.0, AssignCommand(oRSldCrpsSw, ActionPlayAnimation(203, 1.0, 0.0)));
				DelayCommand(1.0, AssignCommand(oKreia, ClearAllActions()));
				DelayCommand(1.0, AssignCommand(oKreia, ActionEquipItem(CreateItemOnObject("w_melee_02", oKreia, 1, 1), 4, 1)));
				DelayCommand(1.5, AssignCommand(oKreia, SetFacingPoint(struct6)));
				DelayCommand(3.0, AssignCommand(oKreia, SetLockOrientationInDialog(oKreia, 1)));
				AurPostString("Kreia flourish.", 5, 12, 10.0);
			}
			break;
		case 6:
			AurPostString("Kreia runs first WP.", 5, 14, 10.0);
			AssignCommand(oKreia, ClearAllActions());
			AssignCommand(oKreia, ActionForceMoveToObject(GetObjectByTag("WP_kreia_leave_1", 0), 1, 1.0, 30.0));
			break;
		case 7:
			AssignCommand(oKreia, ClearAllActions());
			AssignCommand(oKreia, ActionForceMoveToObject(GetObjectByTag("WP_kreia_leave_2", 0), 1, 1.0, 30.0));
			break;
		case 8:
			{
				object oKreia_sion_door = GetObjectByTag("kreia_sion_door", 0);
				if (GetIsObjectValid(oKreia_sion_door)) {
					AssignCommand(oKreia_sion_door, ActionCloseDoor(oKreia_sion_door));
					AssignCommand(oKreia_sion_door, SetLocked(oKreia_sion_door, 1));
				}
			}
			break;
		case 9:
			AssignCommand(oKreia, ClearAllActions());
			vector struct9 = GetPositionFromLocation(GetLocation(oPC));
			AssignCommand(oKreia, ActionDoCommand(SetFacingPoint(struct9)));
			AssignCommand(oKreia, SetLockOrientationInDialog(oKreia, 1));
			break;
		case 10:
			{
				object object29 = GetObjectByTag("kreia", 0);
				if (GetIsObjectValid(object29)) {
					RemovePartyMember(6);
					AurPostString("Kreia removed from party.", 5, 10, 10.0);
				}
			}
			break;
		case 11:
			{
				int int12 = 0;
				while ((int12 < 4)) {
				{
					int int13;
					if ((int12 == 0)) {
					int13 = 4;
					}
					else {
					if ((int12 == 1)) {
						int13 = 5;
					}
					else {
						if ((int12 == 2)) {
							int13 = 18;
						}
						else {
							if ((int12 == 3)) {
								int13 = 19;
							}
						}
					}
					}
					object oSlotItem = GetItemInSlot(int13, oKreia);
					if (GetIsObjectValid(oSlotItem)) {
						AssignCommand(oKreia, ActionUnequipItem(oSlotItem, 0));
						AssignCommand(oKreia, GiveItem(oSlotItem, oPC));
					}
					(int12++);
				}
				}
			}
			break;
		case 12:
			if (int5) {
				AssignCommand(oKreia, SetLightsaberPowered(oKreia, 1, 0, 0));
			}
			break;
	}
}

