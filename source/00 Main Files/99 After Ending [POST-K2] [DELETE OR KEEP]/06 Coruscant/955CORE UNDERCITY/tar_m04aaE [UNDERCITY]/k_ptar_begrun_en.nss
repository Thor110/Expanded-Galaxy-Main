// Prototypes
void sub1(string stringParam1);

void sub1(string stringParam1) {
	SpeakString(stringParam1, 0);
}

void main() {
	object oEntering = GetEnteringObject();
	if (((GetTag(oEntering) == "outcastman041") || (GetTag(oEntering) == "outcastman042"))) {
		sub1(("destroying..." + GetTag(oEntering)));
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

