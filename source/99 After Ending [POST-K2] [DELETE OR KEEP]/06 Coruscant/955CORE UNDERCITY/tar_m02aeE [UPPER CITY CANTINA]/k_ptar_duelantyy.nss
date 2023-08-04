void main() {
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	object oTar02_wpannarena1 = GetObjectByTag("tar02_wpannarena1", 0);
	object oDuelAnnoun021 = GetObjectByTag("DuelAnnoun021", 0);
	SetLockOrientationInDialog(oGerlonTwof021, 0);
	SetLockOrientationInDialog(oDeadeyeDun021, 0);
	SetGlobalNumber("Tar_DuelAnTk", 2);
	ChangeToStandardFaction(oDeadeyeDun021, 5);
	ChangeToStandardFaction(oGerlonTwof021, 5);
}

