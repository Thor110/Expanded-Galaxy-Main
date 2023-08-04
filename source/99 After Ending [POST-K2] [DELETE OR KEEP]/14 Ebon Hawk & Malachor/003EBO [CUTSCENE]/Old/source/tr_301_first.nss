void main() {
	object oEntering = GetEnteringObject();
	if ((oEntering != GetFirstPC())) {
		return;
	}
	ExecuteScript("a_holoworld", GetFirstPC(), 0xFFFFFFFF);
	if ((GetGlobalNumber("301_INTRO_SCENE") == 1)) {
		SetGlobalNumber("301_INTRO_SCENE", 2);
		object oAtton = GetObjectByTag("Atton", 0);
		object oPC = GetFirstPC();
		AssignCommand(oAtton, ClearAllActions());
		AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_atton", 0))));
		AssignCommand(oPC, ClearAllActions());
		DelayCommand(0.2, AssignCommand(oAtton, ActionStartConversation(oPC, "attontmp", 0, 0, 1, "", "", "", "", "", "", 0, (-1), (-1), 1)));
	}
	else {
		if ((GetGlobalNumber("701_INTRO_SCENE") == 1)) {
			SetGlobalNumber("701_INTRO_SCENE", 2);
			object object10 = GetObjectByTag("Atton", 0);
			object object12 = GetFirstPC();
			AssignCommand(object10, ClearAllActions());
			AssignCommand(object10, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_atton", 0))));
			AssignCommand(object12, ClearAllActions());
			DelayCommand(0.2, AssignCommand(object10, ActionStartConversation(object12, "kor_int", 0, 0, 1, "", "", "", "", "", "", 0, (-1), (-1), 1)));
		}
	}
}

