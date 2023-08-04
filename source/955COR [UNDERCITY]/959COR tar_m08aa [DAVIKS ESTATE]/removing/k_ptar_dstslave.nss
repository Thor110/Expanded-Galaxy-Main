void main() {
	object oEntering = GetEnteringObject();
	if ((GetTag(oEntering) == "davikslave081")) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

