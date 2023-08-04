void main() {
	object oWP_JM1_HOLO = GetObjectByTag("WP_JM1_HOLO", 0);
	object oWP_JM2_HOLO = GetObjectByTag("WP_JM2_HOLO", 0);
	object oWP_JM4_HOLO = GetObjectByTag("WP_JM4_HOLO", 0);
	object oWP_JM3_HOLO = GetObjectByTag("WP_JM3_HOLO", 0);
	object oWP_ATRIS_HOLO = GetObjectByTag("WP_ATRIS_HOLO", 0);
	object oNpc_vrook003 = GetObjectByTag("JediMaster1", 0);
	object oNpc_vrook = GetObjectByTag("JediMaster2", 0);
	object oNpc_vrook002 = GetObjectByTag("JediMaster4", 0);
	object oNpc_vrook004 = GetObjectByTag("JediMaster3", 0);
	object oNpc_atris002 = GetObjectByTag("Atris", 0);
	if ((!GetIsObjectValid(oNpc_vrook))) {
		oNpc_vrook = CreateObject(1, "npc_vrook", GetLocation(oWP_JM2_HOLO), 0);
		SetLockOrientationInDialog(oNpc_vrook, 1);
	}
	if ((!GetIsObjectValid(oNpc_vrook002))) {
		oNpc_vrook002 = CreateObject(1, "npc_vrook002", GetLocation(oWP_JM4_HOLO), 0);
		SetLockOrientationInDialog(oNpc_vrook002, 1);
	}
	if ((!GetIsObjectValid(oNpc_vrook004))) {
		oNpc_vrook004 = CreateObject(1, "npc_vrook004", GetLocation(oWP_JM3_HOLO), 0);
		SetLockOrientationInDialog(oNpc_vrook004, 1);
	}
	if ((!GetIsObjectValid(oNpc_vrook003))) {
		oNpc_vrook003 = CreateObject(1, "npc_vrook003", GetLocation(oWP_JM1_HOLO), 0);
		SetLockOrientationInDialog(oNpc_vrook003, 1);
	}
	if ((!GetIsObjectValid(oNpc_atris002))) {
		oNpc_atris002 = CreateObject(1, "npc_atris002", GetLocation(oWP_ATRIS_HOLO), 0);
		SetLockOrientationInDialog(oNpc_atris002, 1);
	}
}

