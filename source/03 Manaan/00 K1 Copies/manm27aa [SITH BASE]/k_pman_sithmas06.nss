void main() {
	AssignCommand(GetFirstPC(), ActionMoveToObject(GetObjectByTag("wp_player_01", 0), 0, 1.0));
	ActionPauseConversation();
	ActionWait(3.0);
	ActionResumeConversation();
}

