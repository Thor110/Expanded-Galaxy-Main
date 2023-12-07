void main() {
	object oRodian2 = GetObjectByTag("rodian2", 0);
	object oRodian1 = GetObjectByTag("rodian1", 0);
	object oRodian3 = GetObjectByTag("rodian3", 0);
	object oRodian4 = GetObjectByTag("rodian4", 0);

	location location1 = Location(Vector((0.1), -14.1, 0.1), 0.0);
	location location2 = Location(Vector((0.1), -11.5, 0.1), 0.0);
	location location3 = Location(Vector((-12.6), -10.5, 0.1), 0.0);

	vector struct4 = Vector(0.1, -15.5, 0.1);
	location location5 = Location(struct4, 0.0);

	AssignCommand(oRodian1, ActionMoveToLocation(location1, 0));
	AssignCommand(oRodian3, ActionMoveToLocation(location1, 0));
	AssignCommand(oRodian4, ActionMoveToLocation(location1, 0));

	AssignCommand(oRodian2, ActionMoveToLocation(location3, 0));
	AssignCommand(oRodian2, ActionMoveToLocation(location2, 0));

	ActionDoCommand(SetCommandable(1, oRodian2));
	ActionDoCommand(SetCommandable(1, oRodian1));
	ActionDoCommand(SetCommandable(1, oRodian3));
	ActionDoCommand(SetCommandable(1, oRodian4));
  
	AssignCommand(oRodian1, ActionMoveToLocation(location5, 0));
	AssignCommand(oRodian3, ActionMoveToLocation(location5, 0));
	AssignCommand(oRodian4, ActionMoveToLocation(location5, 0));
	AssignCommand(oRodian2, ActionMoveToLocation(location5, 0));

  //object oDoor = GetObjectByTag("sle99_exit01");
	//ActionOpenDoor(oDoor);
	AssignCommand(oRodian4, ActionOpenDoor(GetObjectByTag("sle99_exit01")));

	vector struct5 = Vector(0.1, -17.5, 0.1);
	location location6 = Location(struct5, 0.0);

	AssignCommand(oRodian1, ActionMoveToLocation(location6, 0));
	AssignCommand(oRodian3, ActionMoveToLocation(location6, 0));
	AssignCommand(oRodian4, ActionMoveToLocation(location6, 0));
	AssignCommand(oRodian2, ActionMoveToLocation(location6, 0));

	AssignCommand(oRodian1, ActionDoCommand(DestroyObject(oRodian1, 0.0, 0, 0.0)));
	AssignCommand(oRodian3, ActionDoCommand(DestroyObject(oRodian3, 0.0, 0, 0.0)));
	AssignCommand(oRodian4, ActionDoCommand(DestroyObject(oRodian4, 0.0, 0, 0.0)));
	AssignCommand(oRodian2, ActionDoCommand(DestroyObject(oRodian2, 0.0, 0, 0.0)));

	ActionDoCommand(SetCommandable(0, oRodian1));
	ActionDoCommand(SetCommandable(0, oRodian3));
	ActionDoCommand(SetCommandable(0, oRodian4));
	ActionDoCommand(SetCommandable(0, oRodian2));

  SetGlobalNumber("SLE_FIREBLOODS",1);
}

