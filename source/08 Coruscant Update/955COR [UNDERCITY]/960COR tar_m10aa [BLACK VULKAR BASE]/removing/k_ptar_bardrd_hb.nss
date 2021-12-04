void main() {
	object oShapeObject;
	float float1 = 5.0;
	if (((GetDistanceBetween(OBJECT_SELF, GetObjectByTag("tar10_ptdrd03", 0)) < float1) || (GetDistanceBetween(OBJECT_SELF, GetObjectByTag("tar10_ptdrd04", 0)) < float1))) {
		PlayVisualAreaEffect(1016, GetLocation(OBJECT_SELF));
		oShapeObject = GetFirstObjectInShape(4, 10.0, GetLocation(OBJECT_SELF), 1, 1, [0.0,0.0,0.0]);
		while (GetIsObjectValid(oShapeObject)) {
			ApplyEffectToObject(0, EffectDeath(0, 1), oShapeObject, 0.0);
			oShapeObject = GetNextObjectInShape(4, 10.0, GetLocation(OBJECT_SELF), 1, 1, [0.0,0.0,0.0]);
		}
	}
}

