int spotCheck()
{
    if ( ( GetModuleName() == "001EBO") ||
         ( GetModuleName() == "002EBO") ||
         ( GetModuleName() == "003EBO") ||
         ( GetModuleName() == "004EBO") ||
         ( GetModuleName() == "005EBO") ||
         ( GetModuleName() == "006EBO") ||
         ( GetModuleName() == "007EBO") ||
         ( GetModuleName() == "101PER") ||
         ( GetModuleName() == "102PER") ||
         ( GetModuleName() == "103PER") ||
         ( GetModuleName() == "104PER") ||
         ( GetModuleName() == "105PER") ||
         ( GetModuleName() == "106PER") ||
         ( GetModuleName() == "107PER") ||
         ( GetModuleName() == "151HAR") ||
         ( GetModuleName() == "152HAR") ||
         ( GetModuleName() == "153HAR") ||
         ( GetModuleName() == "154HAR") ||
         ( GetModuleName() == "201TEL") ||
         ( GetModuleName() == "202TEL") ||
         ( GetModuleName() == "203TEL") ||
         ( GetModuleName() == "204TEL") ||
         ( GetModuleName() == "205TEL") ||
         ( GetModuleName() == "207TEL") ||
         ( GetModuleName() == "208TEL") ||
         ( GetModuleName() == "209TEL") ||
         ( GetModuleName() == "220TEL") ||
         ( GetModuleName() == "221TEL") ||
         ( GetModuleName() == "222TEL") ||
         ( GetModuleName() == "231TEL") ||
         ( GetModuleName() == "232TEL") ||
         ( GetModuleName() == "233TEL") ||
         ( GetModuleName() == "261TEL") ||
         ( GetModuleName() == "262TEL") ||
         ( GetModuleName() == "410DXN") ||
         ( GetModuleName() == "411DXN") ||
         ( GetModuleName() == "501OND") ||
         ( GetModuleName() == "502OND") ||
         ( GetModuleName() == "503OND") ||
         ( GetModuleName() == "504OND") ||
         ( GetModuleName() == "505OND") ||
         ( GetModuleName() == "506OND") ||
         ( GetModuleName() == "511OND") ||
         ( GetModuleName() == "512OND") ||
         ( GetModuleName() == "851NIH") ||
         ( GetModuleName() == "852NIH") ||
         ( GetModuleName() == "853NIH") ||
         ( GetModuleName() == "901MAL") ||
         ( GetModuleName() == "902MAL") ||
         ( GetModuleName() == "903MAL") ||
         ( GetModuleName() == "904MAL") ||
         ( GetModuleName() == "905MAL") ||
         ( GetModuleName() == "906MAL") ||
         ( GetModuleName() == "907MAL")) {
    return TRUE;
  }
  return FALSE;
}
void main() {
  if (spotCheck()==TRUE)
  {
    if(GetModuleName() == "003EBO" && GetGlobalBoolean("K_LAST_WAYPOINT") == TRUE)
    {
      ShowPartySelectionGUI("armband", 0xFFFFFFFF, 0xFFFFFFFF);
    }
    else
    {
      SendMessageToPC(GetFirstPC(),"You cannot enter the Ebon Hawk while in combat.");
      BarkString(GetFirstPC(),42402);
    }
  }
  else {
    if(GetIsInConversation(GetFirstPC())&&GetIsInCombat(GetFirstPC())&&GetIsDead(GetFirstPC()))
    {
      SendMessageToPC(GetFirstPC(),"You cannot enter the Ebon Hawk while in combat.");
      BarkString(GetFirstPC(),42402);
    }
    else
    {
      if(GetIsObjectValid(GetObjectByTag("K_LAST_LOCATION")))
      {
        DestroyObject(GetObjectByTag("K_LAST_LOCATION"),0.0,FALSE,0.0,0);
      }
      if(GetGlobalBoolean("K_LAST_WAYPOINT") == FALSE)
      {
        SetGlobalBoolean("K_LAST_WAYPOINT",TRUE);
      }
      CreateObject(32,"g_lastlocal",GetLocation(GetFirstPC()),0);
      SetGlobalString("K_LAST_MODULE",GetModuleName()); 
      StartNewModule("003EBO");
    }
  }
}