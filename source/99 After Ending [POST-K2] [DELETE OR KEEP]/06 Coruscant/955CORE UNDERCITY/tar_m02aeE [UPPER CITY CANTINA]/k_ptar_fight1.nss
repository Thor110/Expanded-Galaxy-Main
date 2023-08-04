void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	location location1 = GetLocation(GetObjectByTag("BP_FIGHT1_WP", 0));
	location location3 = GetLocation(GetObjectByTag("BP_FIGHT2_WP", 0));
	ActionPauseConversation();
	AssignCommand(oGerlonTwof021, ActionAttack(oDeadeyeDun021, 0));
	AssignCommand(oDeadeyeDun021, ActionMoveToLocation(location1, 1));
	DelayCommand(2.0, ActionResumeConversation());
}

