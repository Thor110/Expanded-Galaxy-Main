void main() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("wp_return02", 0), 0, 1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_swpreg", 0), EventUserDefined(0)));
}

