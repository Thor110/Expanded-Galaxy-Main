void main() {
	object oChat = GetObjectByTag("chat1", 0);
	object oChat2 = GetObjectByTag("chat2", 0);
	object oEntering = GetEnteringObject();
	if ((!GetIsPartyLeader(oEntering))) {
		return;
	}
	AssignCommand(oChat, ClearAllActions());
	AssignCommand(oChat2, ClearAllActions());
	int int1 = GetGlobalNumber("804_Rumour");
	if ((((int1 == 1) || (int1 == 3)) || (int1 == 6) || (int1 == 9) || (int1 == 12) || (int1 == 15) || (int1 == 17))) {
		DelayCommand(0.1, AssignCommand(oChat2, ActionStartConversation(GetFirstPC(), "chat2", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	}
	else {
		DelayCommand(0.1, AssignCommand(oChat, ActionStartConversation(GetFirstPC(), "chat1", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	}
}