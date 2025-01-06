void main() {
	object oPC = GetPartyLeader();
	if ((GetEnteringObject() != oPC)) {
		return;
	}
	if (GetLocalBoolean(OBJECT_SELF, 34)) {
		return;
	}
	SetLocalBoolean(OBJECT_SELF, 34, 1);
	oPC = GetFirstPC();
	object object5 = GetNextPC();
	object object7 = GetNextPC();
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("WP_BRIDGE_PC1", 0), 1));
	AssignCommand(object5, ClearAllActions());
	AssignCommand(object5, ActionJumpToObject(GetObjectByTag("WP_BRIDGE_PC2", 0), 1));
	AssignCommand(object7, ClearAllActions());
	AssignCommand(object7, ActionJumpToObject(GetObjectByTag("WP_BRIDGE_PC3", 0), 1));
	object oInvisFlank = GetObjectByTag("InvisFlank", 0);
	if (GetIsObjectValid(oInvisFlank)) {
		AssignCommand(oInvisFlank, ClearAllActions());
    SetGlobalBoolean("MalachorGas",1);
    AssignCommand(GetFirstPC(),ClearAllEffects());
		AssignCommand(oInvisFlank, ActionStartConversation(oPC, "flank", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	}
}

