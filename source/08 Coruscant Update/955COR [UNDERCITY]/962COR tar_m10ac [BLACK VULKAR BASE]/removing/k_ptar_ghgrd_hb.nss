void main() {
	if ((GetDistanceBetween(OBJECT_SELF, GetObjectByTag("tar10_garagehead", 0)) > 5.0)) {
		ActionMoveToObject(GetObjectByTag("tar10_garagehead", 0), 0, 1.0);
	}
}

