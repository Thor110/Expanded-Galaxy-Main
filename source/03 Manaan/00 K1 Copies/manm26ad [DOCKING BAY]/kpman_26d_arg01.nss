void main() {
	object oDan26ad_sitharg01 = GetObjectByTag("dan26ad_sitharg01", 0);
	object oDan26ad_sitharg02 = GetObjectByTag("dan26ad_sitharg02", 0);
	ActionPauseConversation();
	ActionMoveToObject(oDan26ad_sitharg01, 0, 1.0);
	ActionResumeConversation();
	ActionMoveToObject(oDan26ad_sitharg02, 0, 1.0);
}

