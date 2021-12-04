int intGLOB_130 = 62;
// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	int int1;
	object object1;
	int1 = 0;
	while ((int1 < 3)) {
		object1 = GetObjectByTag(("tar03_bekcs" + IntToString(int1)), 0);
		sub1(((("AI FLAG - " + GetTag(object1)) + " = ") + IntToString(GetLocalBoolean(object1, intGLOB_130))), 5, (5 + int1), 5.0);
		object1 = GetObjectByTag(("tar03_vulkcut" + IntToString(int1)), 0);
		sub1(((("AI FLAG - " + GetTag(object1)) + " = ") + IntToString(GetLocalBoolean(object1, intGLOB_130))), 5, (8 + int1), 5.0);
		(int1++);
	}
}

