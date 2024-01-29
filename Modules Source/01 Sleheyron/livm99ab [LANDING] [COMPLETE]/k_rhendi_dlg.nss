void main() {
	object oRhendi = GetObjectByTag("sle99_rhendihang", 0);
	if (GetIsObjectValid(oRhendi)) {
     AssignCommand(oRhendi, ClearAllActions());
     AssignCommand(oRhendi, ActionStartConversation(GetFirstPC(), "sle99_rhendihang", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	}
}

