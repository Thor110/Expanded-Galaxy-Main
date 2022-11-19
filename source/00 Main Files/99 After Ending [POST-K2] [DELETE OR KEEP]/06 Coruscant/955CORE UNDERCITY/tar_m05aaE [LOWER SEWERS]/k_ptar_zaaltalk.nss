void main() {
	object oTar05_zaalbar = GetObjectByTag("tar05_zaalbar", 0);
	DelayCommand(0.5, AssignCommand(oTar05_zaalbar, ActionStartConversation(GetFirstPC(), "tar05_zaalbar", 0, 0, 1, "", "", "", "", "", "")));
}

