void main() {
	if ((GetGlobalNumber("Tar_Duel") == 1)) {
		GiveGoldToCreature(GetPCSpeaker(), 100);
	}
	if ((GetGlobalNumber("Tar_Duel") == 2)) {
		GiveGoldToCreature(GetPCSpeaker(), 200);
	}
	if ((GetGlobalNumber("Tar_Duel") == 3)) {
		GiveGoldToCreature(GetPCSpeaker(), 300);
	}
	if ((GetGlobalNumber("Tar_Duel") == 4)) {
		GiveGoldToCreature(GetPCSpeaker(), 400);
	}
	if ((GetGlobalNumber("Tar_Duel") == 5)) {
		GiveGoldToCreature(GetPCSpeaker(), 500);
	}
	if ((GetGlobalNumber("Tar_Duel") == 7)) {
		GiveGoldToCreature(GetPCSpeaker(), 700);
		SetGlobalBoolean("Tar_BenReward", 1);
		ActionGiveItem(GetObjectByTag("G_W_BLSTRPSTL005", 0), GetPCSpeaker());
	}
}

