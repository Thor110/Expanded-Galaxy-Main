void main() {
	object oChat1 = GetObjectByTag("chat1", 0);
	AssignCommand(oChat1, ClearAllActions());
	DelayCommand(4.0, AssignCommand(oChat1, ActionStartConversation(GetFirstPC(), "chat1", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}