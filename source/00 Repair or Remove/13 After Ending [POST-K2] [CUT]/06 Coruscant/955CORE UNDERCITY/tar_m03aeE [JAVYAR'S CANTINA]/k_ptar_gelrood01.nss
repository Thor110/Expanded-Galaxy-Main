void main() {
	SetGlobalNumber("Tar_Gelrood", (GetGlobalNumber("Tar_Gelrood") + 1));
	SetGlobalBoolean("G_Paz_JustPlayed", 1);
	PlayPazaak(1, "k_ptar_gelpazend", 40, 0, OBJECT_INVALID);
}

