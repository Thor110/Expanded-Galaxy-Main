// Prototypes
void sub1();

void sub1() {
	object oTar_duel_crowd2 = GetObjectByTag("tar_duel_crowd2", 0);
	SoundObjectPlay(oTar_duel_crowd2);
	DelayCommand(5.0, SoundObjectStop(oTar_duel_crowd2));
}

void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	ActionPauseConversation();
	AssignCommand(oDeadeyeDun021, ClearAllActions());
	AssignCommand(oDeadeyeDun021, ActionEquipMostDamagingRanged(OBJECT_INVALID));
	AssignCommand(oDeadeyeDun021, ActionPlayAnimation(0, 1.0, 0.1));
	AssignCommand(oDeadeyeDun021, ActionJumpToLocation(GetGlobalLocation("TAR_DUELCUT_START1")));
	sub1();
	SetGlobalFadeOut(4.0, 2.0, 0.0, 0.0, 0.0);
	ActionWait(6.0);
	ActionResumeConversation();
}

