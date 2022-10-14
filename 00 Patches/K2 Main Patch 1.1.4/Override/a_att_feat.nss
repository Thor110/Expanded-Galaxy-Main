void main() {
	object oAtton = GetObjectByTag("atton", 0);
	int nParam1 = GetScriptParameter(1);
	GrantFeat(nParam1, oAtton);
	IncrementGlobalNumber("000_Atton_Learn", 1);
SetGlobalFadeIn(0.0, 1.0);
}

