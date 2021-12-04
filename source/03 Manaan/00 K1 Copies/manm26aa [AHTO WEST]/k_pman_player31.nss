void main() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("trial_pc", 0), 0, 1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_selarb", 0), EventUserDefined(0)));
}

