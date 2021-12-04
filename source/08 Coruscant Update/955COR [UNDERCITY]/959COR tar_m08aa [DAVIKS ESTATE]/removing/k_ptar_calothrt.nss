void main() {
	CreateObject(64, "rfl001", GetLocation(OBJECT_SELF), 0);
	ActionPauseConversation();
	ActionPlayAnimation(113, 1.0, 0.0);
	ActionPlayAnimation(113, 1.0, 0.0);
	ActionPlayAnimation(113, 1.0, 0.0);
	ActionResumeConversation();
}

