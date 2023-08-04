void main() {
	CreateItemOnObject("w_token", OBJECT_SELF, 1);
	ActionMoveToObject(GetObjectByTag("wp_player_02", 0), 0, 1.0);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("wp_player_02", 0))));
	ActionWait(0.5);
	ActionPlayAnimation(10, 1.0, 0.0);
	ActionWait(1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man27_cutobj03", 0), EventUserDefined(0)));
}

