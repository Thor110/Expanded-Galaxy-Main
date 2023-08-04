// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	AurPostString(stringParam1, intParam2, intParam3, floatParam4);
}

void main() {
	sub1("setting to 3", 5, 5, 5.0);
	SetGlobalNumber("MAN_MISSING_PLOT", 3);
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
	ActionMoveToObject(GetObjectByTag("man27_wp_selleave", 0), 1, 1.0);
}

