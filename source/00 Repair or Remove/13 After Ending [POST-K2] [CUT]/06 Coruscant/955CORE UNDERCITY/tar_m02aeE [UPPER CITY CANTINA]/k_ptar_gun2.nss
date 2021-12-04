void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	ActionPauseConversation();
	DelayCommand(0.3, AssignCommand(oGerlonTwof021, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
	DelayCommand(0.6, AssignCommand(oGerlonTwof021, PlaySound("it_pistol")));
	DelayCommand(1.4, ActionResumeConversation());
}

