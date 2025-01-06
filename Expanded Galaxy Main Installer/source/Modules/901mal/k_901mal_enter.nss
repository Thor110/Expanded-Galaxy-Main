// Prototypes
void sub4();
void sub3();
void sub2();
void sub1();

void sub4() {
	SwitchPlayerCharacter(1);
	object oP_baodur001 = CreateObject(1, "p_baodur001", GetLocation(GetWaypointByTag("sp_baodur")), 0);
	SetLockOrientationInDialog(oP_baodur001, 1);
	AssignCommand(oP_baodur001, ClearAllActions());
	SetMinOneHP(oP_baodur001, 0);
	DelayCommand(1.0, AssignCommand(oP_baodur001, ActionStartConversation(GetPartyLeader(), "", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
}

void sub3() {
	AddAvailableNPCByObject(1, GetObjectByTag("remote", 0));
	DestroyObject(GetObjectByTag("remote", 0), 0.0, 1, 0.0, 0);
}

void sub2() {
	SpawnAvailablePUP(0, GetLocation(GetWaypointByTag("wp_remote_start")));
	RemoveAvailableNPC(1);
}

void sub1() {
	SetPartyLeader(0xFFFFFFFF);
	int int2 = 0;
	while ((int2 < 12)) {
		if (IsNPCPartyMember(int2)) {
			RemoveNPCFromPartyToBase(int2);
		}
		(int2++);
	}
}

void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
	if ((GetEnteringObject() == GetFirstPC())) {
		if ((GetGlobalBoolean("MAL_TURNINTO_REMOTE") && (!GetLocalBoolean(OBJECT_SELF, 42)))) {
			SetLocalBoolean(OBJECT_SELF, 42, 1);
			sub1();
			sub2();
			sub3();
			DelayCommand(0.4, sub4());
			DelayCommand(0.4, SetGlobalFadeIn(1.1, 2.0, 0.0, 0.0, 0.0));
		}
		if (((!GetLocalBoolean(OBJECT_SELF, 43)) && (GetGlobalNumber("903_Atton_Sion") != 0))) {
			SetLocalBoolean(OBJECT_SELF, 43, 1);
			SwitchPlayerCharacter((-1));
		}
	}
  ShowTutorialWindow(74);
}

