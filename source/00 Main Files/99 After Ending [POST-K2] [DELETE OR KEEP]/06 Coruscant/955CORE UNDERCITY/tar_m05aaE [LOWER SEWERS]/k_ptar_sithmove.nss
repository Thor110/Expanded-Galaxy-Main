void main() {
	ActionMoveToObject(GetFirstPC(), 0, 1.0);
	DelayCommand(1.0, AssignCommand(GetObjectByTag("tar05_sithtrooper", 0), ActionMoveToObject(GetFirstPC(), 0, 1.0)));
	DelayCommand(1.0, AssignCommand(GetObjectByTag("tar05_sithtrooper", 1), ActionMoveToObject(GetFirstPC(), 0, 1.0)));
}

