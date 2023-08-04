void main() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("cut_player01", 0), 0, 1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man26ae_cut01", 0), EventUserDefined(0)));
}

