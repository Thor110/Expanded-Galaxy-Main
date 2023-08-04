void main() {
	AssignCommand(GetObjectByTag("holo1", 0), PlayAnimation(201, 1.0, 0.0));
	AssignCommand(GetObjectByTag("holo2", 0), PlayAnimation(201, 1.0, 0.0));
	AssignCommand(GetObjectByTag("holo3", 0), PlayAnimation(201, 1.0, 0.0));
	AssignCommand(GetObjectByTag("holo4", 0), PlayAnimation(201, 1.0, 0.0));
	AssignCommand(GetObjectByTag("holo1", 0), PlayAnimation(201, 1.0, 0.0));
	AssignCommand(GetObjectByTag("holo5", 0), PlayAnimation(201, 1.0, 0.0));
	AssignCommand(GetObjectByTag("holo6", 0), PlayAnimation(201, 1.0, 0.0));
	PlaySound("gen_shieldredon");
	SetLocked(GetObjectByTag("holo1", 0), 0);
	SetLocked(GetObjectByTag("holo2", 0), 0);
	SetLocked(GetObjectByTag("holo3", 0), 0);
	SetLocked(GetObjectByTag("holo4", 0), 0);
	SetLocked(GetObjectByTag("holo5", 0), 0);
	SetLocked(GetObjectByTag("holo6", 0), 0);
}

