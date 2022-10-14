void main() {
	object oBaoDur = GetObjectByTag("BaoDur", 0);
	int nParam1 = GetScriptParameter(1);
	GrantFeat(nParam1, oBaoDur);
	IncrementGlobalNumber("000_bao_Learn", 1);

SetGlobalFadeIn(0.0, 1.0);
}

