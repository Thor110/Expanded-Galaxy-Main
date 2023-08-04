int StartingConditional() {
	int int1 = ((GetGlobalNumber("Tar_Duel") == 7) && (GetGender(GetPCSpeaker()) == 1));
	return int1;
}

