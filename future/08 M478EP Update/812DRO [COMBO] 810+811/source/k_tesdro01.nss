void main() {
	object oPlc_holo01 = GetObjectByTag("plc_holo01", 0);
	object oPlc_holo02 = GetObjectByTag("plc_holo02", 0);
	if ((GetLocalBoolean(OBJECT_SELF, 41))) {
		return;
	}
	if ((d100(1) < 40)) {
		AssignCommand(OBJECT_SELF, ActionAttack(oPlc_holo01, 1));
		DelayCommand(4.5, CancelCombat(OBJECT_SELF));
		DelayCommand(4.5, AssignCommand(OBJECT_SELF, ClearAllActions()));
	}
	else {
		if ((d100(1) < 40)) {
			AssignCommand(OBJECT_SELF, ActionAttack(oPlc_holo02, 1));
			DelayCommand(4.5, CancelCombat(OBJECT_SELF));
			DelayCommand(4.5, AssignCommand(OBJECT_SELF, ClearAllActions()));
		}
	}
}

