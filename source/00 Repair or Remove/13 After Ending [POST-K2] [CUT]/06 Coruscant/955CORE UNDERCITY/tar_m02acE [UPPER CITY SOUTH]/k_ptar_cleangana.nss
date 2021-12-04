void main() {
	object oEntering = GetEnteringObject();
	if ((GetIsPC(oEntering) && (GetGlobalNumber("Tar_Gana") == 20))) {
		SetGlobalNumber("Tar_Gana", 30);
		DestroyObject(GetObjectByTag("GanaLavin021", 0), 0.0, 1, 0.0);
		DestroyObject(GetObjectByTag("tar02_levinthug", 0), 0.0, 1, 0.0);
		DestroyObject(GetObjectByTag("tar02_levinthug", 1), 0.0, 1, 0.0);
	}
}

