void main() {
	if (((GetGlobalNumber("K_Geno_Ithorak") > 10) && (GetGlobalBoolean("K_SithDestroy") == 1))) {
		DestroyObject(GetObjectByTag("vekdroid", 0), 0.0, 0, 0.0);
	}
}

