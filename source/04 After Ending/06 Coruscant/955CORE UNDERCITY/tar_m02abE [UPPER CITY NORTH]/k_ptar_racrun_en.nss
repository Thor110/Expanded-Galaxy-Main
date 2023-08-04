void main() {
	object oEntering = GetEnteringObject();
	if (((oEntering == GetObjectByTag("RacistChil022", 0)) || (oEntering == GetObjectByTag("RacistChil021", 0)))) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

