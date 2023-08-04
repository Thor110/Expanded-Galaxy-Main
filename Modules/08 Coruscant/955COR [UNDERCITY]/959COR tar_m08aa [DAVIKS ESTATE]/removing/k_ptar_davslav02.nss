void main() {
	ActionPauseConversation();
	SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0);
	DelayCommand(2.0, SetGlobalFadeIn(0.0, 1.0, 0.0, 0.0, 0.0));
	ActionWait(3.0);
	ActionResumeConversation();
}

