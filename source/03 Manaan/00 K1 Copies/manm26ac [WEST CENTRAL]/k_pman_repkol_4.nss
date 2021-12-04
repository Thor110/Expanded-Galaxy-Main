void main() {
	int int1 = (GetGlobalNumber("MAN_PLANET_PLOT") >= 4);
	int nRandom;
	int int4;
	if (int1) {
		nRandom = 6;
	}
	else {
		nRandom = 4;
	}
	nRandom = Random(nRandom);
	switch (nRandom) {
		case 0:
			int4 = 19809;
			break;
		case 1:
			int4 = 19810;
			break;
		case 2:
			int4 = 19812;
			break;
		case 3:
			int4 = 19813;
			break;
		case 4:
			int4 = 19808;
			break;
		case 5:
			int4 = 19811;
			break;
	}
	AurPostString(("Selected: " + IntToString(nRandom)), 5, 5, 5.0);
	SetFacingPoint(GetPosition(GetPartyMemberByIndex(0)));
	BarkString(OBJECT_SELF, int4);
}

