// ST: check_party_gui.nss (003EBO_s.rim)

#include "k_inc_hawk"

void ExitEbonHawk() {

    string sComplete;
    //if (GetGlobalNumber("LIGHT_OR_DARK") >= 1)
    //sComplete = "E";
    //if (sComplete = "E")
    if(GetGlobalBoolean("999EBO_Entered"))
    {
      SetGlobalBoolean("999EBO_Exited", TRUE);
      SetGlobalBoolean("999EBO_Entered", FALSE);
    }
    int nDest = GetGlobalNumber("003EBO_RETURN_DEST");
    string sDest;
    
    switch (nDest) {
        case 0:  sDest = "livm99ab";   break;//1 EXTRA KORRIBAN WORKS- 106PER
        case 1:  sDest = "201TEL";      break;//1
        case 2:  sDest = "unkm41aa";   break;//1 EXTRA YAVIN WORKS - 262TEL
        case 3:  sDest = "301NAR";      break;//1
        case 4:  sDest = "401DXN";      break;//1
        case 5:  sDest = "601DAN";      break;//1
        case 6:  sDest = "701KOR";      break;//1
        case 7:  sDest = "801DRO";      break;//1
        case 8:  sDest = "IN_TRANSIT";  break;//0 EBON HAWK ALWAYS GOES TO MANAAN?
        case 9:  sDest = "yav_m51aa";   break;//1//PERAGUS / EXTRA PLANET
        case 10: sDest = "IN_TRANSIT";  break;//0
        case 11: sDest = "kasm22aa";   break;//1
        case 12: sDest = "954COR";      break;//1
        case 13: sDest = "yavm50aa"; 	break;//1
        case 14: sDest = "tatm17ab"; 	break;//1
        case 15: sDest = "man_m26ad"; 	break;//1
        default: sDest = "ERROR";
        //case 9:  sDest = "IN TRANSIT";      break; // malachor
        //case 8:  sDest = "man_m26aa";  break; // in transit . . .
        //case 9:  sDest = "901MAL";      break; // malachor
        //case 10: sDest = "IN TRANSIT";  break; // in transit
    }
    
    if (sDest == "ERROR")
        AurPostString("EBO ERROR: No module sepcified!", 5, 15, 10.0);
    else if (sDest == "IN_TRANSIT")
        AurPostString("Flying through space, wooooooooo!", 5, 15, 10.0);
    else
        StartNewModule(sDest+sComplete, "WP_from_ebonhawk");
}

void main() {
    SetGlobalFadeIn();
    int nParam = GetRunScriptVar();
    
    if (!nParam) {
        object oPC = GetFirstPC();
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_from_outside"))));   
    }
    else {
        SetGlobalBoolean("003_PARTY_SPAWN", FALSE);
        ExitEbonHawk();
    }
}