void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
	object oEntering = GetEnteringObject();
	if ((oEntering != GetFirstPC())) {
		return;
	}
	int nGlobal = GetGlobalNumber("907MAL_CUTSCENE");
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	SetFadeUntilScript();
	switch (nGlobal) {
		case 0:
			CreateObject(1, "p_kreia_evil001", GetLocation(GetObjectByTag("sp_kreia", 0)), 0);
			CreateObject(1, "n_darthnihilu001", GetLocation(GetObjectByTag("sp_nihilus", 0)), 0);
			CreateObject(1, "n_darthsion", GetLocation(GetObjectByTag("sp_sion1", 0)), 0);
			AssignCommand(GetObjectByTag("Kreia", 0), ActionStartConversation(oEntering, "kreiaend", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			break;
	}
}
