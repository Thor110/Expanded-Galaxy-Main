void main() {
	int nParam1 = GetScriptParameter(1);
	object oHK50cut = GetObjectByTag("HK50cut", 0);
	object oHK47 = GetObjectByTag("HK47", 0);
	effect efVisual = EffectVisualEffect(1008, 0);
	effect efEntangle = EffectEntangle();
	effect efBeam = EffectBeam(2028, oHK47, 4, 0);
	effect efDeath = EffectDeath(0, 0, 1);
	switch (nParam1) {
		case 0:
			AssignCommand(oHK47, ClearAllActions());
			ApplyEffectToObject(2, efEntangle, oHK50cut, 0.0);
			AssignCommand(oHK47, ActionPlayAnimation(10538, 1.0, 8.8));
			DelayCommand(0.3, ApplyEffectToObject(1, efBeam, oHK50cut, 8.2));
			DelayCommand(0.3, ApplyEffectToObject(1, efVisual, oHK50cut, 8.2));
			DelayCommand(0.5, AssignCommand(oHK50cut, ActionPlayAnimation(21, 1.0, 8.3)));
			DelayCommand(8.8, ApplyEffectToObject(2, efDeath, oHK50cut, 0.0));
			break;
		case 1:
			AssignCommand(GetObjectByTag("Atton", 0), ActionPlayAnimation(31, 1.0, (-1.0)));
			AssignCommand(oHK47, ClearAllActions());
			DelayCommand(0.2, AssignCommand(oHK47, ActionPlayAnimation(10538, 1.0, 3.3)));
			DelayCommand(0.5, ApplyEffectToObject(1, efBeam, oHK50cut, 3.0));
			DelayCommand(0.5, ApplyEffectToObject(1, efVisual, oHK50cut, 3.0));
			DelayCommand(0.8, AssignCommand(oHK50cut, ActionPlayAnimation(21, 1.0, 3.3)));
			break;
		case 2:
			AssignCommand(oHK47, ClearAllActions());
			SetGlobalNumber("262TEL_HK_Factory", 1);
			DestroyObject(oHK50cut, 0.0, 0, 0.0, 0);
			SetGlobalFadeOut(8.0, 2.0, 0.0, 0.0, 0.0);
			break;
	}
}

