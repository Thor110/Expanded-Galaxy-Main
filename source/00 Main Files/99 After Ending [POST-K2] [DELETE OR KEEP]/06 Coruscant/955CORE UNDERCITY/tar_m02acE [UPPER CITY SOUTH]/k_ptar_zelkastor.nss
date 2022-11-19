void main() {
	if ((GetGlobalNumber("Tar_ZelkaStor") == 0)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore1", 0), GetPCSpeaker(), 0, 0));
	}
	if ((GetGlobalNumber("Tar_ZelkaStor") == 1)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore1", 0), GetPCSpeaker(), 0, 0));
	}
	if ((GetGlobalNumber("Tar_ZelkaStor") == 2)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore1d", 0), GetPCSpeaker(), 0, 0));
	}
	if ((GetGlobalNumber("Tar_ZelkaStor") == 3)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore2d", 0), GetPCSpeaker(), 0, 0));
	}
	if ((GetGlobalNumber("Tar_ZelkaStor") == 4)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore3d", 0), GetPCSpeaker(), 0, 0));
	}
	if ((GetGlobalNumber("Tar_ZelkaStor") == 5)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore2", 0), GetPCSpeaker(), 0, 0));
	}
	if ((GetGlobalNumber("Tar_ZelkaStor") == 6)) {
		DelayCommand(0.1, OpenStore(GetObjectByTag("zelkastore3", 0), GetPCSpeaker(), 0, 0));
	}
}

