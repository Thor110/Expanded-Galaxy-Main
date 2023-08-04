void main() {
	SetGlobalBoolean("MAN_PCTRIAL", 1);
	int int1 = 1;
	int int2 = 1;
	object object1 = GetObjectByTag(("man26_seljud" + IntToString(int1)), 0);
	while (GetIsObjectValid(object1)) {
		SetLockOrientationInDialog(object1, int2);
		(int1++);
		object1 = GetObjectByTag(("man26_seljud" + IntToString(int1)), 0);
	}
	SetLockOrientationInDialog(GetObjectByTag("man26_sithac", 0), int2);
	SetLockOrientationInDialog(GetFirstPC(), int2);
}

