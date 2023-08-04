void main() {
	object oMan_invis_speaker = GetObjectByTag("man_invis_speaker", 0);
	DelayCommand(0.5, AssignCommand(oMan_invis_speaker, ActionStartConversation(OBJECT_SELF, "", 0, 0, 0, "", "", "", "", "", "")));
	DelayCommand(0.6, SetGlobalFadeIn(0.0, 0.0, 0.0, 0.0, 0.0));
}

