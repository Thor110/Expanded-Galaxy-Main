void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	int int1 = (GetMaxHitPoints(oDeadeyeDun021) - 2);
	object oNearestG_w_blstrpstl001 = GetNearestObjectByTag("g_w_blstrpstl001", oDeadeyeDun021, 1);
	ActionPauseConversation();
	AssignCommand(oDeadeyeDun021, ClearAllActions());
	AssignCommand(oDeadeyeDun021, PlayAnimation(10, 1.0, 1.0));
	ApplyEffectToObject(1, EffectAssuredHit(), oGerlonTwof021, 20.0);
	ApplyEffectToObject(0, EffectDamage(int1, 8, 0), oDeadeyeDun021, 0.0);
	DelayCommand(0.1, ApplyEffectToObject(1, EffectDamageIncrease(int1, 8), oGerlonTwof021, 20.0));
	DelayCommand(0.90000004, AssignCommand(oGerlonTwof021, ActionAttack(oDeadeyeDun021, 0)));
	DelayCommand(0.85, DestroyObject(oNearestG_w_blstrpstl001, 0.0, 0, 0.0));
	DelayCommand(1.05, AssignCommand(oDeadeyeDun021, ClearAllActions()));
	DelayCommand(1.1, AssignCommand(oDeadeyeDun021, ActionEquipMostDamagingRanged(OBJECT_INVALID)));
	DelayCommand(1.74, SetDialogPlaceableCamera(23));
	DelayCommand(2.1499999, SetDialogPlaceableCamera(24));
	DelayCommand(3.4, ActionResumeConversation());
}

