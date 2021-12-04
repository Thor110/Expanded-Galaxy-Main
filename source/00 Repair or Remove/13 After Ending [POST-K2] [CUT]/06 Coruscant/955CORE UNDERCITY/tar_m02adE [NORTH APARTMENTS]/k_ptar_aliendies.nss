void main() {
	object oTar02_alienprisoner = GetObjectByTag("tar02_alienprisoner", 0);
	object oTar02_sithcommander = GetObjectByTag("tar02_sithcommander", 0);
	ActionPauseConversation();
	ChangeToStandardFaction(oTar02_alienprisoner, 4);
	ChangeToStandardFaction(oTar02_sithcommander, 2);
	ApplyEffectToObject(1, EffectAssuredHit(), oTar02_sithcommander, 8.0);
	talent talFeat = TalentFeat(29);
	AssignCommand(oTar02_sithcommander, ActionUseTalentOnObject(talFeat, oTar02_alienprisoner));
	ActionWait(3.0);
	ActionResumeConversation();
}

