void main() {
	object oTar10_csswoop = GetObjectByTag("tar10_csswoop", 0);
	object oTar10_explosion;
	object oTar10_vulkguard;
	int int1 = 0;
	while ((int1 < 4)) {
		oTar10_explosion = GetObjectByTag("tar10_explosion", int1);
		ApplyEffectAtLocation(0, EffectVisualEffect(3003, 0), GetLocation(oTar10_explosion), 0.0);
		(int1++);
	}
	ApplyEffectToObject(0, EffectDamage(1000, 8, 0), oTar10_csswoop, 0.0);
	DestroyObject(GetObjectByTag("tar10_cssteam", 0), 0.0, 1, 0.0);
	int1 = 0;
	while ((int1 < 4)) {
		oTar10_vulkguard = GetObjectByTag("tar10_swoopguard", int1);
		ApplyEffectToObject(0, EffectDeath(0, 1), oTar10_vulkguard, 0.0);
		(int1++);
	}
	oTar10_vulkguard = GetObjectByTag("tar10_garagehead", 0);
	ApplyEffectToObject(0, EffectDeath(0, 1), oTar10_vulkguard, 0.0);
	oTar10_vulkguard = GetObjectByTag("tar10_vulkguard", 0);
	ApplyEffectToObject(0, EffectDeath(0, 1), oTar10_vulkguard, 0.0);
	oTar10_vulkguard = GetObjectByTag("tar10_vulkguard", 1);
	ApplyEffectToObject(0, EffectDeath(0, 1), oTar10_vulkguard, 0.0);
	ActionPauseConversation();
	ActionWait(6.0);
	ActionResumeConversation();
}

