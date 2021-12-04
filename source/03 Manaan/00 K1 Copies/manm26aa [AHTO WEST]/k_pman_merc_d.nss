void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 0:
			ActionPlayAnimation(13, 1.0, 0.0);
			ActionPlayAnimation(13, 1.0, 0.0);
			if ((Random(2) == 0)) {
				ActionPlayAnimation(12, 1.0, 0.0);
			}
			if ((Random(2) == 0)) {
				ActionPlayAnimation(13, 1.0, 0.0);
			}
			if ((Random(2) == 0)) {
				ActionPlayAnimation(12, 1.0, 0.0);
			}
			if ((Random(2) == 0)) {
				ActionPlayAnimation(13, 1.0, 0.0);
			}
			ActionPlayAnimation(12, 1.0, 0.0);
			ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
			break;
		case 10:
			ActionForceMoveToObject(GetObjectByTag("man28aa_nilko_exit", 0), 0, 1.0, 30.0);
			ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
			SetCommandable(0, OBJECT_SELF);
			break;
	}
}

