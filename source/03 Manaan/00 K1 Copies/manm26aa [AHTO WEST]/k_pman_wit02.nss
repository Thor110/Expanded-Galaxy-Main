void main() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag(("trial_" + GetTag(OBJECT_SELF)), 0), 0, 1.0);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("trial_stand02", 0))));
	ActionDoCommand(SetLockOrientationInDialog(OBJECT_SELF, 0));
}

