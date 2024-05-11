void main() {
	object oEntering = GetEnteringObject();
	if ((!GetIsPartyLeader(oEntering))) {
		return;
	}
	object oHK501 = GetObjectByTag("HK501", 0);
	AssignCommand(oHK501, ActionStartConversation(oEntering, "hk_atk", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	DestroyObject(OBJECT_SELF, 0.0, 0, 0.0, 0);
}

