void main() {
	ClearAllActions();
	int nRandom = Random(3);
	if ((nRandom == 0)) {
		ActionPlayAnimation(108, 1.0, 0.0);
	}
	else {
		if ((nRandom == 1)) {
			ActionPlayAnimation(109, 1.0, 0.0);
		}
		else {
			ActionPlayAnimation(110, 1.0, 0.0);
		}
	}
	ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
}

