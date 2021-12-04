void main() {
	object oNPC = GetPartyMemberByIndex(0);
	object object3 = GetPartyMemberByIndex(1);
	AssignCommand(oNPC, ClearAllActions());
	DelayCommand(0.5, AssignCommand(oNPC, ActionPlayAnimation(101, 1.0, 0.0)));
}

