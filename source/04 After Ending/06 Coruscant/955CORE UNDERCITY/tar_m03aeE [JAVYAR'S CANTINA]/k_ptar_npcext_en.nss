void main() {
	object oEntering = GetEnteringObject();
	if (((!GetIsPC(oEntering)) && (IsObjectPartyMember(oEntering) == 0))) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

