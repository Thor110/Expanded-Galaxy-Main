void main() {
	SetLockOrientationInDialog(GetObjectByTag("man27_diesel", 0), 1);
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
}

