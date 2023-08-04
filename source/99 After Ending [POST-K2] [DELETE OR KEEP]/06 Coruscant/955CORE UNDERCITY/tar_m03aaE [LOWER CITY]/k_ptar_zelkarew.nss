void main() {
	GiveGoldToCreature(GetPCSpeaker(), 50);
	ActionGiveItem(GetObjectByTag("MedPak", 0), GetPCSpeaker());
	ActionGiveItem(GetObjectByTag("MedPak", 0), GetPCSpeaker());
}

