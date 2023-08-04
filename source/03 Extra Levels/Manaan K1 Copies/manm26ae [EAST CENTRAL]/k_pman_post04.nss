void main() {
	int int1 = GetUserDefinedEventNumber();
	if ((int1 == 10)) {
		ActionOpenDoor(OBJECT_SELF);
		ActionDoCommand(SignalEvent(GetObjectByTag("man26_cutsel01", 0), EventUserDefined(10)));
	}
}

