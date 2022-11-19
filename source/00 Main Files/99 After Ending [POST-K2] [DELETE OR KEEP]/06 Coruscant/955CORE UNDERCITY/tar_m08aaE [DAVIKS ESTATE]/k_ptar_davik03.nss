void main() {
	CreateObject(1, "tar08_davik082", GetLocation(GetObjectByTag("tar08_wpdavtour3", 0)), 0);
	CreateObject(1, "tar08_calo082", GetLocation(GetObjectByTag("tar08_wpspcalo", 0)), 0);
	ActionPauseConversation();
	DelayCommand(3.0, AssignCommand(GetObjectByTag("calo081", 0), ActionMoveToObject(GetObjectByTag("tar08_wpdavikintro", 0), 0, 1.0)));
	ActionMoveToObject(GetObjectByTag("tar08_wpdavikintro", 0), 0, 1.0);
	ActionJumpToObject(GetObjectByTag("tar08_sw08aa", 0), 0);
	ActionDoCommand(DestroyObject(GetObjectByTag("calo081", 0), 0.0, 1, 0.0));
	ActionResumeConversation();
}

