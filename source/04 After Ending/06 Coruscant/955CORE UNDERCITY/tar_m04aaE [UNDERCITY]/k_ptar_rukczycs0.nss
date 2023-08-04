void main() {
	object oRukil04 = GetObjectByTag("rukil04", 0);
	object oTar04_wprukilbadstart = GetObjectByTag("tar04_wprukilbadstart", 0);
	AssignCommand(oRukil04, ActionMoveToObject(GetPCSpeaker(), 1, 1.0));
	ActionPauseConversation();
	ActionWait(6.0);
	ActionResumeConversation();
}

