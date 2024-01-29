void main() {
	object oSle99_rhendihang = GetObjectByTag("sle99_rhendihang", 0);
	object oSle99_hangguard1 = GetObjectByTag("hangguard01", 0);
	object oSle99_hangguard2 = GetObjectByTag("hangguard02", 0);
	location location1 = Location(Vector((-23.0), 8.66, 2.53), 0.0);
	location location3 = Location(Vector((-11.43), 24.04, 0.03), 0.0);
	float float1 = 8.13;
	float float2 = 37.72;
	float float3 = 0.03;
	int int1 = 0;
	AssignCommand(oSle99_rhendihang, ActionMoveToLocation(location1, 0));
	AssignCommand(oSle99_hangguard1, ActionMoveToLocation(location1, 0));
	AssignCommand(oSle99_hangguard2, ActionMoveToLocation(location1, 0));
	AssignCommand(oSle99_rhendihang, ActionMoveToLocation(location3, 0));
	AssignCommand(oSle99_hangguard1, ActionMoveToLocation(location3, 0));
	AssignCommand(oSle99_hangguard2, ActionMoveToLocation(location3, 0));
	vector struct4 = Vector(float1, float2, float3);
	location location5 = Location(struct4, 0.0);
	ActionDoCommand(SetCommandable(1, oSle99_rhendihang));
	ActionDoCommand(SetCommandable(1, oSle99_hangguard1));
	ActionDoCommand(SetCommandable(1, oSle99_hangguard2));
	AssignCommand(oSle99_rhendihang, ActionForceMoveToLocation(location5, int1, 30.0));
	AssignCommand(oSle99_hangguard1, ActionForceMoveToLocation(location5, int1, 30.0));
	AssignCommand(oSle99_hangguard2, ActionForceMoveToLocation(location5, int1, 30.0));
	AssignCommand(oSle99_rhendihang, ActionDoCommand(DestroyObject(oSle99_rhendihang, 0.0, 0, 0.0)));
	AssignCommand(oSle99_hangguard1, ActionDoCommand(DestroyObject(oSle99_hangguard1, 0.0, 0, 0.0)));
	AssignCommand(oSle99_hangguard2, ActionDoCommand(DestroyObject(oSle99_hangguard2, 0.0, 0, 0.0)));
	ActionDoCommand(SetCommandable(0, oSle99_rhendihang));
	ActionDoCommand(SetCommandable(0, oSle99_hangguard1));
	ActionDoCommand(SetCommandable(0, oSle99_hangguard2));
}

