void main() {
	object oTwitch021;
	object oEntering = GetEnteringObject();
	switch (GetGlobalNumber("tar_duel")) {
		case 0:
			oTwitch021 = GetObjectByTag("deadeyedun021", 0);
			break;
		case 1:
			oTwitch021 = GetObjectByTag("gerlontwof021", 0);
			break;
		case 2:
			oTwitch021 = GetObjectByTag("ice021", 0);
			break;
		case 3:
			oTwitch021 = GetObjectByTag("marl021", 0);
			break;
		case 4:
			oTwitch021 = GetObjectByTag("twitch021", 0);
			break;
	}
	if (GetIsPC(oEntering)) {
		DestroyObject(oTwitch021, 0.0, 0, 0.0);
		SetGlobalNumber("tar_duel", (GetGlobalNumber("tar_duel") + 1));
	}
}

