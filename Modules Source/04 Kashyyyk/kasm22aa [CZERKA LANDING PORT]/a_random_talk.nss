//Thor110 - script edited to function with dialogs that have a different number of entries.
void main() {
	int nParam1 = GetScriptParameter(1);//current
	int nParam2 = GetScriptParameter(2);//highest
	int nGlobal = GetGlobalNumber("302NAR_Random_Talk");
	if ((nGlobal == nParam2)) {
		nParam1 = 1;
	}
	int nRandom = Random(nParam2-1);
	if ((nRandom == nGlobal)) {
		nRandom = (nRandom + 1);
	}
	SetGlobalNumber("302NAR_Random_Talk", nRandom);
}

