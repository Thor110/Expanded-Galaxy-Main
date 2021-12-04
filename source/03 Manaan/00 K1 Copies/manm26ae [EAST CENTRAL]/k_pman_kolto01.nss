void main() {
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("wp_kolto_01", 0))));
	ActionPlayAnimation(10, 1.0, 0.0);
	ActionPlayAnimation(24, 1.0, 0.0);
	if ((Random(3) == 0)) {
		ActionPlayAnimation(103, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(102, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(103, 1.0, 0.0);
	}
	ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
}

