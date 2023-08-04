// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	AurPostString(stringParam1, intParam2, intParam3, floatParam4);
}

void main() {
	GiveGoldToCreature(GetPCSpeaker(), 10000);
	sub1("I'M RICH!!!!", 5, 5, 1.0);
}

