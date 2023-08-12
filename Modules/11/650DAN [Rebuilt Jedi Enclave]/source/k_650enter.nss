void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
	object oEntering = GetEnteringObject();
	object oFROM_605DAN = GetObjectByTag("FROM_605DAN", 0);
	if ((((GetFirstPC() == oEntering) && (!GetLocalBoolean(oFROM_605DAN, 42))) && (GetGlobalNumber("500OND_DarkSide_Iziz") == 0))) {
		if ((GetGlobalNumber("852NIH_Nihilus_Dead") == 0))
    {
      SetLocalBoolean(oFROM_605DAN, 42, 1);
      SetGlobalNumber("853NIH_CUTSCENE", 1);
      StartNewModule("853NIH", "", "", "", "", "", "", "");
    }
	}
	else {
		object oWP_council_kavar;
		if (((GetGlobalNumber("000_ZezKaiEll_Dead") == 0) && (!GetIsObjectValid(GetObjectByTag("Zezkaiell", 0))))) {
			oWP_council_kavar = GetWaypointByTag("WP_council_zez");
			CreateObject(1, "npc_zezkaiell", GetLocation(oWP_council_kavar), 0);
		}
		if (((GetGlobalNumber("000_Vrook_Dead") == 0) && (!GetIsObjectValid(GetObjectByTag("Vrook", 0))))) {
			oWP_council_kavar = GetWaypointByTag("WP_council_vrook");
			CreateObject(1, "npc_vrook", GetLocation(oWP_council_kavar), 0);
		}
		if (((GetGlobalNumber("000_Kavar_Dead") == 0) && (!GetIsObjectValid(GetObjectByTag("kavar", 0))))) {
			oWP_council_kavar = GetWaypointByTag("WP_council_kavar");
			CreateObject(1, "npc_kavar", GetLocation(oWP_council_kavar), 0);
		}
	}
}

