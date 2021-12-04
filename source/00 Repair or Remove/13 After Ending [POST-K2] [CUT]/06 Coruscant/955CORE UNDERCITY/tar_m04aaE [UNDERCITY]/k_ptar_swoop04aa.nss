void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		SetGlobalBoolean("K_TAR_SWOOP_POINT_07", 1);
		SetGlobalBoolean("K_TAR_SWOOP_POINT_08", 1);
		SetGlobalBoolean("K_TAR_SWOOP_POINT_09", 1);
	}
}

