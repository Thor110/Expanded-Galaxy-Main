void main() {
	object oHK501 = GetObjectByTag("HK501", 0);
	object oHK502 = GetObjectByTag("HK502", 0);
	object oHK503 = GetObjectByTag("HK503", 0);
	object oHK47 = GetObjectByTag("HK47", 0);
	ChangeToStandardFaction(oHK47, 5);
	RemovePartyMember(5);
	ChangeToStandardFaction(oHK501, 1);
	AssignCommand(GetObjectByTag("HK501", 0), ActionAttack(GetFirstPC(), 0));
	ChangeToStandardFaction(oHK502, 1);
	AssignCommand(GetObjectByTag("HK502", 0), ActionAttack(GetFirstPC(), 0));
	ChangeToStandardFaction(oHK503, 1);
	AssignCommand(GetObjectByTag("HK503", 0), ActionAttack(GetFirstPC(), 0));
	SetAreaUnescapable(1);
}

