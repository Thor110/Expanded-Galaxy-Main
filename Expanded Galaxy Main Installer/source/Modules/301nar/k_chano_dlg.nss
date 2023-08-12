void main() {
	object oChano = GetObjectByTag("chano", 0);
	if (GetIsObjectValid(oChano)) {
    if (GetGlobalNumber("201TEL_Chano_Spawn") == 5)
    {
        
    }
    else
    {
        SetGlobalNumber("201TEL_Chano_Spawn", 4);
        AssignCommand(oChano, ClearAllActions());
        AssignCommand(oChano, ActionStartConversation(GetFirstPC(), "chano", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
        SetGlobalNumber("201TEL_Chano_Spawn",5);
    }
	}
}

