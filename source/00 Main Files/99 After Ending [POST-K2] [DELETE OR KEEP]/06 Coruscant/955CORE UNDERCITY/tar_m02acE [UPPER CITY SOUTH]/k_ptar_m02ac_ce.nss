// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	sub1("RUNNING ON LOAD", 5, 5, 10.0);
	if ((GetGlobalNumber("Tar_Gana") == 20)) {
		if ((!GetIsObjectValid(GetObjectByTag("tar02_wpgana02", 0)))) {
			sub1("BAD WAYPOINT", 5, 5, 10.0);
		}
		CreateObject(1, "tar02_gana21", GetLocation(GetObjectByTag("tar02_wpgana02", 0)), 0);
	}
}

