void main() {
	object oTar02_labdoor = GetObjectByTag("tar02_labdoor", 0);
	SetGlobalNumber("Tar_ZelkaRm", 2);
	SetLocked(oTar02_labdoor, 0);
	ActionPauseConversation();
	ActionForceMoveToObject(oTar02_labdoor, 0, 1.0, 10.0);
	ActionOpenDoor(oTar02_labdoor);
}

