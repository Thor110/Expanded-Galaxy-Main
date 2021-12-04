void main() {
	DelayCommand(6.0, SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0));
	ActionPauseConversation();
	ActionWait(7.0);
	ActionResumeConversation();
}

