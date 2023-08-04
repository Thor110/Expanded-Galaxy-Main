void main() {
	SetGlobalNumber("K_Geno_Ithorak", 99);
	SetGlobalNumber("K_Genoharadan", (GetGlobalNumber("K_Genoharadan") + 10));
	CreateItemOnObject("Geno_Gloves", GetFirstPC(), 1);
}

