void main() {
	object oJuhani = GetObjectByTag("Juhani", 0);
	SetMinOneHP(GetObjectByTag("kas_xor1", 0), 0);
	ChangeToStandardFaction(GetObjectByTag("kas_xor1", 0), 8);
	DelayCommand(0.2, AdjustReputation(oJuhani, GetObjectByTag("kas_xor1", 0), (-100)));
	DelayCommand(0.35000002, AssignCommand(oJuhani, ClearAllActions()));
	DelayCommand(10.0, AdjustReputation(GetFirstPC(), GetObjectByTag("kas_xor1", 0), (-100)));
	DelayCommand(0.5, AssignCommand(oJuhani, CutsceneAttack(GetObjectByTag("kas_xor1", 0), 247, 1, 100)));
}

