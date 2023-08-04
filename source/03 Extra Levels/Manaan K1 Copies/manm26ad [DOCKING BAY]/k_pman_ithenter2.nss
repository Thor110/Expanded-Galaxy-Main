// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	sub1("Pause2", 5, 5, 1.0);
	ActionPauseConversation();
	SetGlobalFadeIn(0.5, 0.5, 0.0, 0.0, 0.0);
	AssignCommand(GetObjectByTag("IthorakDoor2", 0), ActionCloseDoor(GetObjectByTag("IthorakDoor2", 0)));
	AssignCommand(GetPartyMemberByIndex(0), JumpToLocation(GetLocation(GetObjectByTag("wp_index0", 0))));
	AssignCommand(GetPartyMemberByIndex(1), JumpToLocation(GetLocation(GetObjectByTag("wp_index1", 0))));
	AssignCommand(GetPartyMemberByIndex(2), JumpToLocation(GetLocation(GetObjectByTag("wp_index2", 0))));
	ActionWait(1.0);
	ActionResumeConversation();
}

