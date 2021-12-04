void main() {
	object oExiting = GetExitingObject();
	if (GetIsPC(oExiting)) {
		SetGlobalBoolean("TAR_DUELINPROGRESS", 0);
		SetMinOneHP(oExiting, 0);
	}
}

