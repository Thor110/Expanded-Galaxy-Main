// Prototypes
void sub1(int intParam1);

void sub1(int intParam1) {
	ClearAllActions();
	ActionJumpToObject(GetObjectByTag("tar10_swoopcs0", 0), 1);
	ActionMoveToObject(GetObjectByTag("tar10_swoopcs1", 0), 1, 1.0);
	ActionMoveToObject(GetObjectByTag("tar10_swoopcsa", intParam1), 1, 1.0);
}

void main() {
	object oTar10_vulkguard;
	int int1 = 0;
	while ((int1 < 4)) {
		oTar10_vulkguard = GetObjectByTag("tar10_swoopguard", int1);
		DelayCommand((1.0 * int1), AssignCommand(oTar10_vulkguard, sub1(int1)));
		(int1++);
	}
	oTar10_vulkguard = GetObjectByTag("tar10_garagehead", 0);
	AssignCommand(oTar10_vulkguard, ActionMoveToObject(GetObjectByTag("tar10_swoopcsb", 0), 1, 1.0));
	oTar10_vulkguard = GetObjectByTag("tar10_vulkguard", 0);
	DelayCommand(1.0, AssignCommand(oTar10_vulkguard, ActionMoveToObject(GetObjectByTag("tar10_swoopcsb", 1), 1, 1.0)));
	oTar10_vulkguard = GetObjectByTag("tar10_vulkguard", 1);
	DelayCommand(2.0, AssignCommand(oTar10_vulkguard, ActionMoveToObject(GetObjectByTag("tar10_swoopcsb", 2), 1, 1.0)));
	CreateObject(64, "tar10_cssteam", GetLocation(GetObjectByTag("tar10_csswoop", 0)), 0);
	ActionPauseConversation();
	ActionWait(8.0);
	ActionResumeConversation();
}

