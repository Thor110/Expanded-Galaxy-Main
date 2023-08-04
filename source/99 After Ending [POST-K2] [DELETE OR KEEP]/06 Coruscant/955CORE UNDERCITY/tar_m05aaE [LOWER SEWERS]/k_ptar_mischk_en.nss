void main() {
	object oEntering = GetEnteringObject();
	object oPtar_missdoor1;
	if ((GetIsPC(oEntering) && IsNPCPartyMember(6))) {
		oPtar_missdoor1 = GetObjectByTag("ptar_missdoor0", 0);
		AssignCommand(oPtar_missdoor1, ActionUnlockObject(oPtar_missdoor1));
		oPtar_missdoor1 = GetObjectByTag("ptar_missdoor1", 0);
		AssignCommand(oPtar_missdoor1, ActionUnlockObject(oPtar_missdoor1));
	}
}

