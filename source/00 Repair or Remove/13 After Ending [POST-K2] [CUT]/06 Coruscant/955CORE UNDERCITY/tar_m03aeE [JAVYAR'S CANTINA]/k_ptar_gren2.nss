void main() {
	string string1 = "flash_gren";
	location location1 = GetLocation(GetObjectByTag("GRENADE_WP", 0));
	ActionPauseConversation();
	CreateItemOnFloor(string1, location1, 0);
	DelayCommand(0.8, ActionResumeConversation());
}

