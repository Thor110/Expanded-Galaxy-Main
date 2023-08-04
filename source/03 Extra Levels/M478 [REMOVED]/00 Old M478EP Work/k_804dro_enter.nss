void main() {
	object oEntering = GetEnteringObject();
	object oDroidPlanetDoor01 = GetObjectByTag("DroidPlanetDoor01", 0);
	object oSithDoor6 = GetObjectByTag("SithDoor6", 0);
	if ((GetLocalBoolean(OBJECT_SELF, 31) == 0)) {
		DelayCommand(1.0, AssignCommand(oSithDoor6, ActionOpenDoor(oSithDoor6)));
		SetLocalBoolean(OBJECT_SELF, 31, 1);
	}
	object oHidden_turret = GetObjectByTag("hidden_turret", 0);
	if (GetIsObjectValid(oHidden_turret)) {
		DelayCommand(0.1, AssignCommand(oHidden_turret, ActionPlayAnimation(43, 1.0, (-1.0))));
		DelayCommand(0.1, AssignCommand(GetObjectByTag("hidden_turret", 1), ActionPlayAnimation(43, 1.0, (-1.0))));
	}
	if ((oEntering != GetFirstPC())) {
		return;
	}
	if (GetLoadFromSaveGame()) {
		return;
	}
	if ((GetGlobalNumber("800DRO_Map_84") == 1)) {
		RevealMap([0.0,0.0,0.0], 0xFFFFFFFF);
	}
	if ((GetGlobalNumber("804_I101") > 6)) {
		object oSithDoor7 = GetObjectByTag("SithDoor7", 0);
		SetLocked(oSithDoor7, 0);
	}
	if ((GetGlobalNumber("M478_Console_54") == 10)) {
		SetLocked(oDroidPlanetDoor01, 0);
		DestroyObject(GetObjectByTag("meddroid_r", 0), 0.0, 0, 0.0, 0);
	}
	if ((GetGlobalNumber("M478_Console_59") == 1)) {
		SetGlobalNumber("M478_Console_59", 2);
		CreateObject(64, "placecam2", Location(Vector(51.46225, (-72.13826), 33.13981), 0.0), 0);
		CreateObject(64, "placecam1", Location(Vector(194.60127, (-44.43087), 33.13981), 0.0), 0);
		CreateObject(64, "placecam3", Location(Vector(194.2511, (-61.66892), 33.13981), 0.0), 0);
		CreateObject(1, "stunt_astro1", Location(Vector(45.63673, (-67.6002), 33.13981), 0.0), 0);
		CreateObject(1, "stunt_astro2", Location(Vector(186.1478, (-61.35739), 33.13981), 0.0), 0);
		AssignCommand(GetObjectByTag("IS03", 0), ActionStartConversation(oEntering, "802overload", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	}
	if (((GetJournalEntry("hk01") == 28) && (!GetIsObjectValid(GetObjectByTag("hkupgr", 0))))) {
		CreateObject(1, "hkupgr", GetLocation(GetWaypointByTag("spawn_hkupgr")), 0);
		AssignCommand(GetObjectByTag("hkwardro3", 0), ActionJumpToLocation(GetLocation(GetWaypointByTag("jump_hkwar3"))));
		AssignCommand(GetObjectByTag("hkwardro2", 0), ActionJumpToLocation(GetLocation(GetWaypointByTag("jump_hkwar2"))));
	}
	if ((((GetGlobalNumber("800_partsquest") == 2) && (GetGlobalNumber("804_missdro") == 4)) && (!GetIsObjectValid(GetObjectByTag("fake_manuf", 0))))) {
		DestroyObject(GetObjectByTag("meddroid", 0), 0.0, 0, 0.0, 0);
		CreateObject(1, "fake_manuf", Location(Vector(107.01816, 161.40916, 33.13981), 0.0), 0);
	}
	if ((GetLocalBoolean(OBJECT_SELF, 32) == 0)) {
		SetLocalBoolean(GetObjectByTag("rapidtransit", 0), 40, 1);
		SetLocalBoolean(GetObjectByTag("rapidtransit_a", 0), 41, 1);
		SetLocalBoolean(OBJECT_SELF, 32, 1);
	}
}

