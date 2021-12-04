void main() {
	object oTar04_hendarfate = CreateObject(1, "tar04_hendarfate", GetLocation(GetObjectByTag("tar04_sphendfate", 0)), 0);
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
}

