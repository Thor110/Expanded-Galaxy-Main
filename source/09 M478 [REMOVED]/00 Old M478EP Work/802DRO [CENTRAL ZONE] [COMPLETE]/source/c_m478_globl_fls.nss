int StartingConditional() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 1:
			return (!GetGlobalNumber("800DRO_Console_01"));
		case 3:
			return (!GetGlobalNumber("800DRO_Console_03"));
		case 10:
			return (!GetGlobalNumber("800DRO_Console_10"));
		case 11:
			return (!GetGlobalNumber("800DRO_Console_11"));
		case 12:
			return (!GetGlobalNumber("800DRO_Console_12"));
		case 13:
			return (!GetGlobalNumber("800DRO_Console_13"));
		case 20:
			return (!GetGlobalNumber("800DRO_Padawan_20"));
		case 21:
			return (!GetGlobalNumber("800DRO_Padawan_21"));
		case 22:
			return (!GetGlobalNumber("800DRO_Padawan_22"));
		case 23:
			return (!GetGlobalNumber("800DRO_Padawan_23"));
		case 31:
			return (!GetGlobalNumber("800DRO_Padawan_31"));
		case 32:
			return (!GetGlobalNumber("800DRO_Padawan_32"));
		case 33:
			return (!GetGlobalNumber("800DRO_Padawan_33"));
		case 40:
			return (!GetGlobalNumber("800DRO_Console_40"));
		case 41:
			return (!GetGlobalNumber("800DRO_Console_41"));
		case 42:
			return (!GetGlobalNumber("800DRO_Console_42"));
		case 43:
			return (!GetGlobalNumber("800DRO_Console_43"));
		case 44:
			return (!GetGlobalNumber("800DRO_Console_44"));
		case 51:
			return (!GetGlobalNumber("800DRO_Console_51"));
		case 52:
			return (!GetGlobalNumber("800DRO_Console_52"));
		case 53:
			return (!GetGlobalNumber("800DRO_Console_53"));
		case 54:
			return (!GetGlobalNumber("800DRO_Console_54"));
		case 56:
			return (!GetGlobalNumber("800DRO_Console_56"));
		case 57:
			return (!GetGlobalNumber("800DRO_Console_57"));
		case 58:
			return (!GetGlobalNumber("800DRO_Console_58"));
		case 59:
			return (!GetGlobalNumber("800DRO_Console_59"));
		case 82:
			return (!GetGlobalNumber("800DRO_Map_82"));
		case 83:
			return (!GetGlobalNumber("800DRO_Map_83"));
		case 84:
			return (!GetGlobalNumber("800DRO_Map_84"));
	}
	return 0;
}

