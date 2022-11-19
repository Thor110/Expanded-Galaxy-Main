void main() {
	if (GetIsDead(GetObjectByTag("Trooper1"))
    &&GetIsDead(GetObjectByTag("droid1"))
    &&GetIsDead(GetObjectByTag("droid2"))) {
      AssignCommand(GetFirstPC(), ActionStartConversation(GetObjectByTag("Duros"), "", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	
  }
}

