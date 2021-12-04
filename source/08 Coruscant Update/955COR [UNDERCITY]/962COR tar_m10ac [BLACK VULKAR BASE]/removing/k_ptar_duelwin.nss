void main() {
	SetGlobalNumber("Tar_Duel", (GetGlobalNumber("Tar_Duel") + 1));
	SetGlobalBoolean("Tar_DuelOver", 1);
	SetGlobalBoolean("Tar_DuelLost", 0);
}

