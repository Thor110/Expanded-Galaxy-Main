void main() {
	int nGlobal;
	if (GetLastPazaakResult()) {
		nGlobal = GetGlobalNumber("MAN_JOLAN_NUM");
		SetGlobalNumber("MAN_JOLAN_NUM", (nGlobal + 1));
	}
	AssignCommand(GetObjectByTag("man26_jolan", 0), ActionStartConversation(GetFirstPC(), "man26_jolan", 0, 0, 0, "", "", "", "", "", ""));
}

