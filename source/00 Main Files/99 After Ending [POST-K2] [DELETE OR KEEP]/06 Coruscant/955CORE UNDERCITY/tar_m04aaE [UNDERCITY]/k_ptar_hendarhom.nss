void main() {
	object oEntering = GetEnteringObject();
	string string1 = GetTag(oEntering);
	if (((string1 == "outcastman046") || (string1 == "outcastwoman043"))) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

