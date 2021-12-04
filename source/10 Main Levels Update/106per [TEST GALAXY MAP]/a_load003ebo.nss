void main() {
	SetPartyLeader(0xFFFFFFFF);
	SetGlobalFadeOut(0.0, 0.5, 0.0, 0.0, 0.0);
	SetGlobalNumber("003EBO_BACKGROUND", 5);
	DelayCommand(0.5, StartNewModule("107PER", "From106PER", "", "", "", "", "", ""));
}

