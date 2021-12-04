void main() {
	object oAreaObject;
	float float1 = 5.0;
	if ((GetDistanceBetween(OBJECT_SELF, GetObjectByTag("vulkarpool", 0)) < float1)) {
		PlayVisualAreaEffect(1016, GetLocation(OBJECT_SELF));
		oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
		while (GetIsObjectValid(oAreaObject)) {
			if ((GetTag(oAreaObject) == "vulkarpool")) {
				ApplyEffectToObject(0, EffectDeath(0, 1), oAreaObject, 0.0);
			}
			oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
		}
		ApplyEffectToObject(0, EffectDeath(0, 1), OBJECT_SELF, 0.0);
	}
}

