void main() {
	int int1 = (GetGlobalNumber("MAN_PLANET_PLOT") >= 4);
	int nRandom;
	int int4;
	if (int1) {
		nRandom = 5;
	}
	else {
		nRandom = 3;
	}
	nRandom = Random(nRandom);
	switch (nRandom) {
		case 0:
			int4 = 19973;
			break;
		case 1:
			int4 = 19975;
			break;
		case 2:
			int4 = 19976;
			break;
		case 3:
			int4 = 19974;
			break;
		case 4:
			int4 = 19977;
			break;
	}
	SetFacingPoint(GetPosition(GetPartyMemberByIndex(0)));
	BarkString(OBJECT_SELF, int4);
}

