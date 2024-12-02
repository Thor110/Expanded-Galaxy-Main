void main() {
  if(GetGlobalNumber("SLE_FIREBLOODS") == 1)
  {
    object oEntering = GetEnteringObject();
    if ((!GetIsPartyLeader(oEntering))) {
      return;
    }
    object oRodian2 = GetObjectByTag("rodian2", 0);
    AssignCommand(oRodian2, ActionStartConversation(oEntering, "fireblood", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
    DestroyObject(OBJECT_SELF, 0.0, 0, 0.0, 0);
  }
}

