void main() {
	object oHendarsfate = GetObjectByTag("hendarsfate", 0);
	AssignCommand(oHendarsfate, ActionMoveToObject(GetObjectByTag("wp_hendarfate99", 0), 1, 1.0));
	ActionPauseConversation();
	ActionWait(3.0);
	ActionResumeConversation();
}

