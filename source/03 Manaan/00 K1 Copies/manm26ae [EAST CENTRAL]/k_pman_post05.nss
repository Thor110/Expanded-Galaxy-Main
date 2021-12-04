void main() {
	int int1 = GetUserDefinedEventNumber();
	if ((int1 == 10)) {
		ActionMoveToObject(GetObjectByTag("cut_man26_cutsel02", 0), 0, 1.0);
		ActionDoCommand(SignalEvent(GetObjectByTag("man26ae_cut01", 0), EventUserDefined(0)));
	}
	else {
		if ((int1 == 20)) {
			ActionMoveToObject(GetObjectByTag("cut_man26_cutsel03", 0), 0, 1.0);
			ActionWait(1.0);
			ActionDoCommand(SignalEvent(GetObjectByTag("man26ae_cut01", 0), EventUserDefined(0)));
		}
	}
}

