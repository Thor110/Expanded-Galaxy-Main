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
	object oIthorak = GetObjectByTag("Ithorak", 0);
	object oVekdroid = GetObjectByTag("Vekdroid", 0);
	sub1(9.0);
	AssignCommand(oVekdroid, PlayAnimation(21, 1.0, 8.0));
	DelayCommand(1.0, AssignCommand(oIthorak, ActionMoveToObject(oVekdroid, 0, 0.5)));
	DelayCommand(3.0, AssignCommand(oIthorak, PlayAnimation(107, 1.0, 0.0)));
	DelayCommand(4.5, AssignCommand(oIthorak, PlayAnimation(113, 1.0, 0.0)));
	DelayCommand(5.5, PlaySound("cs_grenbeep"));
	DelayCommand(6.0, ApplyEffectAtLocation(0, EffectVisualEffect(3003, 0), GetLocation(oVekdroid), 0.0));
	DelayCommand(6.1, ApplyEffectToObject(0, EffectVisualEffect(6002, 0), GetFirstPC(), 0.0));
	DelayCommand(6.2, ApplyEffectToObject(0, EffectVisualEffect(1007, 0), oVekdroid, 0.0));
	DelayCommand(6.3, ApplyEffectToObject(0, EffectDeath(0, 1), oIthorak, 0.0));
	DelayCommand(6.3, ApplyEffectToObject(1, EffectDamage(1000, 8, 0), oVekdroid, 0.0));
	DelayCommand(1.2, SetDialogPlaceableCamera(16));
	DelayCommand(5.8, SetDialogPlaceableCamera(17));
	DelayCommand(7.3, SetDialogPlaceableCamera(18));
}

