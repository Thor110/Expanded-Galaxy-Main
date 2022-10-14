void main() {
	object oVisasMarr = GetObjectByTag("VisasMarr", 0);
	int nParam1 = GetScriptParameter(1);
	GrantSpell(nParam1, oVisasMarr);
SetGlobalFadeIn(0.0, 1.0);
}

