// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

int StartingConditional() {
	int int1;
	sub1(("TAR_DIA = " + IntToString(GetGlobalNumber("Tar_Dia"))), 5, 5, 5.0);
	int1 = (GetGlobalNumber("Tar_Dia") >= 30);
	return int1;
}

