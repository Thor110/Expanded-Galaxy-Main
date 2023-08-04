void main() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 1:
			PlayMovie("permov01", 0);
			break;
		case 2:
			PlayMovie("permov02", 0);
			break;
		case 3:
			PlayMovie("permov03", 0);
			break;
		case 4:
			StartNewModule("106PERm", "", "", "", "", "", "", "");
			break;
		case 5:
			StartNewModule("003EBO", "", "permov05", "", "", "", "", "");
			break;
		case 6:
			PlayMovie("permov06", 0);
			break;
		case 7:
			PlayMovie("permov07", 0);
			break;
	}
}

