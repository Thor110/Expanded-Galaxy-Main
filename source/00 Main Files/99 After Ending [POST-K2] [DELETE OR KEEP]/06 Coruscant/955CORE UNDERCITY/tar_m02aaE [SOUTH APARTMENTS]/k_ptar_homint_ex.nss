void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		SetGlobalBoolean("TAR_HOMEINTRUDER", 0);
	}
}

