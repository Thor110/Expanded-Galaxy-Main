void main() {
	if ((GetEnteringObject() == GetPartyLeader())) {
		if (GetLocalBoolean(OBJECT_SELF, 30)) {
			return;
		}
		SetLocalBoolean(OBJECT_SELF, 30, 1);
		object oKreia = GetObjectByTag("Kreia", 0);
		object oDanCourt = GetObjectByTag("DanCourt", 0);
		if ((GetIsObjectValid(oKreia) && GetIsObjectValid(oDanCourt))) {
			ClearAllActions();
			RemovePartyMember(6);
			AssignCommand(oDanCourt, ActionStartConversation(GetFirstPC(), "650Kreia", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
		}
		else {
			if (GetIsObjectValid(oDanCourt)) {
				ClearAllActions();
				SetLocalBoolean(oDanCourt, 30, 1);
				AssignCommand(oDanCourt, ActionStartConversation(GetFirstPC(), "650Kreia", 0, 0, 1, "Kreia", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			}
		}
	}
}