// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	int int1;
	object oNPC;
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
	int1 = 0;
	while ((int1 < GetPartyMemberCount())) {
		oNPC = GetPartyMemberByIndex(int1);
		sub1(("HEALING - " + IntToString((GetMaxHitPoints(oNPC) - GetCurrentHitPoints(oNPC)))), 5, (5 + int1), 5.0);
		ApplyEffectToObject(0, EffectHeal((GetMaxHitPoints(oNPC) - GetCurrentHitPoints(oNPC))), oNPC, 0.0);
		ApplyEffectToObject(0, EffectVisualEffect(1019, 0), oNPC, 0.0);
		(int1++);
	}
}

