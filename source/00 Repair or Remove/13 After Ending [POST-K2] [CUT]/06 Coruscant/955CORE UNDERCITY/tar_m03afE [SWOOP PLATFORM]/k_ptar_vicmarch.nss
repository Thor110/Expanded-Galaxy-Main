void main() {
	object oRedros;
	if ((GetGlobalBoolean("Tar_GadonDead") == 1)) {
		oRedros = GetObjectByTag("Anglu", 0);
	}
	else {
		oRedros = GetObjectByTag("Redros", 0);
	}
	AssignCommand(oRedros, ActionForceMoveToObject(GetObjectByTag("victory2", 0), 1, 0.1, 2.0));
	DelayCommand(2.6, AssignCommand(oRedros, PlayAnimation(108, 1.0, 1.0)));
	ActionPauseConversation();
	ActionWait(4.0);
	ActionResumeConversation();
}

