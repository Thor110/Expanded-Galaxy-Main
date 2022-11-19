int StartingConditional() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 1:
			return GetGlobalNumber("M478_Console_01");
		case 3:
			return GetGlobalNumber("M478_Console_03");
		case 40:
			return GetGlobalNumber("M478_Console_40");
		case 41:
			return GetGlobalNumber("M478_Console_41");
		case 42:
			return GetGlobalNumber("M478_Console_42");
		case 43:
			return GetGlobalNumber("M478_Console_43");
		case 44:
			return GetGlobalNumber("M478_Console_44");
		case 51:
			return GetGlobalNumber("M478_Console_51");
		case 52:
			return GetGlobalNumber("M478_Console_52");
		case 53:
			return GetGlobalNumber("M478_Console_53");
		case 54:
			return GetGlobalNumber("M478_Console_54");
		case 82:
			return GetGlobalNumber("800DRO_Map_82");
		case 83:
			return GetGlobalNumber("800DRO_Map_83");
		case 84:
			return GetGlobalNumber("800DRO_Map_84");
	}
	return 0;
}

