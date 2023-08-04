void main() {
	PlaySound("cs_swoopcheer");
	ActionPauseConversation();
	ActionWait(2.0);
	ActionResumeConversation();
	int int1 = 1;
	object object1 = GetObjectByTag(("man26_swoop" + IntToString(int1)), 0);
	while (GetIsObjectValid(object1)) {
		DelayCommand((IntToFloat(Random(5)) / 10.0), ExecuteScript("k_pman_cheer02", object1, 0xFFFFFFFF));
		(int1++);
		object1 = GetObjectByTag(("man26_swoop" + IntToString(int1)), 0);
	}
}

