void main() {
	if ((GetLocked(OBJECT_SELF) == 0)) {
		if ((GetGlobalNumber("Tar_LastHolo") != 5)) {
			if ((GetGlobalBoolean("Tar_HoloActive") == 0)) {
				SetGlobalNumber("Tar_LastHolo", 0);
				SetGlobalBoolean("Tar_HoloActive", 1);
				ActionStartConversation(GetLastUsedBy(), "", 0, 0, 0, "", "", "", "", "", "");
			}
			if ((GetGlobalBoolean("Tar_HoloActive") == 1)) {
				ActionStartConversation(GetLastUsedBy(), "Tar_Holoexplod", 0, 0, 0, "", "", "", "", "", "");
			}
		}
		if ((GetGlobalNumber("Tar_LastHolo") == 5)) {
			SetLocked(OBJECT_SELF, 1);
			SetGlobalNumber("Tar_LastHolo", 6);
			PlayAnimation(200, 1.0, 0.0);
			PlaySound("gen_shieldredon");
			DelayCommand(0.5, AssignCommand(GetObjectByTag("tar03_box", 0), ActionStartConversation(GetFirstPC(), "Tar_HoloOpen", 0, 0, 0, "", "", "", "", "", "")));
		}
	}
}

