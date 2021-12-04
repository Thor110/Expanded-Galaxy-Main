void main() {
	object oRod_killer = GetObjectByTag("rod_killer", 0);
      object oMerc_leader = GetObjectByTag("merc_leader", 0);
	object oEntering = GetEnteringObject();
	if ((oEntering != GetPartyLeader())) {
		AurPostString("Not PartyLeader", 5, 15, 10.0);
		return;
	}
	if (GetIsObjectValid(oRod_killer)) {
		if (GetLocalBoolean(OBJECT_SELF, 36)) {
			return;
		}
    if (GetGlobalBoolean("TEL_ROD_KILLER") == TRUE) {
      if (GetIsObjectValid(oRod_killer)) {
        SetLocalBoolean(OBJECT_SELF, 36, 1);
        SetGlobalNumber("203TEL_BH_CS", 3);
        SetGlobalNumber("202TEL_Bounty_Killers", 2);
        object oPC = GetFirstPC();
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oRod_killer, ClearAllActions());
        AssignCommand(oRod_killer, ActionStartConversation(oPC, "", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
        SetGlobalBoolean("TEL_ROD_KILLER", FALSE);
      }
    }
    if (GetIsObjectValid(oMerc_leader)) {
      
    }
    else {
      SetLocalBoolean(OBJECT_SELF, 36, 1);
      SetGlobalNumber("203TEL_BH_CS", 3);
      SetGlobalNumber("202TEL_Bounty_Killers", 2);
      object oPC = GetFirstPC();
      AssignCommand(oPC, ClearAllActions());
      AssignCommand(oRod_killer, ClearAllActions());
      AssignCommand(oRod_killer, ActionStartConversation(oPC, "", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
      SetGlobalBoolean("TEL_ROD_KILLER", FALSE);
    }
	}
}

