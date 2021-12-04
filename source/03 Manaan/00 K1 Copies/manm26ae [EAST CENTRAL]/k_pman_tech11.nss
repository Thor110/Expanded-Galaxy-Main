void main() {
	ActionMoveToObject(GetObjectByTag("man26ac_wp_tech", 0), 0, 0.5);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("man26ac_wp_tech02", 0))));
	ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
}

