void main() {
	if ((GetGlobalNumber("000_Jedi_Found") == 0)) {
		object oThor0 = GetObjectByTag("thor0", 0);
		if ((!GetIsObjectValid(oThor0))) {
			oThor0 = CreateObject(128, "thor0", GetLocation(OBJECT_SELF), 0);
		}
		if (GetIsObjectValid(oThor0)) {
			DelayCommand(0.5, OpenStore(oThor0, GetPCSpeaker(), 0, 0));
		}
	}
	else {
		if ((GetGlobalNumber("000_Jedi_Found") == 1)) {
			object oThor1 = GetObjectByTag("thor1", 0);
			if ((!GetIsObjectValid(oThor1))) {
				oThor1 = CreateObject(128, "thor1", GetLocation(OBJECT_SELF), 0);
			}
			if (GetIsObjectValid(oThor1)) {
				DelayCommand(0.5, OpenStore(oThor1, GetPCSpeaker(), 0, 0));
			}
		}
		else {
			if ((GetGlobalNumber("000_Jedi_Found") == 2)) {
				object oThor2 = GetObjectByTag("thor2", 0);
				if ((!GetIsObjectValid(oThor2))) {
					oThor2 = CreateObject(128, "thor2", GetLocation(OBJECT_SELF), 0);
				}
				if (GetIsObjectValid(oThor2)) {
					DelayCommand(0.5, OpenStore(oThor2, GetPCSpeaker(), 0, 0));
				}
			}
			else {
				if ((GetGlobalNumber("000_Jedi_Found") == 3)) {
					object oThor3 = GetObjectByTag("thor3", 0);
					if ((!GetIsObjectValid(oThor3))) {
						oThor3 = CreateObject(128, "thor3", GetLocation(OBJECT_SELF), 0);
					}
					if (GetIsObjectValid(oThor3)) {
						DelayCommand(0.5, OpenStore(oThor3, GetPCSpeaker(), 0, 0));
					}
				}
				else {
					if ((GetGlobalNumber("000_Jedi_Found") == 4)) {
						object oThor4 = GetObjectByTag("thor4", 0);
						if ((!GetIsObjectValid(oThor4))) {
							oThor4 = CreateObject(128, "thor4", GetLocation(OBJECT_SELF), 0);
						}
						if (GetIsObjectValid(oThor4)) {
							DelayCommand(0.5, OpenStore(oThor4, GetPCSpeaker(), 0, 0));
						}
					}
				}
			}
		}
	}
}

