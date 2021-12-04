void main() {
	AssignCommand(GetObjectByTag("OutcastMan41", 0), ActionMoveToObject(GetObjectByTag("OutcastExit", 0), 1, 1.0));
	AssignCommand(GetObjectByTag("OutcastMan42", 0), ActionMoveToObject(GetObjectByTag("OutcastExit", 0), 1, 1.0));
	ActionDoCommand(DestroyObject(GetObjectByTag("OutcastMan41", 0), 3.0, 0, 0.0));
	ActionDoCommand(DestroyObject(GetObjectByTag("OutcastMan42", 0), 3.0, 0, 0.0));
}

