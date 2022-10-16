void main() {
  object oBaoDur = GetObjectByTag("BaoDur", 0);
  //object check = GetLastOpenedBy();
  //string test = ObjectToString(check);
  //SendMessageToPC(GetFirstPC(),test);//7f000000 = PC
  //if(GetIsPlayerMadeCharacter(check))
  if((IsNPCPartyMember(NPC_BAO_DUR) == TRUE) && (GetDistanceBetween(OBJECT_SELF, GetObjectByTag("Baodur")) <= 2.0))
  {
    DelayCommand(0.1, AssignCommand(oBaoDur, PlayAnimation(10468, 1.0, 1.0)));
    if(!GetIsDead(oBaoDur))
    {
      DelayCommand(1.5, AssignCommand(oBaoDur, PlayAnimation(10562, 1.0, 1.5)));
      DelayCommand(1.7, SetCommandable(1, oBaoDur));
      DelayCommand(2.2, ActionOpenDoor(OBJECT_SELF));
    }
  }
  else
  {
    DelayCommand(0.1, ActionStartConversation(OBJECT_SELF, "ffield", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
  }
}
