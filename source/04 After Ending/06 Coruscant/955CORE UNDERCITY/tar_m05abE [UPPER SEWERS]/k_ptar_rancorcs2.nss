void main() {
	object oTar05_stampy = GetObjectByTag("tar05_stampy", 0);
	ActionPauseConversation();
	ApplyEffectToObject(1, EffectChoke(), oTar05_stampy, 3.0);
	DelayCommand(0.7, ApplyEffectToObject(0, EffectVisualEffect(1045, 0), oTar05_stampy, 0.0));
	PlaySound("cb_gr_fragment");
	PlaySound("c_rancor_bat2");
	ActionWait(3.0);
	ActionResumeConversation();
}

