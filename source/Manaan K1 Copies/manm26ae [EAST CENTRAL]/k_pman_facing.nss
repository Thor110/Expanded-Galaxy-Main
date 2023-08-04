void main() {
	object oWp_facing = GetObjectByTag("wp_facing", 0);
	SetFacing(GetFacing(oWp_facing));
}

