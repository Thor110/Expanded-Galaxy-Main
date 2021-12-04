// Prototypes
void sub1();

void sub1() {
	ClearAllActions();
	ActionPlayAnimation(25, 1.0, 3.0);
	ActionPlayAnimation(0, 1.0, 1.0);
}

void main() {
	object oTar02_sithdoor = GetObjectByTag("tar02_sithdoor", 0);
	object oWeldingdroid = GetObjectByTag("weldingdroid", 0);
	SetCommandable(1, GetFirstPC());
	AssignCommand(GetPartyMemberByIndex(0), sub1());
	SoundObjectPlay(oWeldingdroid);
	DelayCommand(3.0, SoundObjectStop(oWeldingdroid));
	DelayCommand(3.0, AssignCommand(oTar02_sithdoor, ActionOpenDoor(oTar02_sithdoor)));
	ActionPauseConversation();
	ActionWait(4.0);
	ActionResumeConversation();
}

