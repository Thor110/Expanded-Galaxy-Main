void main() {
	object object1 = OBJECT_SELF;
	ActionPauseConversation();
	ActionPlayAnimation(16, 1.0, 2.0);
	ActionPlayAnimation(108, 1.0, 1.0);
	ActionPlayAnimation(16, 1.0, 2.0);
	ActionResumeConversation();
}

