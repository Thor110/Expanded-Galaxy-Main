void main() {
	SetGlobalNumber("Tar_PazUp", 99);
	SetGlobalBoolean("G_Paz_JustPlayed", 0);
	SetGlobalNumber("Tar_PazNik", (GetGlobalNumber("Tar_PazNik") - 1));
}

