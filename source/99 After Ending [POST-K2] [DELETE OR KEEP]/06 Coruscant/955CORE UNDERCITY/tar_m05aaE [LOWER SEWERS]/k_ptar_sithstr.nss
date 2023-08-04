void main() {
	object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if ((GetTag(oAreaObject) == "tar05_sithpatrol")) {
			SignalEvent(oAreaObject, EventUserDefined(2000));
		}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
	SignalEvent(OBJECT_SELF, EventUserDefined(2000));
}

