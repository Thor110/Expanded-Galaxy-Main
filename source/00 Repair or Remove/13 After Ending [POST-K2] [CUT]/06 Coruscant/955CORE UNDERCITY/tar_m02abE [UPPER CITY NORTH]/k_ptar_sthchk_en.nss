void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		if (IsNPCPartyMember(7)) {
			AssignCommand(GetObjectByTag("tar02_sithdoor", 0), ActionUnlockObject(GetObjectByTag("tar02_sithdoor", 0)));
		}
	}
}

