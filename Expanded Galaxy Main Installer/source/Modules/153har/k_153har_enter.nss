void main() {
	if ((!GetIsPC(GetEnteringObject()))) {
		return;
	}
	location location1 = Location(Vector(35.3, 1.1, 0.0), (-51.4));
	object oPlc_rsldcrpssw = GetObjectByTag("RSldCrpsSw", 0);
	if ((!GetIsObjectValid(oPlc_rsldcrpssw))) {
		oPlc_rsldcrpssw = CreateObject(64, "plc_rsldcrpssw", location1, 0);
	}
	int int3 = IsNPCPartyMember(6);
	if (int3) {
		AssignCommand(oPlc_rsldcrpssw, ActionPlayAnimation(202, 1.0, 0.0));
	}
	else {
		AssignCommand(oPlc_rsldcrpssw, ActionPlayAnimation(203, 1.0, 0.0));
	}
}

