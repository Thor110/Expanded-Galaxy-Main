void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		SetGlobalBoolean("K_TAR_SWOOP_POINT_05", 1);
		SetGlobalBoolean("K_TAR_SWOOP_POINT_06", 1);
	}
}

