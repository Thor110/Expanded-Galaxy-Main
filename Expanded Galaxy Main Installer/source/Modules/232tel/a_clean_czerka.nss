void main() {
	object oSalvage = GetObjectByTag("salvage", 0);
	object oFrom_233TEL = GetWaypointByTag("From_233TEL");
	AssignCommand(oSalvage, ActionMoveToObject(oFrom_233TEL, 1, 1.5));
	AdjustAlignment( GetFirstPC(), ALIGNMENT_LIGHT_SIDE, 2 );
	SetLocalBoolean(oSalvage, 40, 0);
	SetLocalBoolean(oSalvage, 39, 1);
}