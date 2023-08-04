void main() {
	object oBaoDur = GetObjectByTag("BaoDur", 0);
	int nParam1 = GetScriptParameter(1);
	GrantSpell(nParam1, oBaoDur);
SetGlobalFadeIn(0.0, 1.0);
}

