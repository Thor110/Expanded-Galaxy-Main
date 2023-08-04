void main() {
	object oMan26aa_door02 = GetObjectByTag("man26aa_door02", 0);
	SetLocked(oMan26aa_door02, 1);
	AssignCommand(oMan26aa_door02, ActionCloseDoor(oMan26aa_door02));
}

