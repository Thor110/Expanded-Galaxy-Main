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
void sub2(int intParam1, string stringParam2, location locationParam3);
void sub1(float floatParam1);

void sub2(int intParam1, string stringParam2, location locationParam3) {
	object object1 = CreateObject(intParam1, stringParam2, locationParam3, 0);
}

void sub1(float floatParam1) {
	ActionPauseConversation();
	DelayCommand(floatParam1, ActionResumeConversation());
}

void main() {
	object oEnergyCage = GetObjectByTag("EnergyCage", 0);
	object oEnergyCage_invis = GetObjectByTag("EnergyCage_invis", 0);
	object oLorgal = GetObjectByTag("Lorgal", 0);
	location location1 = GetLocation(oLorgal);
	vector struct2 = Vector(74.1193, 98.2838, 55.23);
	location location3 = Location(struct2, 270.0);
	sub1(7.0);
	DelayCommand(1.4, PlaySound("v_imp_choke"));
	DelayCommand(5.0, PlaySound("n_rodian_hit1"));
	DelayCommand(7.2, PlaySound("n_rodian_dead"));
	DelayCommand(9.4, PlaySound("bf_normal_metal"));
	DelayCommand(1.0, ApplyEffectAtLocation(0, EffectVisualEffect(3006, 0), location1, 0.0));
	DelayCommand(1.0, AssignCommand(oEnergyCage, PlayAnimation(200, 1.0, 0.0)));
	DelayCommand(4.5, ApplyEffectToObject(1, EffectBeam(2038, oEnergyCage_invis, 2, 0), oLorgal, 2.5));
	DelayCommand(1.3, AssignCommand(oLorgal, PlayAnimation(18, 1.0, 6.0)));
	DelayCommand(4.6, ApplyEffectToObject(0, EffectVisualEffect(1021, 0), oLorgal, 0.0));
	DelayCommand(5.4, ApplyEffectToObject(0, EffectVisualEffect(1021, 0), oLorgal, 0.0));
	DelayCommand(6.2, ApplyEffectToObject(0, EffectVisualEffect(1021, 0), oLorgal, 0.0));
	DelayCommand(7.0, AssignCommand(oLorgal, JumpToObject(GetObjectByTag("lorgal_jump", 0), 1)));
	DelayCommand(7.1, sub2(64, "deadrodian", location3));
	DelayCommand(7.1, AssignCommand(GetObjectByTag("EnergyCage", 0), PlayAnimation(201, 1.0, 0.0)));
	DelayCommand(8.7, DestroyObject(oLorgal, 0.0, 0, 0.0));
}

