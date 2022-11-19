void main() {
	object oEntering = GetEnteringObject();
	object oTar02_lookat;
	if ((oEntering == GetObjectByTag("m4h8", 0))) {
		SetGlobalNumber("Tar_Droid", 10);
		AssignCommand(oEntering, ClearAllActions());
		ApplyEffectToObject(2, EffectParalyze(), oEntering, 0.0);
		oTar02_lookat = CreateObject(64, "tar02_lookat", GetLocation(oEntering), 0);
		object oTar02_drdtalker = GetObjectByTag("tar02_drdtalker", 0);
		AssignCommand(oTar02_drdtalker, ActionStartConversation(oTar02_drdtalker, "", 0, 0, 0, "", "", "", "", "", ""));
	}
}

