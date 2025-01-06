void main() {
	int nParam1 = GetScriptParameter(1);
	switch (nParam1) {
		case 1:
			SetGlobalFadeIn(1.0, 2.0, 0.0, 0.0, 0.0);
			break;
		case 2:
			CreateObject(1, "p_hanharr001", GetLocation(GetObjectByTag("sp_hanharr", 0)), 0);
			break;
		case 3:
			{
				object oMira = GetObjectByTag("Mira", 0);
				AssignCommand(oMira, ClearAllActions());
				AssignCommand(oMira, ActionMoveToObject(GetObjectByTag("wp_mira_01", 0), 0, 1.0));
			}
			break;
		case 4:
			DestroyObject(GetObjectByTag("Mira", 0), 0.0, 0, 0.0, 0);
			DestroyObject(GetObjectByTag("Hanharr", 0), 0.0, 0, 0.0, 0);
			SetGlobalBoolean("MalachorGas",0);
			break;
	}
}

