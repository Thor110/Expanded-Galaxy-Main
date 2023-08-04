void main() {
	object oOdd = GetObjectByTag("odddroid", 0);
	object oES44 = GetObjectByTag("ES44", 0);
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 0)) {
		ChangeToStandardFaction(oES44, 1);
		AssignCommand(oOdd, ActionAttack(oES44, 1));
	}
	if ((nParam1 == 1)) {
		AssignCommand(oOdd, ActionForceMoveToObject(GetObjectByTag("minefield", 0), 1, 1.0, 10.0));
		SetCommandable(0, oOdd);
		DelayCommand(10.0, DestroyObject(oOdd, 0.0, 0, 0.0, 0));
	}
}