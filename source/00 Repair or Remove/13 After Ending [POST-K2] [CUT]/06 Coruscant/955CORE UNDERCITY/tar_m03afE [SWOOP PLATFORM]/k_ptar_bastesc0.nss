// Globals
	int intGLOB_1 = 0;
	int intGLOB_2 = 1;
	int intGLOB_3 = 2;
	int intGLOB_4 = 3;
	int intGLOB_5 = 4;
	int intGLOB_6 = 5;
	int intGLOB_7 = 6;
	int intGLOB_8 = 7;
	int intGLOB_9 = 8;
	int intGLOB_10 = 9;
	int intGLOB_11 = 10;
	int intGLOB_12 = 11;
	int intGLOB_13 = 12;
	int intGLOB_14 = 13;
	int intGLOB_15 = 14;
	int intGLOB_16 = 15;
	int intGLOB_17 = 16;
	int intGLOB_18 = 17;
	int intGLOB_19 = 18;
	int intGLOB_20 = 19;
	int intGLOB_21 = 1100;
	int intGLOB_22 = (-6);
	int intGLOB_23 = (-5);
	int intGLOB_24 = (-4);
	int intGLOB_25 = (-2);
	int intGLOB_26 = (-1);
	int intGLOB_27 = 0;

// Prototypes
void sub1(float floatParam1);

void sub1(float floatParam1) {
	ActionPauseConversation();
	DelayCommand(floatParam1, ActionResumeConversation());
}

void main() {
	object oBastilla03 = GetObjectByTag("Bastilla03", 0);
	object oTar_bast_guard_pull = GetObjectByTag("tar_bast_guard_pull", 0);
	object oRWeapItem = GetItemInSlot(4, oTar_bast_guard_pull);
	location location1 = GetLocation(GetObjectByTag("tar_bastila_force", 0));
	location location3 = GetLocation(GetObjectByTag("tar03_wpsword", 0));
	string string1 = "g_w_vbrdblswd01";
	object oBastila_kick = GetObjectByTag("bastila_kick", 0);
	sub1(5.8);
	CreateItemOnObject("g_w_vbrdblswd01", oBastilla03, 1);
	AssignCommand(oBastilla03, ActionCastFakeSpellAtObject(23, oBastilla03, 0));
	DelayCommand(0.7, ApplyEffectToObject(0, EffectForcePushTargeted(location1, 1), oTar_bast_guard_pull, 0.0));
	DelayCommand(0.7, ApplyEffectToObject(0, EffectVisualEffect(1014, 0), oTar_bast_guard_pull, 0.0));
	DelayCommand(1.0, ApplyEffectToObject(0, EffectVisualEffect(6002, 0), GetFirstPC(), 0.0));
	DelayCommand(1.1, AssignCommand(GetObjectByTag("tar03_bastcage", 0), PlayAnimation(202, 1.0, 0.0)));
	DelayCommand(1.3, ChangeToStandardFaction(oTar_bast_guard_pull, 4));
	DelayCommand(1.3, AssignCommand(oBastilla03, ClearAllActions()));
	DelayCommand(1.3, CancelCombat(oBastilla03));
	DelayCommand(1.6, SetDialogPlaceableCamera(17));
	DelayCommand(1.8, AssignCommand(oBastilla03, CutsceneAttack(oTar_bast_guard_pull, 247, 2, 200)));
	DelayCommand(2.5, SoundObjectPlay(oBastila_kick));
	DelayCommand(3.0, ApplyEffectToObject(0, EffectDeath(0, 1), oTar_bast_guard_pull, 0.0));
	DelayCommand(3.1, SoundObjectStop(oBastila_kick));
	DelayCommand(3.4, SetDialogPlaceableCamera(18));
	DelayCommand(4.3, AssignCommand(oBastilla03, ClearAllActions()));
	DelayCommand(4.3, CancelCombat(oBastilla03));
	DelayCommand(4.8, AssignCommand(oBastilla03, PlayAnimation(10, 1.0, 2.0)));
	DelayCommand(5.9, AssignCommand(oBastilla03, ClearAllActions()));
}

