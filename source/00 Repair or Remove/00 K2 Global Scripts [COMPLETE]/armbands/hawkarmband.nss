int spotCheck()
{
    if ( ( GetModuleName() == "001ebo") ||
         ( GetModuleName() == "002ebo") ||
         ( GetModuleName() == "003ebo") ||
         ( GetModuleName() == "004ebo") ||
         ( GetModuleName() == "005ebo") ||
         ( GetModuleName() == "006ebo") ||
         ( GetModuleName() == "007ebo") ||
         ( GetModuleName() == "101per") ||
         ( GetModuleName() == "102per") ||
         ( GetModuleName() == "103per") ||
         ( GetModuleName() == "104per") ||
         ( GetModuleName() == "105per") ||
         ( GetModuleName() == "106per") ||
         ( GetModuleName() == "107per") ||
         ( GetModuleName() == "151har") ||
         ( GetModuleName() == "152har") ||
         ( GetModuleName() == "153har") ||
         ( GetModuleName() == "154har") ||
         ( GetModuleName() == "205tel") ||
         ( GetModuleName() == "231tel") ||
         ( GetModuleName() == "232tel") ||
         ( GetModuleName() == "233tel") ||
         ( GetModuleName() == "261tel") ||
         ( GetModuleName() == "262tel") ||
         ( GetModuleName() == "901mal") ||
         ( GetModuleName() == "902mal") ||
         ( GetModuleName() == "903mal") ||
         ( GetModuleName() == "904mal") ||
         ( GetModuleName() == "905mal") ||
         ( GetModuleName() == "906mal") ||
         ( GetModuleName() == "907mal")) {
    return TRUE;
  }
  return FALSE;
}
 
void main() {
  if (spotCheck()==TRUE) 
  {
    if (GetStringLength(GetGlobalString("K_LAST_WAYPOINT")) <= 1)
    {
      //RemoveJournalQuestEntry("k_rapidtransit");
    }
    else
    {
      ShowPartySelectionGUI("harmband", 0xFFFFFFFF, 0xFFFFFFFF);
    }
  }
  else {
    if(GetIsInCombat(GetFirstPC())&&GetIsDead(GetFirstPC()))
    {
      BarkString(GetFirstPC(),42402);
    }
    else
    {
      object oPC = GetFirstPC();
      object object1 = GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1);
      string string1 = GetTag(object1);
      SetGlobalString("K_LAST_WAYPOINT", string1);
      SetGlobalString("K_LAST_MODULE",GetModuleName()); 
      StartNewModule("003ebo");
    }
  }
}