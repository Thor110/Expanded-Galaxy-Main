void main() {
	object oDuelAnnoun021 = GetObjectByTag("DuelAnnoun021", 0);
	object oTar02_wpannarena1 = GetObjectByTag("tar02_wpannarena1", 0);
	AssignCommand(oDuelAnnoun021, SetFacing(GetFacing(oTar02_wpannarena1)));
}

