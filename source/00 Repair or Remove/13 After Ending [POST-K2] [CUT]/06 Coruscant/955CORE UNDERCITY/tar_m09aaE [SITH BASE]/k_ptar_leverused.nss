void main() {
	object oTar09_wardrd;
	object object2;
	object object3;
	ActionPlayAnimation(200, 1.0, 0.0);
	if ((!GetGlobalBoolean("TAR_SITHBASEALARM"))) {
		SetGlobalBoolean("TAR_SITHBASEALARM", 1);
		oTar09_wardrd = CreateObject(1, "tar09_wardrd", GetLocation(GetObjectByTag("tar09_warspawn_01", 0)), 0);
		object2 = CreateObject(1, "tar09_wardrd", GetLocation(GetObjectByTag("tar09_warspawn_02", 0)), 0);
		object3 = CreateObject(1, "tar09_wardrd", GetLocation(GetObjectByTag("tar09_warspawn_03", 0)), 0);
		AssignCommand(oTar09_wardrd, ActionAttack(GetFirstPC(), 0));
		AssignCommand(object2, ActionAttack(GetFirstPC(), 0));
		AssignCommand(object3, ActionAttack(GetFirstPC(), 0));
	}
}

