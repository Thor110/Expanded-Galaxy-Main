void main() {
	object oMan26_sunry = GetObjectByTag("man26_sunry", 0);
	object oMan26_elora = GetObjectByTag("man26_elora", 0);
	object oMan26_selguard = GetObjectByTag("man26_selguard", 0);
	object oMan26a_eloraleave = GetObjectByTag("man26a_eloraleave", 0);
	object oMan26a_sunryleave = GetObjectByTag("man26a_sunryleave", 0);
	object oMan26aa_door04 = GetObjectByTag("man26aa_door04", 0);
	AssignCommand(oMan26aa_door04, ActionOpenDoor(oMan26aa_door04));
	AssignCommand(oMan26_sunry, ActionForceMoveToObject(oMan26a_sunryleave, 0, 1.0, 30.0));
	AssignCommand(oMan26_elora, ActionForceMoveToObject(oMan26a_eloraleave, 0, 1.0, 30.0));
	ActionPauseConversation();
	ActionWait(5.0);
	ActionResumeConversation();
	DelayCommand(1.0, SetGlobalFadeOut(0.0, 4.0, 0.0, 0.0, 0.0));
}

