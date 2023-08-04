void main() {
	ActionPauseConversation();
	ActionOpenDoor(GetNearestObject(8, OBJECT_SELF, 1));
	ActionForceMoveToObject(GetObjectByTag("man26_wp_myst02", 0), 0, 1.0, 30.0);
	ActionResumeConversation();
	ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	SetCommandable(0, OBJECT_SELF);
}

