void main() {
	ActionPauseConversation();
	ActionForceMoveToObject(GetObjectByTag("man26_wp_myst02", 0), 0, 1.0, 30.0);
	ActionResumeConversation();
}

