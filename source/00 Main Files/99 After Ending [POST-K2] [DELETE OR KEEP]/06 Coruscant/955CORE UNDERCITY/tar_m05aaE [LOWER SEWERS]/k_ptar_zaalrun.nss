void main() {
	object oTar05_zaalbar = GetObjectByTag("tar05_zaalbar", 0);
	object oPtar_missdoor0 = GetObjectByTag("ptar_missdoor0", 0);
	AssignCommand(oPtar_missdoor0, ActionOpenDoor(oPtar_missdoor0));
	DelayCommand(2.0, AssignCommand(oTar05_zaalbar, ActionMoveToObject(GetObjectByTag("tar05_wpmiszal", 0), 1, 1.0)));
	ActionPauseConversation();
	ActionWait(4.0);
	ActionResumeConversation();
}

