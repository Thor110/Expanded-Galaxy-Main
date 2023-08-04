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
	object oInvis_sound1 = GetObjectByTag("invis_sound1", 0);
	object oInvis_sound2 = GetObjectByTag("invis_sound2", 0);
	object oInvis_sound3 = GetObjectByTag("invis_sound3", 0);
	object oCalo031 = GetObjectByTag("calo031", 0);
	object oTaproomvic031 = GetObjectByTag("taproomvic031", 0);
	object oTaproomvic032 = GetObjectByTag("taproomvic032", 0);
	object oTaproomvic033 = GetObjectByTag("taproomvic033", 0);
	location location1 = GetLocation(GetObjectByTag("tar03_wpvic0", 0));
	location location3 = GetLocation(GetObjectByTag("tar03_wpvic1", 0));
	location location5 = GetLocation(GetObjectByTag("tar03_wpvic2", 0));
	object object18 = GetItemPossessedBy(oCalo031, "G_W_HVYBLSTR01");
	sub1(10.0);
	DestroyObject(oTaproomvic031, 0.0, 1, 0.0);
	DestroyObject(oTaproomvic032, 0.0, 1, 0.0);
	DestroyObject(oTaproomvic033, 0.0, 1, 0.0);
	DelayCommand(1.0, AssignCommand(oCalo031, ActionEquipItem(object18, 5, 0)));
	DelayCommand(0.5, AssignCommand(oCalo031, PlaySound("cb_ht_blastleth1")));
	DelayCommand(1.0, AssignCommand(oCalo031, PlaySound("cb_ht_blastleth2")));
	DelayCommand(1.8, AssignCommand(oCalo031, PlaySound("cb_ht_blastleth1")));
	DelayCommand(2.5, AssignCommand(oCalo031, PlaySound("cb_ht_blastleth2")));
	DelayCommand(1.7, AssignCommand(oInvis_sound1, PlaySound("n_swoopgang_hit1")));
	DelayCommand(2.9, AssignCommand(oInvis_sound2, PlaySound("n_rodian_hit1")));
	DelayCommand(3.3, AssignCommand(oInvis_sound3, PlaySound("n_swoopgang_hit1")));
	DelayCommand(2.0, sub2(1, "bp_dead3", location1));
	DelayCommand(2.5, sub2(1, "bp_dead1", location3));
	DelayCommand(3.0, sub2(1, "bp_dead2", location5));
}

