void main() {
	object oChat2 = GetObjectByTag("chat2", 0);
	AssignCommand(oChat2, ClearAllActions());
	DelayCommand(4.0, AssignCommand(oChat2, ActionStartConversation(GetFirstPC(), "chat2", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}