void main() {
	object oMan27_sithmas = GetObjectByTag("man27_sithmas", 0);
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 10:
			CutsceneAttack(oMan27_sithmas, 217, 9, 0);
			break;
		case 15:
			CutsceneAttack(oMan27_sithmas, 218, 9, 0);
			break;
		case 20:
			CutsceneAttack(oMan27_sithmas, 219, 9, 0);
			break;
		case 25:
			ChangeToStandardFaction(oMan27_sithmas, 2);
			ApplyEffectToObject(0, EffectHealForcePoints(50), oMan27_sithmas, 0.0);
			CancelCombat(OBJECT_SELF);
			CancelCombat(oMan27_sithmas);
			break;
	}
}

