void main() {
	BarkString(OBJECT_INVALID, 38142);
	AssignCommand(GetObjectByTag("man26_cutsunry", 0), ActionWait(2.0));
	AssignCommand(GetObjectByTag("man26_cutelassa", 0), ActionWait(1.0));
	AssignCommand(GetObjectByTag("man26_cutelassa", 0), ActionMoveToLocation(GetLocation(GetWaypointByTag("man_elassawalk")), 0));
	AssignCommand(GetObjectByTag("man26_cutsunry", 0), ActionEquipMostDamagingRanged(OBJECT_INVALID));
	ChangeToStandardFaction(GetObjectByTag("man26_cutsunry", 0), 2);
	ChangeToStandardFaction(GetObjectByTag("man26_cutelassa", 0), 4);
	AssignCommand(GetObjectByTag("man26_cutsunry", 0), ActionAttack(GetObjectByTag("man26_cutelassa", 0), 0));
}

