void main() {
	object oMan27aa_door03 = GetObjectByTag("man27aa_door03", 0);
	SetLocked(oMan27aa_door03, 0);
	AssignCommand(oMan27aa_door03, ActionOpenDoor(oMan27aa_door03));
	SetGlobalBoolean("MAN_SITH_FIELD", 1);
}

