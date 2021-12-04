void main() {
	object oTar05_stampy = GetObjectByTag("tar05_stampy", 0);
	ApplyEffectToObject(0, EffectDeath(1, 1), oTar05_stampy, 0.0);
	ActionPauseConversation();
	ActionWait(3.0);
	ActionResumeConversation();
	GivePlotXP("tar_misc", 20);
}

