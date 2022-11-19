void main() {
	object oEntering = GetEnteringObject();
	if (((oEntering == GetObjectByTag("infectedoutcastm", 0)) || (oEntering == GetObjectByTag("infectedoutcastf", 0)))) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

