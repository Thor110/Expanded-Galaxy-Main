void main() {
	ActionMoveToObject(GetObjectByTag(("POST_" + GetTag(OBJECT_SELF)), 0), 0, 1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man27_sthlieu", 0), EventUserDefined(100)));
}

