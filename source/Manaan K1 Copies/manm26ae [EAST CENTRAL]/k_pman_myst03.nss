void main() {
	ActionForceMoveToObject(GetObjectByTag("man26_wp_myst03", 0), 1, 1.0, 30.0);
	ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	SetCommandable(0, OBJECT_SELF);
}

