void main() {
	ActionPauseConversation();
	ActionWait(4.0);
	ActionResumeConversation();
	object object1;
	int int1 = 1;
	while ((int1 <= 3)) {
		SignalEvent(GetObjectByTag(("man27_seljed" + IntToString(int1)), 0), EventUserDefined(20));
		(int1++);
	}
}

