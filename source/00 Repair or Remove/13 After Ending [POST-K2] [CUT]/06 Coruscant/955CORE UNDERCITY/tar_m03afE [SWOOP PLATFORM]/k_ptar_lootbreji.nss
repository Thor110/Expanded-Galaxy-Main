void main() {
	CreateItemOnObject("tar03_brejikband", GetFirstPC(), 1);
	CreateItemOnObject("tar03_brejikbelt", GetFirstPC(), 1);
	CreateItemOnObject("tar03_brejikglov", GetFirstPC(), 1);
	CreateItemOnObject("G_W_DBLSBR004", GetFirstPC(), 1);
	ActionPauseConversation();
	ActionMoveToLocation(GetGlobalLocation("TAR_BREJIKCORPSE"), 0);
	ActionPlayAnimation(10, 1.0, 3.0);
	ActionResumeConversation();
}

