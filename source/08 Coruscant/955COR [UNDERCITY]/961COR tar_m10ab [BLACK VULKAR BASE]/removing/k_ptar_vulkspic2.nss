void main() {
	SetGlobalNumber("Tar_VulkSpice", 2);
	SetGlobalFadeOut(0.3, 0.5, 0.0, 0.0, 0.0);
	SetGlobalFadeIn(0.90000004, 0.5, 0.0, 0.0, 0.0);
	CreateItemOnObject("tar10_mechid", GetPCSpeaker(), 1);
	DestroyObject(GetObjectByTag("tar_spice", 0), 0.0, 0, 0.0);
}

