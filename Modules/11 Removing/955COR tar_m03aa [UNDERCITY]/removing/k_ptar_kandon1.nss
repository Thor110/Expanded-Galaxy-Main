void main() {
	object oAreaObject;
	SetGlobalBoolean("Tar_KandonMission", 1);
	oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if (((GetTag(oAreaObject) == "kandonguard02") || (GetTag(oAreaObject) == "kandonark102"))) {
			ChangeToStandardFaction(oAreaObject, 1);
		}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
	DestroyObject(OBJECT_SELF, 0.0, 0, 0.0);
	StartNewModule("tar_m03aa", "tar03_sw03aac", "", "", "", "", "", "");
}

