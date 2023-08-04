void main() {
	object oTar02_labdoor = GetObjectByTag("tar02_labdoor", 0);
	AssignCommand(oTar02_labdoor, ActionUnlockObject(oTar02_labdoor));
}

