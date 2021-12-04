void main() {
	object oBrutalized021 = GetObjectByTag("Brutalized021", 0);
	AssignCommand(GetObjectByTag("RacistChil021", 0), ActionPlayAnimation(107, 1.0, 0.0));
	AssignCommand(GetObjectByTag("RacistChil022", 0), ActionPlayAnimation(107, 1.0, 0.0));
	ApplyEffectToObject(1, EffectHorrified(), oBrutalized021, 3.0);
}

