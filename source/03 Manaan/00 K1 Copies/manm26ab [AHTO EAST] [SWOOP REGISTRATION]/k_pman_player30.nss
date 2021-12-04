void main() {
	JumpToObject(GetObjectByTag("arrest_player_01", 0), 1);
	ActionMoveToObject(GetObjectByTag("arrest_player_02", 0), 0, 1.0);
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_selcutobj", 0), EventUserDefined(0)));
}

