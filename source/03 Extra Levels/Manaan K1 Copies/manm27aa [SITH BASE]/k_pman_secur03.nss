void main() {
	object oManm27_door20 = GetObjectByTag("manm27_door20", 0);
	AssignCommand(oManm27_door20, ActionOpenDoor(oManm27_door20));
	ActionPauseConversation();
	ActionWait(1.0);
	ActionResumeConversation();
}

