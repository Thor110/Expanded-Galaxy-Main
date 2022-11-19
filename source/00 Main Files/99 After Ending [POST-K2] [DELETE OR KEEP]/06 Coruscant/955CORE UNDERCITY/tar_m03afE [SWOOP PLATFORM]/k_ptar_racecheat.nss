void main() {
	SetGlobalNumber("Tar_SwoopRaceCounter", 3);
	SetGlobalNumber("Tar_SwoopStatus", 2);
	SetGlobalBoolean("Tar_SwoopDouble", 0);
	DelayCommand(1.0, AssignCommand(GetObjectByTag("tar03_Mechanic", 0), ActionStartConversation(GetFirstPC(), "", 0, 0, 1, "", "", "", "", "", "")));
}

