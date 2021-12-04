void main() {
	AssignCommand(GetObjectByTag("Redros", 0), ActionForceMoveToObject(GetObjectByTag("RedrosHome", 0), 1, 0.5, 3.0));
	AssignCommand(GetObjectByTag("Anglu", 0), ActionForceMoveToObject(GetObjectByTag("AngluHome", 0), 1, 0.5, 3.0));
}

