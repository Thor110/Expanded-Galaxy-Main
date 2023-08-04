void main() {
	object oEntering = GetEnteringObject();
	if (((oEntering == GetObjectByTag("sarna021", 0)) || (oEntering == GetObjectByTag("yungenda021", 0)))) {
		DestroyObject(oEntering, 0.0, 0, 0.0);
	}
}

