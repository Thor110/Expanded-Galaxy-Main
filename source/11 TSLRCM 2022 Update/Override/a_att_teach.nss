void main() {
	object oAtton = GetObjectByTag("atton", 0);
	int nParam1 = GetScriptParameter(1);
	GrantSpell(nParam1, oAtton);
SetGlobalFadeIn(0.0, 1.0);
}

