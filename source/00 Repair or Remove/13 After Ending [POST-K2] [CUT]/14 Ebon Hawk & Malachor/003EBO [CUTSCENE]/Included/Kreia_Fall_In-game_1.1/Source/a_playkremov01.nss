void main() {
       object oWp_cut_pclast = GetObjectByTag("wp_cut_pclast", 0);
	if (GetIsObjectValid(oWp_cut_pclast)) {
		DestroyObject(oWp_cut_pclast, 0.0, 0, 0.0, 0);
	}
	CreateObject(32, "g_lastlocal", GetLocation(GetFirstPC()), 0);
	SetGlobalString("K_LAST_MODULE", GetModuleName());
	StartNewModule("910MAL", "", "", "", "", "", "", "");
	SetGlobalNumber("907MAL_CUTSCENE", 0);
}