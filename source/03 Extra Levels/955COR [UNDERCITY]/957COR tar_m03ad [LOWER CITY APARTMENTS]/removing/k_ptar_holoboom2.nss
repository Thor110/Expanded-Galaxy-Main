void main() {
	ApplyEffectToObject(1, EffectVisualEffect(2008, 0), GetObjectByTag("tar03_box", 0), 2.0);
	location location1 = GetLocation(GetObjectByTag("tar03_box", 0));
	DelayCommand(1.5, ApplyEffectAtLocation(0, EffectVisualEffect(3003, 0), location1, 0.0));
	DelayCommand(1.5, ApplyEffectToObject(0, EffectDamage(50, 8, 0), GetPartyMemberByIndex(0), 0.0));
	DelayCommand(1.5, ApplyEffectToObject(1, EffectForcePushTargeted(location1, 0), GetPartyMemberByIndex(0), 0.5));
	DelayCommand(1.5, ApplyEffectToObject(0, EffectDamage(50, 8, 0), GetPartyMemberByIndex(1), 0.0));
	DelayCommand(1.5, ApplyEffectToObject(1, EffectForcePushTargeted(location1, 0), GetPartyMemberByIndex(1), 0.5));
	DelayCommand(1.5, ApplyEffectToObject(0, EffectDamage(50, 8, 0), GetPartyMemberByIndex(2), 0.0));
	DelayCommand(1.5, ApplyEffectToObject(1, EffectForcePushTargeted(location1, 0), GetPartyMemberByIndex(2), 0.5));
	DelayCommand(1.6, DestroyObject(GetObjectByTag("tar03_box", 0), 0.0, 1, 0.0));
	DelayCommand(2.0, DestroyObject(GetObjectByTag("holo1", 0), 0.0, 1, 0.0));
	DelayCommand(2.0, DestroyObject(GetObjectByTag("holo2", 0), 0.0, 1, 0.0));
	DelayCommand(2.0, DestroyObject(GetObjectByTag("holo3", 0), 0.0, 1, 0.0));
	DelayCommand(2.0, DestroyObject(GetObjectByTag("holo4", 0), 0.0, 1, 0.0));
	DelayCommand(2.0, DestroyObject(GetObjectByTag("holo5", 0), 0.0, 1, 0.0));
	DelayCommand(2.0, DestroyObject(GetObjectByTag("holo6", 0), 0.0, 1, 0.0));
	ActionPauseConversation();
	ActionWait(2.2);
	ActionResumeConversation();
}

