void main() {
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
	object oNearestDuros = GetNearestObjectByTag("Duros", OBJECT_SELF, 1);
	if ((GetIsPC(oEntering) && (!GetIsInCombat(oNearestDuros)))) {
		CancelCombat(oNearestDuros);
		DelayCommand(0.1, AssignCommand(oNearestDuros, ActionStartConversation(oPC, "", 0, 0, 0, "", "", "", "", "", "")));
		DelayCommand(0.2, DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	}
}

