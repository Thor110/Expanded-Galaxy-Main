void main() {
	ActionPlayAnimation(26, 1.0, 30.0);
	ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
}

