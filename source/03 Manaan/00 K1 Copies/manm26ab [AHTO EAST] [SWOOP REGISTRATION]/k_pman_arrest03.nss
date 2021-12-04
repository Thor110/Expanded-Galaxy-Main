void main() {
	string string1 = "man26_drdcut01";
	ActionPauseConversation();
	AssignCommand(GetObjectByTag(string1, 0), ActionMoveToObject(GetObjectByTag(("wp_" + string1), 0), 0, 1.0));
	ExecuteScript("k_pman_player30", GetFirstPC(), 0xFFFFFFFF);
}

