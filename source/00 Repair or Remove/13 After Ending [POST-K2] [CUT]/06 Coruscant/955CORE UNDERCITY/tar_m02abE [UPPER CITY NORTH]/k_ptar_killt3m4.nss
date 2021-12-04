// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	sub1("ADDING T3M4", 5, 5, 5.0);
	SetGlobalFadeIn(0.0, 0.5, 0.0, 0.0, 0.0);
	DestroyObject(GetObjectByTag("storet3m4", 0), 0.0, 1, 0.0);
}

