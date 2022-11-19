void main() {
	SetGlobalBoolean("G_Paz_JustPlayed", 0);
	SetGlobalNumber("tar_PazUp", 1);
	SetGlobalNumber("Tar_PazNik", (GetGlobalNumber("Tar_PazNik") + 1));
}

