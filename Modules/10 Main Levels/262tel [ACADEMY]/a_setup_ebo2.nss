void main() {
  SetGlobalNumber("003EBO_BACKGROUND",10);
	SetGlobalNumber("003EBO_RETURN_DEST", 10);//8
	if (((GetGlobalNumber("262TEL_CNPC_Freed") == 1) && (!GetLocalBoolean(OBJECT_SELF, 55)))) {
		//SetGlobalNumber("003EBO_BACKGROUND", 10);//8
		//SetGlobalNumber("003EBO_RETURN_DEST", 10);//8
		SetLocalBoolean(OBJECT_SELF, 55, 1);
		DestroyObject(GetObjectByTag("t3m4", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("baodur", 0), 0.0, 0, 0.0, 0);
		DestroyObject(GetObjectByTag("handmaiden", 0), 0.0, 0, 0.0, 0);
		if (GetGlobalBoolean("000_PLAYER_GENDER")) {
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			SetFadeUntilScript();
			CreateObject(1, "atriswindcut", GetLocation(GetObjectByTag("wp_atriswind_1", 0)), 0);
			CreateObject(1, "sister1wind", GetLocation(GetObjectByTag("wp_sister1wind_1", 0)), 0);
			CreateObject(1, "sister2wind", GetLocation(GetObjectByTag("wp_sister2wind_1", 0)), 0);
			object oAtrisWindCut = GetObjectByTag("AtrisWindCut", 0);
			DelayCommand(2.2, AssignCommand(oAtrisWindCut, ClearAllActions()));
			DelayCommand(2.2, AssignCommand(oAtrisWindCut, ActionStartConversation(GetFirstPC(), "atrissis", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
		}
		else {
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			SetFadeUntilScript();
			PlayMovie("TelMov14", 0);
			StartNewModule("950COR", "", "", "", "", "", "", "");
		}
	}
}

