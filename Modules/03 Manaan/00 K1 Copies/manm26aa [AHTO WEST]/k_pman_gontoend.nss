// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	sub1("firing gonto conv", 5, 5, 5.0);
	if ((GetIsObjectValid(GetObjectByTag("man26_gonto", 0)) == 1)) {
		sub1("gonto valid", 5, 6, 5.0);
	}
	else {
		sub1("not valid", 5, 6, 5.0);
	}
	if ((GetIsInConversation(GetObjectByTag("man26_gonto", 0)) == 1)) {
		sub1("is already in conversation", 5, 7, 5.0);
	}
	else {
		sub1("is not in conv", 5, 7, 5.0);
		AssignCommand(GetObjectByTag("man26_gonto", 0), ActionStartConversation(GetFirstPC(), "man26_gonto", 0, 0, 0, "", "", "", "", "", ""));
	}
}

