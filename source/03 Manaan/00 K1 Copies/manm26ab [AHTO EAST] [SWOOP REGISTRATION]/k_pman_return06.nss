void main() {
	PlaySound("cs_swoopboo");
	ActionPauseConversation();
	ExecuteScript("k_pman_player04", GetFirstPC(), 0xFFFFFFFF);
	int int1 = 1;
	object object2 = GetObjectByTag(("man26_swoop" + IntToString(int1)), 0);
	while (GetIsObjectValid(object2)) {
		DelayCommand((IntToFloat(Random(5)) / 10.0), ExecuteScript("k_pman_cheer04", object2, 0xFFFFFFFF));
		(int1++);
		object2 = GetObjectByTag(("man26_swoop" + IntToString(int1)), 0);
	}
}

