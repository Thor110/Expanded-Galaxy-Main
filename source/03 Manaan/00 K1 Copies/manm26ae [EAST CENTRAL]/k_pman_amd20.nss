void main() {
	ActionPlayAnimation(0, 1.0, 5.0);
	if ((Random(3) == 0)) {
		ActionPlayAnimation(12, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(103, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(102, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(100, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(101, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(115, 1.0, 0.0);
	}
	ActionPlayAnimation(0, 1.0, 5.0);
	if ((Random(3) == 0)) {
		ActionPlayAnimation(100, 1.0, 0.0);
	}
	if ((Random(3) == 0)) {
		ActionPlayAnimation(101, 1.0, 0.0);
	}
	ActionPlayAnimation(0, 1.0, 5.0);
	ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
}

