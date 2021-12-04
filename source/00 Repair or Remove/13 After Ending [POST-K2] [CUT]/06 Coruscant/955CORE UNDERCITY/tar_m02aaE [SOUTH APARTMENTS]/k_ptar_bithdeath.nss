void main() {
	AssignCommand(GetObjectByTag("Bith", 0), PlayAnimation(23, 1.0, 99.0));
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
}

