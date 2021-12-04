void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
	if ((GetGlobalNumber("003EBO_Hatch") == 1)) {
		object oInveb001 = GetObjectByTag("EboHiddenContainer", 0);
		if ((!GetIsObjectValid(oInveb001))) {
			object oWP_HIDDEN_CONTAINER = GetWaypointByTag("WP_HIDDEN_CONTAINER");
			location location1 = GetLocation(oWP_HIDDEN_CONTAINER);
			oInveb001 = CreateObject(64, "inveb001", location1, 0);
		}
	}
}

