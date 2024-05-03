void main() {
	object oDarthSion = GetObjectByTag("DarthSion", 0);
	object oKreia = GetObjectByTag("kreia", 0);
	object oAtton = GetObjectByTag("atton", 0);
	if ((((!GetIsObjectValid(oDarthSion)) || (!GetIsObjectValid(oKreia))) || (!GetIsObjectValid(oAtton)))) {
		AurPostString("No Darth Sion and/or Kreia, don't bother with the rest of the cut scene", 5, 7, 10.0);
		return;
	}
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 0:
			AssignCommand(oKreia, ClearAllActions());
			AssignCommand(oKreia, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_kreia_start", 0))));
			vector struct2 = GetPositionFromLocation(GetLocation(GetObjectByTag("WP_fight_kreia", 0)));
			AssignCommand(oKreia, ActionDoCommand(SetFacingPoint(struct2)));
			AssignCommand(oKreia, SetLockOrientationInDialog(oKreia, 1));
			break;
		case 1:
			{
				effect effect1 = EffectMovementSpeedDecrease(50);
				ApplyEffectToObject(1, effect1, oDarthSion, 15.0);
				AssignCommand(oDarthSion, ClearAllActions());
				AssignCommand(oDarthSion, ActionForceMoveToLocation(GetLocation(GetObjectByTag("WP_fight_sion", 0)), 0, 30.0));
				vector struct4 = GetPositionFromLocation(GetLocation(GetObjectByTag("WP_sion_left", 0)));
				AssignCommand(oDarthSion, ActionDoCommand(SetFacingPoint(struct4)));
				AssignCommand(oDarthSion, SetLockOrientationInDialog(oDarthSion, 1));
			}
			break;
		case 2:
			SetFakeCombatState(oKreia, 1);
			vector struct6 = GetPositionFromLocation(GetLocation(oDarthSion));
			AssignCommand(oKreia, ActionPlayAnimation(10173, 1.0, 0.0));
			AssignCommand(oKreia, ActionPlayAnimation(19, 1.0, (-1.0)));
			SetLockOrientationInDialog(oKreia, 1);
			AssignCommand(oKreia, CreatureFlourishWeapon(oKreia));
			break;
		case 3:
			AssignCommand(oKreia, ClearAllActions());
			AssignCommand(oKreia, ActionForceMoveToLocation(GetLocation(GetObjectByTag("WP_fight_kreia", 0)), 0, 30.0));
			vector struct8 = GetPositionFromLocation(GetLocation(oDarthSion));
			AssignCommand(oKreia, ActionDoCommand(SetFacingPoint(struct8)));
			AssignCommand(oKreia, SetLockOrientationInDialog(oKreia, 1));
			break;
		case 4:
			AssignCommand(oDarthSion, CreatureFlourishWeapon(oDarthSion));
			break;
		case 5:
			AssignCommand(oKreia, SetLightsaberPowered(oKreia, 1, 0, 0));
			AssignCommand(oKreia, ActionUnequipItem(GetItemInSlot(4, OBJECT_SELF), 1));
			ChangeObjectAppearance(oKreia, 627);
			break;
		case 6:
			vector struct10 = GetPositionFromLocation(GetLocation(GetObjectByTag("WP_sion_right", 0)));
			AssignCommand(oDarthSion, ActionDoCommand(SetFacingPoint(struct10)));
			AssignCommand(oDarthSion, SetLockOrientationInDialog(oDarthSion, 1));
			break;
		case 7:
			vector struct12 = GetPositionFromLocation(GetLocation(GetObjectByTag("kreia_sion_door", 0)));
			AssignCommand(oDarthSion, ActionDoCommand(SetFacingPoint(struct12)));
			AssignCommand(oDarthSion, SetLockOrientationInDialog(oDarthSion, 1));
			break;
		case 8:
			AssignCommand(oAtton, ClearAllActions());
			AssignCommand(oAtton, ActionForceMoveToObject(GetFirstPC(), 1, 1.0, 30.0));
			break;
		case 9:
			{
				object oRWeapItem = GetItemInSlot(4, oKreia);
				DestroyObject(oRWeapItem, 0.0, 0, 0.0, 0);
			}
			break;
		case 10:
			break;
		case 11:
			AssignCommand(oDarthSion, ClearAllEffects());
			break;
		case 12:
			break;
	}
}

