// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	sub1("Spawn", 5, 5, 5.0);
	object oRedros;
	if ((GetGlobalBoolean("Tar_GadonDead") == 1)) {
		oRedros = GetObjectByTag("Anglu", 0);
	}
	else {
		oRedros = GetObjectByTag("Redros", 0);
	}
	AssignCommand(oRedros, ActionJumpToObject(GetObjectByTag("victory1", 0), 0));
}

