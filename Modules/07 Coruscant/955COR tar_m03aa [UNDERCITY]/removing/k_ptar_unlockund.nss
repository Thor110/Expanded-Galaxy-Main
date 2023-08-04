void main() {
	object oTar03_underdoor = GetObjectByTag("tar03_underdoor", 0);
	AssignCommand(oTar03_underdoor, ActionUnlockObject(oTar03_underdoor));
}

