void main() {
	SetGlobalBoolean("Tar_SithPatrolDroid", 1);
	object oTar09_patdroid = GetObjectByTag("tar09_patdroid", 0);
	ChangeToStandardFaction(oTar09_patdroid, 5);
	AssignCommand(oTar09_patdroid, ClearAllActions());
}

