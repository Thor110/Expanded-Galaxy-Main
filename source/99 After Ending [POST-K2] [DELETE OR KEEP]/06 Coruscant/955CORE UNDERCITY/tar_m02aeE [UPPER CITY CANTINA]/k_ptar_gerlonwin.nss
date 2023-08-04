void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	ActionPauseConversation();
	SetGlobalFadeOut(2.0, 1.0, 0.0, 0.0, 0.0);
	AssignCommand(oGerlonTwof021, ActionPlayAnimation(108, 1.0, 0.0));
	ActionWait(3.0);
	ActionResumeConversation();
}

