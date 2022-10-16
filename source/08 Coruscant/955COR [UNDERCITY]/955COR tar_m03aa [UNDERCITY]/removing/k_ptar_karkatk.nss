void main() {
	object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if (((GetTag(oAreaObject) == "kandonguard02") || (GetTag(oAreaObject) == "kandonark102"))) {
			ChangeToStandardFaction(oAreaObject, 1);
		}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
	ChangeToStandardFaction(OBJECT_SELF, 1);
}

