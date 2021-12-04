void main() {
	object oNPC = GetPartyMemberByIndex(0);
	DelayCommand(0.3, AssignCommand(GetObjectByTag("Droid1", 0), SetFacingPoint(GetPosition(oNPC))));
	DelayCommand(1.0, AssignCommand(GetObjectByTag("Droid2", 0), SetFacingPoint(GetPosition(oNPC))));
}

