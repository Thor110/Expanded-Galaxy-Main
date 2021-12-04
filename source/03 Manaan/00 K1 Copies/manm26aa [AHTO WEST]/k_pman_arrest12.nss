void main() {
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
	AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("wp_jail03", 0), 1));
}

