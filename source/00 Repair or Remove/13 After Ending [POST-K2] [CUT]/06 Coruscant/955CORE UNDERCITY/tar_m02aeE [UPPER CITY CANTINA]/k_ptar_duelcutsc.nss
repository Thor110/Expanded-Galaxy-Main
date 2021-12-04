void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	object oDuelAnnoun021 = GetObjectByTag("DuelAnnoun021", 0);
	ChangeToStandardFaction(oDeadeyeDun021, 2);
	ChangeToStandardFaction(oGerlonTwof021, 4);
	ActionPauseConversation();
	AssignCommand(oDeadeyeDun021, ClearAllActions());
	AssignCommand(oDeadeyeDun021, ActionMoveToObject(GetObjectByTag("tar02_wprun1", 0), 0, 1.0));
	DelayCommand(0.3, AssignCommand(oGerlonTwof021, ClearAllActions()));
	DelayCommand(0.4, AssignCommand(oGerlonTwof021, ActionMoveToObject(GetObjectByTag("tar02_wprun2", 0), 0, 1.0)));
	DelayCommand(5.7, ActionResumeConversation());
}

