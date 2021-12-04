void main() {
	if ((GetLastPazaakResult() == 0)) {
		SetGlobalNumber("Tar_PazNik", (GetGlobalNumber("Tar_PazNik") + 1));
	}
	if ((GetLastPazaakResult() == 0)) {
		SetGlobalNumber("Tar_PazNik", (GetGlobalNumber("Tar_PazNik") - 1));
	}
	AssignCommand(GetObjectByTag("niklos021", 0), ActionStartConversation(GetFirstPC(), "tar02_niklos021", 0, 0, 0, "", "", "", "", "", ""));
}

