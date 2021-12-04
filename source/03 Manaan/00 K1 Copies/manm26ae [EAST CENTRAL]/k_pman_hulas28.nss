void main() {
	SetGlobalNumber("K_Geno_Rulan", 99);
	SetGlobalNumber("K_Genoharadan", (GetGlobalNumber("K_Genoharadan") + 10));
	CreateItemOnObject("Geno_Visor", GetFirstPC(), 1);
}

