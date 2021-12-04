void main() {
	if ((GetUserDefinedEventNumber() == 10)) {
		ActionOpenDoor(GetObjectByTag("man26ad_to26ac", 0));
		ActionMoveToObject(GetObjectByTag("", 0), 0, 1.0);
		ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
		SetCommandable(0, OBJECT_SELF);
	}
}

