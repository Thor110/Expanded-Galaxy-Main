void main() {
	if ((GetLocked(OBJECT_SELF) == 0)) {
		if ((GetGlobalNumber("Tar_LastHolo") != 3)) {
			if ((GetGlobalBoolean("Tar_HoloActive") == 0)) {
				SetGlobalNumber("Tar_LastHolo", 0);
				SetGlobalBoolean("Tar_HoloActive", 1);
				ActionStartConversation(GetLastUsedBy(), "", 0, 0, 0, "", "", "", "", "", "");
			}
			if ((GetGlobalBoolean("Tar_HoloActive") == 1)) {
				ActionStartConversation(GetLastUsedBy(), "Tar_Holoexplod", 0, 0, 0, "", "", "", "", "", "");
			}
		}
		if ((GetGlobalNumber("Tar_LastHolo") == 3)) {
			SetLocked(OBJECT_SELF, 1);
			SetGlobalNumber("Tar_LastHolo", 4);
			ActionPlayAnimation(200, 1.0, 0.0);
			PlaySound("gen_shieldredon");
		}
	}
}

