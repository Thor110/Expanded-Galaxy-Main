void main() {
	object oTar02_lowdoor = GetObjectByTag("tar02_lowdoor", 0);
	if ((GetGlobalBoolean("tar_upelev") == 0)) {
		SetGlobalBoolean("tar_upelev", 1);
		GivePlotXP("tar_misc", 5);
		CreateObject(1, "tar02_ithbrutal", GetLocation(GetObjectByTag("tar02_wpithorian", 0)), 0);
		CreateObject(1, "tar02_racistboy", GetLocation(GetObjectByTag("tar02_wpracboy", 0)), 0);
		CreateObject(1, "tar02_racistgirl", GetLocation(GetObjectByTag("tar02_wpracgirl", 0)), 0);
	}
	AssignCommand(oTar02_lowdoor, ActionUnlockObject(oTar02_lowdoor));
}

