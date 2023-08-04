void main() {
	ClearAllActions();
	int nRandom = Random(3);
	if ((nRandom == 0)) {
		ActionPlayAnimation(16, 1.0, 3.0);
	}
	else {
		if ((nRandom == 1)) {
			ActionPlayAnimation(104, 1.0, 0.0);
		}
		else {
			ActionPlayAnimation(108, 1.0, 0.0);
		}
	}
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_swpreg", 0), EventUserDefined(0)));
}

