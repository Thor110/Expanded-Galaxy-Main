// Prototypes
void sub1();

void sub1() {
	object oTar_duel_crowd = GetObjectByTag("tar_duel_crowd", 0);
	MusicBackgroundStop(GetArea(GetFirstPC()));
	AmbientSoundStop(GetArea(GetFirstPC()));
	DelayCommand(0.5, SoundObjectPlay(oTar_duel_crowd));
}

void main() {
	SetGlobalNumber("Tar_DuelAnTk", 1);
	SetGlobalFadeIn(1.0, 3.0, 0.0, 0.0, 0.0);
	SetGlobalBoolean("TAR_DUELINPROGRESS", 0);
	sub1();
	object oDeadeyeDun021 = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlonTwof021 = GetObjectByTag("GerlonTwof021", 0);
	SetLockOrientationInDialog(oGerlonTwof021, 1);
	SetLockOrientationInDialog(oDeadeyeDun021, 1);
}

