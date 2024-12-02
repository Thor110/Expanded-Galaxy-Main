//Thor110 - script edited to function with dialogs that have a different number of entries.
int StartingConditional() {
	int nParam1 = GetScriptParameter(1);
	int nParam2 = GetScriptParameter(2);
	int nGlobal = GetGlobalNumber("302NAR_Random_Talk");
  if ((nGlobal >= nParam2)) {
    SetGlobalNumber("302NAR_Random_Talk", 0);
    return 1;
  }
	if ((nGlobal == nParam1)) {
		return 1;
	}
	return 0;
}

