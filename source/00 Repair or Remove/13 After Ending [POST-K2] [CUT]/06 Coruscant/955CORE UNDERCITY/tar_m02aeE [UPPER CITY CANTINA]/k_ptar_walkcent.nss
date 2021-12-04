void main() {
	AssignCommand(GetFirstPC(), ActionMoveToObject(GetObjectByTag("tar02_wpannarena", 0), 0, 1.0));
	ActionPauseConversation();
	ActionWait(6.0);
	ActionResumeConversation();
}

