void main() {
	if (((GetGlobalNumber("Tar_Sarna") == 99) || (GetGlobalNumber("Tar_YunGend") == 99))) {
		SetMapPinEnabled(GetObjectByTag("tar_party", 0), 1);
	}
	if (((GetGlobalNumber("Tar_Sarna") == 99) && (GetGlobalNumber("Tar_YunGend") == 99))) {
		SetMapPinEnabled(GetObjectByTag("tar_party", 0), 1);
	}
}

