void main() {
	ClearAllActions();
	ActionForceMoveToObject(GetObjectByTag("exit_sithbuy", 0), 0, 1.0, 30.0);
	ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	SetCommandable(0, OBJECT_SELF);
}

