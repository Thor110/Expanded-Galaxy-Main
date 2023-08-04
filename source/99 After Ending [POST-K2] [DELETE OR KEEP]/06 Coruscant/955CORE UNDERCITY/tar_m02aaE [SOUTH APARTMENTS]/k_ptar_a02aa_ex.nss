void main() {
	object oTrooper1 = GetObjectByTag("Trooper1", 0);
	object oDroid1 = GetObjectByTag("droid1", 0);
	object oDroid2 = GetObjectByTag("droid2", 0);
	if (((((!GetIsObjectValid(oTrooper1)) && (!GetIsObjectValid(oDroid1))) && (!GetIsObjectValid(oDroid2))) || (((GetIsDead(oTrooper1) && GetIsDead(oDroid1)) && GetIsDead(oDroid2)) && (!GetLoadFromSaveGame())))) {
		DestroyObject(GetObjectByTag("Duros", 0), 0.0, 0, 0.0);
	}
}

