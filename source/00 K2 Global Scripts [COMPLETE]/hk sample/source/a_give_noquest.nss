void main() {
	object oHK47 = GetObjectByTag("HK47", 0);
	object oHK501 = GetObjectByTag("HK501", 0);
	object oHK502 = GetObjectByTag("HK502", 0);
	object oHK503 = GetObjectByTag("HK503", 0);
	if ((((GetIsObjectValid(oHK47) && GetIsDead(oHK501)) && GetIsDead(oHK502)) && GetIsDead(oHK503))) {
		ChangeToStandardFaction(oHK47, 2);
		SetAreaUnescapable(0);
		AddPartyMember(5, oHK47);
	}
	else {
		if (((GetIsDead(oHK501) && GetIsDead(oHK502)) && GetIsDead(oHK503))) {
			SetAreaUnescapable(0);
		}
	}
}

