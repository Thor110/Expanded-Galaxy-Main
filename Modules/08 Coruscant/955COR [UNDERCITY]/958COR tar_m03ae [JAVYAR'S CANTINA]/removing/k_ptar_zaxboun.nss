// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

int StartingConditional() {
	int int1;
	if ((GetGlobalNumber("Tar_Dia") == 40)) {
		int1 = 1;
	}
	if (((GetGlobalNumber("Tar_Duel") == 7) && (GetGlobalNumber("Tar_BenBount") != 99))) {
		int1 = 1;
	}
	if ((GetGlobalNumber("Tar_Matrik") == 30)) {
		int1 = 1;
	}
	sub1(("DEBUG:  tar_matrik = " + IntToString(GetGlobalNumber("Tar_Matrik"))), 5, 5, 5.0);
	if ((GetGlobalNumber("Tar_Matrik") == 40)) {
		int1 = 1;
	}
	if ((GetGlobalNumber("Tar_LargoBoun") == 30)) {
		int1 = 1;
	}
	if ((GetGlobalNumber("Tar_SelBoun") == 20)) {
		int1 = 1;
	}
	return int1;
}

