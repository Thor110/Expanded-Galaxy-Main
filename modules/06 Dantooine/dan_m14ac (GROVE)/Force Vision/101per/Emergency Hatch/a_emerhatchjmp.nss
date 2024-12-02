void main() {
	object oWP_EMER_HATCH = GetObjectByTag("WP_EMER_HATCH", 0);
	EnableVideoEffect(3);
	AssignCommand(GetPCSpeaker(), ActionJumpToLocation(GetLocation(oWP_EMER_HATCH)));
}

