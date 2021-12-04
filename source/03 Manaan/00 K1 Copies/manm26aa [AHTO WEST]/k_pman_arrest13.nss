void main() {
	ApplyEffectToObject(2, EffectVisualEffect(1021, 0), GetFirstPC(), 0.0);
	AssignCommand(GetFirstPC(), ActionPlayAnimation(21, 1.0, 5.0));
	ActionPauseConversation();
	ActionWait(5.0);
	ActionResumeConversation();
}

