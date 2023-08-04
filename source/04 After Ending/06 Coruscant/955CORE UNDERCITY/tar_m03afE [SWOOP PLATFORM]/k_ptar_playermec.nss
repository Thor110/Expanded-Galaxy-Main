// Prototypes
void sub1();

void sub1() {
	ActionMoveToObject(GetObjectByTag("tar03_wpraceover", 0), 1, 1.0);
	if ((GetGlobalNumber("Tar_SwoopStatus") == 2)) {
		ActionPlayAnimation(108, 1.0, 0.0);
	}
}

void main() {
	AssignCommand(GetFirstPC(), sub1());
	ActionPauseConversation();
	ActionWait(3.0);
	ActionResumeConversation();
}

