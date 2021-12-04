void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		SetGlobalBoolean("K_TAR_SWOOP_POINT_01", 1);
		SetGlobalBoolean("K_TAR_SWOOP_POINT_02", 1);
	}
}

