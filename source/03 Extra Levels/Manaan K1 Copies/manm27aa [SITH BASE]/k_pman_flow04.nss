void main() {
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
	ApplyEffectAtLocation(0, EffectVisualEffect(3002, 0), GetLocation(GetFirstPC()), 0.0);
}

