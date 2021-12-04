int StartingConditional() {
	int nGlobal = GetGlobalNumber("K_CURRENT_PLANET");
	if (((((((nGlobal != 10) && (nGlobal != 15)) && (nGlobal != 20)) && (nGlobal != 25)) && (nGlobal != 30)) && (nGlobal != 35))) {
		return 1;
	}
	else {
		if ((nGlobal == 10)) {
			if (((((((((GetGlobalBoolean("K_TAR_SWOOP_POINT_01") || GetGlobalBoolean("K_TAR_SWOOP_POINT_02")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_03")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_04")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_05")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_06")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_07")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_08")) || GetGlobalBoolean("K_TAR_SWOOP_POINT_09"))) {
				return 0;
			}
		}
		else {
			if ((nGlobal == 15)) {
				if (((((GetGlobalBoolean("K_DAN_SWOOP_POINT_01") || GetGlobalBoolean("K_DAN_SWOOP_POINT_02")) || GetGlobalBoolean("K_DAN_SWOOP_POINT_03")) || GetGlobalBoolean("K_DAN_SWOOP_POINT_04")) || GetGlobalBoolean("K_DAN_SWOOP_POINT_05"))) {
					return 0;
				}
			}
			else {
				if ((nGlobal == 20)) {
					if (((((GetGlobalBoolean("K_KAS_SWOOP_POINT_01") || GetGlobalBoolean("K_KAS_SWOOP_POINT_02")) || GetGlobalBoolean("K_KAS_SWOOP_POINT_03")) || GetGlobalBoolean("K_KAS_SWOOP_POINT_04")) || GetGlobalBoolean("K_KAS_SWOOP_POINT_05"))) {
						return 0;
					}
				}
				else {
					if ((nGlobal == 25)) {
						if (((((GetGlobalBoolean("K_MAN_SWOOP_POINT_01") || GetGlobalBoolean("K_MAN_SWOOP_POINT_02")) || GetGlobalBoolean("K_MAN_SWOOP_POINT_03")) || GetGlobalBoolean("K_MAN_SWOOP_POINT_04")) || GetGlobalBoolean("K_MAN_SWOOP_POINT_05"))) {
							return 0;
						}
					}
					else {
						if ((nGlobal == 30)) {
							if ((((GetGlobalBoolean("K_KOR_SWOOP_POINT_01") || GetGlobalBoolean("K_KOR_SWOOP_POINT_02")) || GetGlobalBoolean("K_KOR_SWOOP_POINT_03")) || GetGlobalBoolean("K_KOR_SWOOP_POINT_04"))) {
								return 0;
							}
						}
						else {
							if ((nGlobal == 35)) {
								if ((((GetGlobalBoolean("K_TAT_SWOOP_POINT_01") || GetGlobalBoolean("K_TAT_SWOOP_POINT_02")) || GetGlobalBoolean("K_TAT_SWOOP_POINT_03")) || GetGlobalBoolean("K_TAT_SWOOP_POINT_04"))) {
									return 0;
								}
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

