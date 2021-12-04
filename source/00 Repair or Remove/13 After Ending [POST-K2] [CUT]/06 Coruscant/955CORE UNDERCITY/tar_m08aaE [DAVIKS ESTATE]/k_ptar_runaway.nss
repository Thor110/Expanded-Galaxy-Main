void main() {
	object oNearestTar08_ceilingfall = GetNearestObjectByTag("tar08_ceilingfall", OBJECT_SELF, 1);
	object oNPC;
	object oNearestTar08_wpflee;
	int int1;
	int int2 = 0;
	int1 = 0;
	while ((int1 < GetPartyMemberCount())) {
		oNPC = GetPartyMemberByIndex(int1);
		if ((GetDistanceBetween(oNPC, OBJECT_SELF) < 10.0)) {
			oNearestTar08_wpflee = GetNearestObjectByTag("tar08_wpflee", oNPC, 1);
			SetCommandable(1, oNPC);
			AssignCommand(oNPC, ClearAllActions());
			AssignCommand(oNPC, ActionMoveToLocation(GetLocation(oNearestTar08_wpflee), 1));
			int2 = 1;
		}
		(int1++);
	}
	if (int2) {
		ActionPauseConversation();
		ActionWait(3.0);
		ActionResumeConversation();
	}
}

