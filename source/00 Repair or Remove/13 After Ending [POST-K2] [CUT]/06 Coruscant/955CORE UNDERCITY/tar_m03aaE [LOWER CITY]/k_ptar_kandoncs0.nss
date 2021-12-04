void main() {
	SetGlobalFadeIn(0.0, 1.0, 0.0, 0.0, 0.0);
	ActionPauseConversation();
	ActionMoveToObject(GetObjectByTag("tar03_wpkandonwalk", 0), 0, 1.0);
	ActionResumeConversation();
}

