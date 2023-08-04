void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
	if ((GetGlobalNumber("201TEL_Thugs") > 7)) {
		DestroyObject(GetObjectByTag("201_ith_drd", 0), 0.0, 1, 0.0, 0);
		DestroyObject(GetObjectByTag("201_tsf_ith", 0), 0.0, 1, 0.0, 0);
		DestroyObject(GetObjectByTag("DrdIth", 0), 0.0, 1, 0.0, 0);
	}
	if ((GetGlobalNumber("201TEL_Thugs") == 14)) {
		object o201_gren = GetObjectByTag("201_gren", 0);
		if (GetIsObjectValid(o201_gren)) {
			AssignCommand(o201_gren, ActionJumpToObject(GetObjectByTag("WP_GRENN_ITH", 0), 1));
		}
	}
	if ((GetGlobalNumber("200TEL_B4D4_T1N1") == 1)) {
		CreateObject(1, "d_201b4d4", GetLocation(GetObjectByTag("wp_b4d4", 0)), 0);
		CreateObject(1, "d_201t1n1", GetLocation(GetObjectByTag("wp_t1n1", 0)), 0);
		SetGlobalNumber("200TEL_B4D4_T1N1", 2);
	}
	if ((GetGlobalNumber("201TEL_Chano_Spawn") == 2)) {
		CreateObject(1, "201_chano", GetLocation(GetObjectByTag("wp_chano_sp", 0)), 0);
		SetGlobalNumber("201TEL_Chano_Spawn", 3);
	}
	if ((GetGlobalNumber("201TEL_Chano_Spawn") == 1)) {
		CreateObject(1, "201_chano", GetLocation(GetObjectByTag("wp_chano_czerka", 0)), 0);
		SetGlobalNumber("201TEL_Chano_Spawn", 3);
	}
	if ((GetGlobalNumber("262TEL_Escape_Telos") == 1)) {
		if ((!GetGlobalBoolean("201TEL_Spawned_Return"))) {
			SetGlobalBoolean("201TEL_Spawned_Return", 1);
			DestroyObject(GetObjectByTag("TSFDockGuard2", 0), 0.0, 0, 0.0, 0);
			DestroyObject(GetObjectByTag("TSFDockGuard2", 1), 0.0, 0, 0.0, 0);
		}
	}
}

