void main() {
	SetGlobalNumber("K_Geno_Vorn", 99);
	SetGlobalNumber("K_Genoharadan", (GetGlobalNumber("K_Genoharadan") + 10));
	CreateItemOnObject("Geno_Stealth", GetFirstPC(), 1);
}

