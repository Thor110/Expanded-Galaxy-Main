void main() {
	if ((GetLocked(OBJECT_SELF) == 0)) {
		PlayAnimation(201, 1.0, 0.0);
		SetLocked(OBJECT_SELF, 1);
	}
	else {
		PlayAnimation(200, 3.0, 0.0);
		SetLocked(OBJECT_SELF, 0);
	}
	if ((GetLocked(GetObjectByTag("wall1", 0)) == 0)) {
		AssignCommand(GetObjectByTag("wall1", 0), PlayAnimation(201, 1.0, 0.0));
		SetLocked(GetObjectByTag("wall1", 0), 1);
	}
	else {
		AssignCommand(GetObjectByTag("wall1", 0), PlayAnimation(200, 3.0, 0.0));
		SetLocked(GetObjectByTag("wall1", 0), 0);
	}
	if ((GetLocked(GetObjectByTag("wall3", 0)) == 0)) {
		AssignCommand(GetObjectByTag("wall3", 0), PlayAnimation(201, 1.0, 0.0));
		SetLocked(GetObjectByTag("wall3", 0), 1);
	}
	else {
		AssignCommand(GetObjectByTag("wall3", 0), PlayAnimation(200, 3.0, 0.0));
		SetLocked(GetObjectByTag("wall3", 0), 0);
	}
	if ((((((((GetLocked(GetObjectByTag("wall1", 0)) == 1) && (GetLocked(GetObjectByTag("wall2", 0)) == 1)) && (GetLocked(GetObjectByTag("wall3", 0)) == 1)) && (GetLocked(GetObjectByTag("wall4", 0)) == 1)) && (GetLocked(GetObjectByTag("wall5", 0)) == 1)) && (GetGlobalBoolean("Tar_DurosDead") == 0)) && (GetGlobalBoolean("Tar_DurosFree") == 0))) {
		AssignCommand(GetObjectByTag("int_cage", 0), PlayAnimation(202, 1.0, 0.0));
		SoundObjectStop(GetObjectByTag("ForceCage", 0));
		SetGlobalBoolean("Tar_DurosFree", 1);
		DelayCommand(0.5, ActionStartConversation(GetFirstPC(), "", 0, 0, 0, "", "", "", "", "", ""));
	}
	if ((((((((GetLocked(GetObjectByTag("wall1", 0)) == 0) && (GetLocked(GetObjectByTag("wall2", 0)) == 0)) && (GetLocked(GetObjectByTag("wall3", 0)) == 0)) && (GetLocked(GetObjectByTag("wall4", 0)) == 0)) && (GetLocked(GetObjectByTag("wall5", 0)) == 0)) && (GetGlobalBoolean("Tar_DurosDead") == 0)) && (GetGlobalBoolean("Tar_DurosFree") == 0))) {
		SetGlobalBoolean("Tar_DurosDead", 1);
		DelayCommand(0.5, ActionStartConversation(GetFirstPC(), "", 0, 0, 0, "", "", "", "", "", ""));
	}
}

