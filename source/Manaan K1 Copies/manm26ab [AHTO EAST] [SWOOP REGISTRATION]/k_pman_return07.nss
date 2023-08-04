void main() {
	ActionJumpToObject(GetObjectByTag("wp_return03", 0), 1);
	ActionMoveToObject(GetObjectByTag("wp_return04", 0), 0, 1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_zoffice_01", 0), EventUserDefined(0)));
}

