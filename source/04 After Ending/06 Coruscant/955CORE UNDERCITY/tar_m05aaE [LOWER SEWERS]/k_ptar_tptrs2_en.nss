void main() {
	object oEntering = GetEnteringObject();
	if ((IsObjectPartyMember(oEntering) || GetIsPC(oEntering))) {
		AssignCommand(oEntering, ActionJumpToObject(GetObjectByTag("tar05_swtrash2", 0), 1));
	}
}

