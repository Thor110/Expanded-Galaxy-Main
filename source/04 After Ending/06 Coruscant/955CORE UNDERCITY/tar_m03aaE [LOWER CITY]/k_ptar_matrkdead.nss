// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	SetGlobalNumber("Tar_Matrik", 40);
	sub1(("DEBUG:  TAR_MATRIK = " + IntToString(GetGlobalNumber("Tar_Matrik"))), 5, 5, 5.0);
}

