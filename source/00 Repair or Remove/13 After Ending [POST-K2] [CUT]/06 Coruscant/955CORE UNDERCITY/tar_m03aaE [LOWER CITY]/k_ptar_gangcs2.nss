int intGLOB_130 = 62;
// Prototypes
void sub1(object objectParam1, int intParam2);

void sub1(object objectParam1, int intParam2) {
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	SetCommandable(1, objectParam1);
	SetLocalBoolean(objectParam1, intGLOB_130, 0);
	ChangeToStandardFaction(objectParam1, intParam2);
	SetMinOneHP(objectParam1, 0);
}

void main() {
	int int1;
	object object1;
	int1 = 0;
	while ((int1 < 3)) {
		object1 = GetObjectByTag(("tar03_vulkcut" + IntToString(int1)), 0);
		sub1(object1, 1);
		DelayCommand((1.0 + int1), AssignCommand(object1, ActionMoveToObject(GetObjectByTag("tar03_wpfight", 0), 1, 1.0)));
		(int1++);
	}
}

