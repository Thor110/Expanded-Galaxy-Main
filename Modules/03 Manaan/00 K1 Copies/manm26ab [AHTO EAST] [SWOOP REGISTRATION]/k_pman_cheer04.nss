void main() {
	ClearAllActions();
	int nRandom = Random(3);
	ActionWait(2.0);
	ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("wp_facing", OBJECT_SELF, 1))));
	ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
}

