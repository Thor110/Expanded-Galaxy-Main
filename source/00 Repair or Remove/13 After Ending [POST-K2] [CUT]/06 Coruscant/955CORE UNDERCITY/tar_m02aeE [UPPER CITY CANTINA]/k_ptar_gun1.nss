void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	string string1 = "g_w_blstrpstl001";
	location location1 = GetLocation(GetObjectByTag("BP_GUN_SPAWN", 0));
	ActionPauseConversation();
	CreateItemOnFloor(string1, location1, 0);
	DelayCommand(0.3, AssignCommand(oDeadeyeDun021, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
	DelayCommand(0.6, AssignCommand(oDeadeyeDun021, PlaySound("it_pistol")));
	DelayCommand(0.85, AssignCommand(oDeadeyeDun021, ActionUnequipItem(GetItemInSlot(4, OBJECT_SELF), 1)));
	DelayCommand(1.3, ActionResumeConversation());
}

