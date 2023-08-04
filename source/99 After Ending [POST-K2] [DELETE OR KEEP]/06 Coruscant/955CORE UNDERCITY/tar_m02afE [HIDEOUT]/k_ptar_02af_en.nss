void main() {
  if (GetIsPC(GetEnteringObject())) {
    object oTar02_aptdoor = GetObjectByTag("tar02_aptdoor", 0);
    AssignCommand(oTar02_aptdoor, ActionCloseDoor(oTar02_aptdoor));
    if(GetGlobalNumber("Tar_Carth") == 0) {
      RevealMap(GetPosition(GetFirstPC()), 0xFFFFFFFF);
      object oCarth = GetObjectByTag("Carth");
      AssignCommand(oCarth, ClearAllActions());
      //SetReturnStrref(0, 32228, 0);
      SetGlobalNumber("K_CURRENT_PLANET", 10);
      SetGlobalNumber("Tar_Carth",1);
      AssignCommand(GetFirstPC(), ActionStartConversation(oCarth, "tar02_carth022", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
    }
	}
}