void main() {
	object oPC = GetFirstPC();
	if ((GetEnteringObject() != oPC)) {
		return;
	}
	if (GetLocalBoolean(OBJECT_SELF, 34)) {
		return;
	}
	SetLocalBoolean(OBJECT_SELF, 34, 1);
	if (IsAvailableCreature(7)) {
    SetGlobalBoolean("MalachorGas",1);
		SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0);
		CreateObject(32, "g_lastlocal", GetLocation(oPC), 0);
		object object5 = SpawnAvailableNPC(7, GetLocation(GetWaypointByTag("sp_mira")));
		DelayCommand(2.0, AssignCommand(object5, ClearAllActions()));
		DelayCommand(2.0, AssignCommand(object5, ActionStartConversation(oPC, "901mira", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	}
}

