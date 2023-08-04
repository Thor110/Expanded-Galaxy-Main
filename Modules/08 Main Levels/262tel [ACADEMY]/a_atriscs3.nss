// Prototypes
void sub1(object objectParam1, object oPC);

void sub1(object objectParam1, object oPC) {
	if ((oPC == OBJECT_INVALID)) {
		oPC = GetFirstPC();
	}
	AssignCommand(objectParam1, SetFacingPoint(GetPositionFromLocation(GetLocation(oPC))));
}

void main() {
	int nParam1 = GetScriptParameter(1);
	if ((nParam1 == 1)) {
		SetGlobalFadeIn(0.1, 2.0, 0.0, 0.0, 0.0);
		CreateObject(64, "invisible001", GetLocation(GetWaypointByTag("sp_traya")), 0);
		AssignCommand(GetObjectByTag("AtrisCut", 0), ActionMoveToObject(GetObjectByTag("wp_atriscouncil_3", 0), 0, 1.0));
	}
	else {
		if ((nParam1 == 2)) {
			sub1(GetObjectByTag("AtrisCut", 0), GetObjectByTag("Sister1Cut", 0));
		}
		else {
			if ((nParam1 == 3)) {
				SetGlobalFadeOut(0.0, 2.0, 0.0, 0.0, 0.0);
				AssignCommand(GetFirstPC(), DelayCommand(3.0, StartNewModule("003EBO", "WP_disc_cut_4", "", "", "", "", "", "")));
				AssignCommand(GetObjectByTag("AtrisCut", 0), ActionMoveToObject(GetObjectByTag("wp_atriswind_2", 0), 0, 1.0));
				DestroyObject(GetObjectByTag("Kreia", 0), 0.0, 0, 0.0, 0);
				DelayCommand(2.0, DestroyObject(GetObjectByTag("sister1cut", 0), 0.0, 0, 0.0, 0));
				DelayCommand(2.0, DestroyObject(GetObjectByTag("sister2cut", 0), 0.0, 0, 0.0, 0));
				DelayCommand(2.0, DestroyObject(GetObjectByTag("AtrisCut", 0), 0.0, 0, 0.0, 0));
			}
		}
	}
}

