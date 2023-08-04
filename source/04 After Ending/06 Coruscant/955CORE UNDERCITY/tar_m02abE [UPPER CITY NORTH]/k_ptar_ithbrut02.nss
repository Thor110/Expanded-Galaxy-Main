void main() {
	object oBrutalized021 = GetObjectByTag("Brutalized021", 0);
	object oRacistChil021 = GetObjectByTag("RacistChil021", 0);
	object oRacistChil022 = GetObjectByTag("RacistChil022", 0);
	ActionPauseConversation();
	DelayCommand(1.0, ApplyEffectToObject(0, EffectDeath(0, 1), oBrutalized021, 0.0));
	ActionWait(3.0);
	AssignCommand(oRacistChil021, ActionPlayAnimation(118, 1.0, 0.0));
	AssignCommand(oRacistChil022, ActionPlayAnimation(118, 1.0, 0.0));
	ActionResumeConversation();
}

