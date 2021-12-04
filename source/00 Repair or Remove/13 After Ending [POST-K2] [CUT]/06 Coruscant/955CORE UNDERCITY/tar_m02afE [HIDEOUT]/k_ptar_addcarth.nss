void main() {
	object object1 = OBJECT_SELF;
	AddAvailableNPCByTemplate(2, "p_carth");
	ActionMoveToObject(GetObjectByTag("pebn_carth", 0), 0, 1.0);
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("tar02_swplayerapt", 0))));
	ActionDoCommand(SetCommandable(1, object1));
	SetCommandable(0, OBJECT_SELF);
}

