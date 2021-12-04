void main() {
	ActionDoCommand(SetFacing(GetFacing(GetObjectByTag("man_soldier_wp", 0))));
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

