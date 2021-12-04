void main() {
	object oWP_T3_HOLO = GetObjectByTag("WP_T3_HOLO", 0);
	if (GetIsObjectValid(GetObjectByTag("Carth", 0))) {
		return;
	}
	if (GetIsObjectValid(GetObjectByTag("Bastila", 0))) {
		return;
	}
	if (((GetGlobalNumber("101PER_Revan_Sex") == 1) && (GetGlobalNumber("101PER_Revan_End") == 0))) {
		CreateObject(1, "p_Carth001", GetLocation(oWP_T3_HOLO), 0);
	}
	if (((GetGlobalNumber("101PER_Revan_Sex") == 1) && (GetGlobalNumber("101PER_Revan_End") == 1))) {
		CreateObject(1, "p_Carth002", GetLocation(oWP_T3_HOLO), 0);
	}
	if (((GetGlobalNumber("101PER_Revan_Sex") == 0) && (GetGlobalNumber("101PER_Revan_End") == 1))) {
		CreateObject(1, "p_bastilla002", GetLocation(oWP_T3_HOLO), 0);
	}
	if (((GetGlobalNumber("101PER_Revan_Sex") == 0) && (GetGlobalNumber("101PER_Revan_End") == 0))) {
		CreateObject(1, "p_bastilla001", GetLocation(oWP_T3_HOLO), 0);
	}
}

