void main() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("trial_stand", 0), 0, 1.0);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("trial_stand02", 0))));
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_trialobj", 0), EventUserDefined(0)));
	ActionDoCommand(SetLockOrientationInDialog(OBJECT_SELF, 1));
}

