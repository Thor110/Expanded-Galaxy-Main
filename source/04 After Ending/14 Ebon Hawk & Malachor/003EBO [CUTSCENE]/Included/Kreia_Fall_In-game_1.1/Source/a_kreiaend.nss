void main() {
	int nParam1 = GetScriptParameter(1);
	object oKreiaEvil = GetObjectByTag("KreiaEvil", 0);
	object oDarthSion = GetObjectByTag("DarthSion", 0);
	object oDarthNihilus = GetObjectByTag("DarthNihilus", 0);
	object oWp_sion_start;
	switch (nParam1) {
		case 0:
			ActionPauseConversation();
			SetGlobalFadeIn(1.0, 2.0, 0.0, 0.0, 0.0);
			oWp_sion_start = GetObjectByTag("wp_kreia_start", 0);
			AssignCommand(oKreiaEvil, ActionMoveToLocation(GetLocation(oWp_sion_start), 0));
			ApplyEffectToObject(2, EffectMovementSpeedDecrease(50), oKreiaEvil, 0.0);
			DelayCommand(11.5, SetDialogPlaceableCamera(38));
			DelayCommand(12.5, ActionResumeConversation());
			break;
		case 1:
			DelayCommand(5.0, SetDialogPlaceableCamera(3));
			break;
		case 2:
			ActionPauseConversation();
			oWp_sion_start = GetObjectByTag("wp_nihilus_start", 0);
			AssignCommand(oDarthNihilus, ActionMoveToLocation(GetLocation(oWp_sion_start), 0));
			DelayCommand(2.0, SetDialogPlaceableCamera(7));
			DelayCommand(4.0, SetDialogPlaceableCamera(45));
			DelayCommand(6.0, SetDialogPlaceableCamera(14));
			DelayCommand(8.0, SetDialogPlaceableCamera(8));
			oWp_sion_start = GetObjectByTag("wp_sion_start", 0);
			AssignCommand(oDarthSion, ActionMoveToLocation(GetLocation(oWp_sion_start), 0));
			DelayCommand(13.0, ActionResumeConversation());
			break;
		case 3:
			ActionPauseConversation();
			DelayCommand(1.0, AssignCommand(oKreiaEvil, ActionDoCommand(SetFacing(120.0))));
			DelayCommand(0.5, SetLightsaberPowered(oDarthSion, 1, 1, 1));
			DelayCommand(2.5, SetLightsaberPowered(oKreiaEvil, 1, 1, 1));
			DelayCommand(4.0, ActionResumeConversation());
			break;
		case 4:
			SetLockOrientationInDialog(oKreiaEvil, 1);
			DelayCommand(4.0, AssignCommand(oDarthNihilus, ActionPlayAnimation(121, 1.0, 1.0)));
			DelayCommand(4.9, ApplyEffectToObject(1, EffectVisualEffect(6002, 0), GetFirstPC(), 0.5));
			DelayCommand(4.4, DestroyObject(GetItemInSlot(4, oKreiaEvil), 0.0, 0, 0.0, 0));
			DelayCommand(7.0, SetLightsaberPowered(oDarthSion, 1, 0, 0));
			DelayCommand(4.3, AssignCommand(oDarthSion, ActionPlayAnimation(101, 1.0, 1.0)));
			DelayCommand(8.0, AssignCommand(oDarthSion, ActionMoveToObject(GetObjectByTag("wp_sion_move", 0), 0, 1.0)));
			DelayCommand(5.3, SetDialogPlaceableCamera(17));
			break;
		case 5:
			DelayCommand(16.0, ApplyEffectToObject(1, EffectVisualEffect(6002, 0), GetFirstPC(), 0.8));
			DelayCommand(9.1, ApplyEffectToObject(1, EffectVisualEffect(6002, 0), GetFirstPC(), 0.5));
			DelayCommand(11.0, ApplyEffectToObject(1, EffectVisualEffect(6002, 0), GetFirstPC(), 0.5));
			DelayCommand(4.8, SetDialogPlaceableCamera(39));
			DelayCommand(6.3, SetDialogPlaceableCamera(40));
			DelayCommand(8.8, SetDialogPlaceableCamera(40));
			DelayCommand(10.3, SetDialogPlaceableCamera(41));
			DelayCommand(11.0, SetDialogPlaceableCamera(42));
			DelayCommand(13.5, SetDialogPlaceableCamera(46));
			DelayCommand(15.3, SetDialogPlaceableCamera(20));
			break;
		case 6:
			object oPC = GetFirstPC();
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oPC, ActionJumpToLocation(Location(Vector(-0.06657, -74.77476, 0.796), 271.58978)));
			DelayCommand(0.5, AssignCommand(oKreiaEvil, ActionPlayAnimation(100, 1.0, 1.0)));
			DelayCommand(2.0, AssignCommand(oKreiaEvil, ActionPlayAnimation(101, 1.0, 1.0)));
			DelayCommand(5.0, SetDialogPlaceableCamera(1));
			break;
		case 7:
			SetGlobalFadeOut(0.1, 4.0, 0.0, 0.0, 0.0);
			break;
		case 8:
			ExecuteScript("a_cleanup", OBJECT_SELF, 0xFFFFFFFF);
			StartNewModule(GetGlobalString("K_LAST_MODULE"), "K_LAST_LOCATION", "", "", "", "", "", "");
			break;
		case 9:
			DelayCommand(1.0, SetDialogPlaceableCamera(22));
			DelayCommand(3.0, SetDialogPlaceableCamera(6));
			break;
	}
}