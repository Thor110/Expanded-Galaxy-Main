void main() {
	string string1 = "flash_gren";
	location location1 = GetLocation(GetObjectByTag("GRENADE_WP", 0));
	object oTaproomvic031 = GetObjectByTag("taproomvic031", 0);
	object oTaproomvic032 = GetObjectByTag("taproomvic032", 0);
	object oTaproomvic033 = GetObjectByTag("taproomvic033", 0);
	AssignCommand(oTaproomvic031, ActionEquipMostDamagingRanged(OBJECT_INVALID));
	DelayCommand(0.2, AssignCommand(oTaproomvic032, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
	DelayCommand(0.5, AssignCommand(oTaproomvic033, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
	ActionPauseConversation();
	DelayCommand(0.8, ActionResumeConversation());
	DelayCommand(0.90000004, PlaySound("cb_gr_boncehard1"));
}

