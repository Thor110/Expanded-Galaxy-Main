int StartingConditional() {
	if (((GetGlobalBoolean("Tar_BastVulk") == 1) && (GetGlobalBoolean("TAR_VULKARBASE_OPEN") == 0))) {
		return 1;
	}
	return 0;
}

