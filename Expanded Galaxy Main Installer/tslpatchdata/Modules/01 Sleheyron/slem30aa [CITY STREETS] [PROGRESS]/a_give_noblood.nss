void main() {
	object oRodian2 = GetObjectByTag("rodian2", 0);
	object oRodian1 = GetObjectByTag("rodian1", 0);
	object oRodian3 = GetObjectByTag("rodian3", 0);
	object oRodian4 = GetObjectByTag("rodian4", 0);
	if ((((GetIsDead(oRodian2) && GetIsDead(oRodian1)) && GetIsDead(oRodian3)) && GetIsDead(oRodian4))) {
		SetGlobalNumber("SLE_FIREBLOODS", 3);
    SetAreaUnescapable(0);
	}
}

