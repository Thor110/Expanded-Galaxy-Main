void main() {
	SetGlobalBoolean("MAN_JUST_RACED", 0);
	ActionPauseConversation();
	ExecuteScript("k_pman_return07", GetFirstPC(), 0xFFFFFFFF);
}

