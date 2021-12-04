void main() {
	SetGlobalBoolean("Tar_ZaxBounty", 1);
	if ((GetGlobalNumber("Tar_SelBoun") == 0)) {
		SetGlobalNumber("Tar_SelBoun", 10);
	}
	SetGlobalBoolean("Tar_DiaBounty", 1);
	if ((GetGlobalNumber("Tar_Matrik") == 0)) {
		SetGlobalNumber("Tar_Matrik", 10);
	}
	SetGlobalNumber("tar_benbount", 1);
}

