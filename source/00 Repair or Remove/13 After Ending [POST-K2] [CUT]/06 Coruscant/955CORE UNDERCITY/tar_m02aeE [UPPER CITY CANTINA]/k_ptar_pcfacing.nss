void main() {
	object oBP_PC_WP = GetObjectByTag("BP_PC_WP", 0);
	object oNPC = GetPartyMemberByIndex(0);
	AssignCommand(oNPC, SetFacing(GetFacing(oBP_PC_WP)));
}

