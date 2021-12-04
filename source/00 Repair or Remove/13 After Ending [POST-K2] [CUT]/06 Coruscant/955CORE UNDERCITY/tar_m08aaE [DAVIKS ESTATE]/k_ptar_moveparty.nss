// Prototypes
void sub1(object objectParam1, object objectParam2);

void sub1(object objectParam1, object objectParam2) {
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionMoveToObject(objectParam2, 1, 1.0));
}

void main() {
	object oNPC;
	int int1 = 1;
	while ((int1 < GetPartyMemberCount())) {
		oNPC = GetPartyMemberByIndex(int1);
		if ((GetDistanceBetween(oNPC, OBJECT_SELF) < 15.0)) {
			DelayCommand((1.0 * int1), sub1(oNPC, GetObjectByTag(("tar08_wphudp" + IntToString(int1)), 0)));
		}
		(int1++);
	}
	ActionPauseConversation();
	ActionWait(6.0);
	ActionResumeConversation();
}

