void main() {
	ActionPauseConversation();
	SetGlobalFadeOut(2.5, 0.3, 0.0, 0.0, 0.0);
	AssignCommand(GetPCSpeaker(), ActionMoveToObject(GetObjectByTag("IthorakDoor2", 0), 0, 0.5));
	DelayCommand(1.0, AssignCommand(GetObjectByTag("IthorakDoor2", 0), ActionOpenDoor(GetObjectByTag("IthorakDoor2", 0))));
	ActionWait(3.0);
	ActionResumeConversation();
}

