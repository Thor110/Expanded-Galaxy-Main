// Prototypes
void sub1();

void sub1() {
	CreateObject(1, "tar11_gadon112", GetLocation(GetObjectByTag("tar11_wpgadon", 0)), 0);
}

void main() {
	object object1;
	SetGlobalBoolean("Tar_SummonGadon", 1);
	ActionPauseConversation();
	SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0);
	DelayCommand(1.0, sub1());
	DelayCommand(1.0, SetGlobalFadeIn(0.0, 1.0, 0.0, 0.0, 0.0));
	DelayCommand(1.0, ActionResumeConversation());
	DelayCommand(1.1, AssignCommand(GetObjectByTag("gadonthek112", 0), ActionStartConversation(GetFirstPC(), "", 0, 0, 1, "", "", "", "", "", "")));
}

