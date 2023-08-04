void main() {
	object oMan27_sithmas = GetObjectByTag("man27_sithmas", 0);
	object oMan27_seljed4 = GetObjectByTag("man27_seljed4", 0);
	object oMan27_seljed8 = GetObjectByTag("man27_seljed8", 0);
	ChangeToStandardFaction(oMan27_sithmas, 4);
	SignalEvent(oMan27_seljed4, EventUserDefined(20));
	DelayCommand(0.75, SignalEvent(oMan27_seljed8, EventUserDefined(10)));
	DelayCommand(1.5, SignalEvent(oMan27_seljed4, EventUserDefined(20)));
	ActionPauseConversation();
	ActionWait(4.0);
	ActionResumeConversation();
}

