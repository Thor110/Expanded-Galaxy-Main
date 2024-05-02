void main() {
  if(GetIsObjectValid(GetItemPossessedBy(GetFirstPC(),"ccodes")) && GetGlobalBoolean("COR_JEDI_FOUND")){
    SetGlobalBoolean("COR_JEDI_FOUND",0);
    location location1 = Location(Vector(-0.24, -3.44, 12.33), 294.82);
    CreateObject(1, "d_sithsoldier004", location1, 0);
    DelayCommand(3.0, RemoveEffectByID(GetObjectByTag("d_sithsoldier004", 0), 8000));
    DelayCommand(1.0, AssignCommand(GetObjectByTag("d_sithsoldier004", 0), ActionStartConversation(GetFirstPC(), "attck", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
  }
}

