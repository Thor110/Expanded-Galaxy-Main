void main() {
	object oEntering = GetEnteringObject();
	if ((oEntering == GetObjectByTag("Brutalized021", 0))) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

