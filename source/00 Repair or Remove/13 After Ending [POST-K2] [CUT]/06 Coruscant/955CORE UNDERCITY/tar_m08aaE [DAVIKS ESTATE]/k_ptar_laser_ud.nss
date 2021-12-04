void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 2000:
			ClearAllActions();
			PlaySound("cs_orbitallaser");
			ApplyEffectAtLocation(0, EffectVisualEffect(3016, 0), GetLocation(OBJECT_SELF), 0.0);
			ApplyEffectToObject(0, EffectVisualEffect(6002, 0), GetFirstPC(), 0.0);
			PlayRumblePattern(14);
			break;
	}
}

