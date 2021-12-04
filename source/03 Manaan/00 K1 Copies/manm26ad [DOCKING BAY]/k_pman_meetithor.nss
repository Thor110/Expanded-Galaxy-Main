void main() {
	ActionPauseConversation();
	ActionDoCommand(ActionMoveToObject(GetObjectByTag("wp_vek3x", 0), 0, 0.2));
	ActionDoCommand(ActionPlayAnimation(113, 1.0, 0.0));
	DelayCommand(1.5, AssignCommand(GetFirstPC(), ActionMoveToLocation(GetLocation(GetObjectByTag("wp_vek1x", 0)), 0)));
	SetGlobalFadeOut(4.5, 0.3, 0.0, 0.0, 0.0);
	ActionDoCommand(ActionResumeConversation());
}

