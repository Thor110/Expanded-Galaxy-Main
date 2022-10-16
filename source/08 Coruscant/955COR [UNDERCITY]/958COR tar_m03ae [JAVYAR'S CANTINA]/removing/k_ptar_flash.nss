void main() {
	object oTaproomvic031 = GetObjectByTag("taproomvic031", 0);
	object oTaproomvic032 = GetObjectByTag("taproomvic032", 0);
	object oTaproomvic033 = GetObjectByTag("taproomvic033", 0);
	object oFlash_gren = GetObjectByTag("flash_gren", 0);
	location location1 = GetLocation(GetObjectByTag("GRENADE_WP", 0));
	object oCalo031 = GetObjectByTag("calo031", 0);
	object object12 = GetItemPossessedBy(oCalo031, "G_W_HVYBLSTR01");
	ActionPauseConversation();
	DelayCommand(0.5, PlaySound("cs_grenbeep"));
	DelayCommand(1.0, ApplyEffectAtLocation(0, EffectVisualEffect(3011, 0), location1, 0.0));
	DelayCommand(0.1, AssignCommand(oCalo031, ActionEquipItem(object12, 5, 0)));
	DelayCommand(1.2, DestroyObject(oFlash_gren, 0.0, 0, 0.0));
	DelayCommand(1.2, ActionResumeConversation());
	DelayCommand(1.2, AssignCommand(oTaproomvic032, PlaySound("n_swoopgang_hit1")));
}

