void main() {
	object oWp_01_03 = GetObjectByTag("wp_01_03", 0);
	int int1;
	object object3;
	MusicBackgroundPlay(GetArea(OBJECT_SELF));
	ActionPauseConversation();
	DelayCommand(1.0, AssignCommand(GetObjectByTag("daviktroop041", 0), ActionMoveToObject(GetObjectByTag("wp_01_02", 0), 0, 1.0)));
	DelayCommand(2.0, AssignCommand(GetObjectByTag("daviktroop042", 0), ActionMoveToObject(GetObjectByTag("wp_01_01", 0), 0, 1.0)));
	DelayCommand(3.0, AssignCommand(GetObjectByTag("daviktroop043", 0), ActionMoveToObject(GetObjectByTag("wp_01_00", 0), 0, 1.0)));
	ActionMoveToObject(GetObjectByTag("wp_01_03", 0), 0, 1.0);
	ActionWait(3.0);
	ActionResumeConversation();
}

