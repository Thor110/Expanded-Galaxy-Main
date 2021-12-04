void main() {
	object oNPC = GetPartyMemberByIndex(0);
	AssignCommand(oNPC, ClearAllActions());
	AssignCommand(oNPC, ActionPlayAnimation(0, 1.0, 0.1));
	DelayCommand(0.5, AssignCommand(oNPC, ActionPlayAnimation(101, 1.0, 0.0)));
}

