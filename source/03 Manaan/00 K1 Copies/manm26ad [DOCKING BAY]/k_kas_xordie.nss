void main() {
	SetMinOneHP(GetObjectByTag("kas_xor1", 0), 0);
	DelayCommand(1.0, ApplyEffectToObject(0, EffectDeath(0, 1), GetObjectByTag("kas_xor1", 0), 0.0));
}

