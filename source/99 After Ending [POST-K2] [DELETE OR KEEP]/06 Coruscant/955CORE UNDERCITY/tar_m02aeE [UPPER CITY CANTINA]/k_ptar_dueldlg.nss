void main() {
	object oK_ptar_invis_speaker = GetObjectByTag("k_ptar_invis_speaker", 0);
	ApplyEffectToObject(1, EffectParalyze(), GetFirstPC(), 1.0);
	DelayCommand(1.0, SetGlobalFadeIn(0.0, 2.0, 0.0, 0.0, 0.0));
	DelayCommand(0.5, AssignCommand(oK_ptar_invis_speaker, ActionStartConversation(oK_ptar_invis_speaker, "", 0, 0, 1, "", "", "", "", "", "")));
}

