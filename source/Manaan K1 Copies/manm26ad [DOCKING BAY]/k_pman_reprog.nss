void main() {
	object oSpeaker = GetPCSpeaker();
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	SetLockOrientationInDialog(GetObjectByTag("Vekdroid", 0), 0);
	DelayCommand(0.5, ActionStartConversation(oSpeaker, "man26_assault2", 0, 0, 0, "", "", "", "", "", ""));
}

