// Prototypes
void sub1(float floatParam1);

void sub1(float floatParam1) {
	ActionPauseConversation();
	DelayCommand(floatParam1, ActionResumeConversation());
}

void main() {
	int int1;
	object oTar03_swoopie;
	sub1(1.0);
	AssignCommand(GetFirstPC(), JumpToLocation(GetLocation(GetObjectByTag("tar_pc_cutjump", 0))));
	int1 = 2;
	while ((int1 >= 0)) {
		oTar03_swoopie = GetObjectByTag("tar03_swoopie", int1);
		DestroyObject(oTar03_swoopie, 0.0, 1, 0.0);
		(int1--);
	}
}

