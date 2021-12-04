// ST: a_galaxymap.nss (003EBO_s.rim)

#include "k_inc_hawk"

// Prototypes
int sub1();

int sub1() {
	int nGlobal = GetGlobalNumber("003EBO_BACKGROUND");
	switch (nGlobal) {
		case 0:
			return 2;
			break;
		case 1://
			return 10;//
			break;
		case 2://
			return 9;
			break;
		case 3:
			return 6;
			break;
		case 4:
			return 1;
			break;
		case 5:
			return 0;
			break;
		case 6:
			return 3;
			break;
		case 7:
			return 4;
			break;
		case 8:
			return 2;
			break;
		case 9:
			return 5;
			break;
		case 10:
			return 2;
			break;
		case 11:
			return 11;
			break;
		case 12:
			return 12;
			break;
		case 13:
			return 13;
			break;
		case 14:
			return 14;
			break;
		case 15:
			return 15;
			break;
		default:
			return 2;
	}
	return 2;
}

void main() {
    if (GetGlobalNumber("003EBO_Atton_Talk") <= 4) {
        object oPC = GetFirstPC();
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "galaxy", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));   
        return;
    }
    else if (GetGlobalNumber("003EBO_RETURN_DEST") == 4) {
        if (GetGlobalNumber("502OND_End_First") == 0) {
            object oPC = GetFirstPC();
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "galaxy2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));          
            return;
        }
    }
    else if (GetGlobalNumber("003_IN_COMBAT") == 1) {
        object oPC = GetFirstPC();
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "galaxy", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));           
        return;
    }
    
    int nWorld = 0;
    for (nWorld = PLANET_DANTOOINE; nWorld < PLANET_LIVE_01; ++nWorld) {
        SetPlanetAvailable(nWorld, FALSE);
        SetPlanetSelectable(nWorld, FALSE); 
    }
    
    if (GetGlobalNumber("900MAL_Open") == 1) {
        for (nWorld = PLANET_DANTOOINE; nWorld < PLANET_LIVE_01; nWorld++) {
            int nPlanet = nWorld;
            SetPlanetAvailable(nPlanet, TRUE);
            
            if (nWorld == PLANET_MALACHOR_V) 
                SetPlanetSelectable(nPlanet, TRUE); 
        }       
    }
    else if (GetGlobalNumber("262TEL_Escape_Telos") == 1) {
        for (nWorld = PLANET_DANTOOINE; nWorld < PLANET_LIVE_01; nWorld++) {
            int nPlanet = nWorld;
            
            if (nWorld != PLANET_MALACHOR_V) {
                SetPlanetAvailable(nPlanet, TRUE);
                
                if (nWorld != PLANET_PERAGUS) 
                    SetPlanetSelectable(nPlanet, TRUE);                 
            }
        }
        
        if (GetGlobalNumber("401DXN_Visited") == 0) {
            SetPlanetAvailable(PLANET_DXUN, FALSE);
            SetPlanetSelectable(PLANET_DXUN, FALSE);    
        }
        else {
            SetPlanetSelectable(PLANET_ONDERON, FALSE);
        }       
            if (GetGlobalNumber("262TEL_Escape_Telos") == 1) {  
            SetPlanetAvailable(PLANET_LIVE_01, TRUE);
            SetPlanetSelectable(PLANET_LIVE_01, TRUE); 
            SetPlanetAvailable(PLANET_LIVE_02, TRUE);
            SetPlanetSelectable(PLANET_LIVE_02, TRUE);  
            SetPlanetAvailable(PLANET_LIVE_03, TRUE);
            SetPlanetSelectable(PLANET_LIVE_03, TRUE);   
            SetPlanetAvailable(PLANET_LIVE_04, TRUE);
            SetPlanetSelectable(PLANET_LIVE_04, TRUE);   
            SetPlanetAvailable(PLANET_LIVE_05, TRUE);
            SetPlanetSelectable(PLANET_LIVE_05, TRUE);  
            SetPlanetAvailable(PLANET_TELOS, TRUE);
            SetPlanetSelectable(PLANET_TELOS, TRUE);
            //SetPlanetAvailable(PLANET_EBON_HAWK, TRUE);//
            //SetPlanetSelectable(PLANET_EBON_HAWK, TRUE);//
            //SetPlanetAvailable(PLANET_HARBINGER, TRUE);
            //SetPlanetSelectable(PLANET_HARBINGER, TRUE);    
            SetPlanetAvailable(PLANET_PERAGUS, TRUE);
            SetPlanetSelectable(PLANET_PERAGUS, TRUE);   
            //SetPlanetAvailable(PLANET_MALACHOR_V, TRUE);
            //SetPlanetSelectable(PLANET_MALACHOR_V, TRUE);  
        }
        else {
            SetPlanetSelectable(PLANET_LIVE_01, FALSE);
            SetPlanetSelectable(PLANET_LIVE_02, FALSE);
            SetPlanetSelectable(PLANET_LIVE_03, FALSE);
            SetPlanetSelectable(PLANET_LIVE_04, FALSE);
            SetPlanetSelectable(PLANET_LIVE_05, FALSE);
            SetPlanetAvailable(PLANET_TELOS, FALSE);
            SetPlanetSelectable(PLANET_TELOS, FALSE);
            SetPlanetAvailable(PLANET_EBON_HAWK, FALSE);//
            SetPlanetSelectable(PLANET_EBON_HAWK, FALSE);//
            SetPlanetAvailable(PLANET_HARBINGER, FALSE);
            SetPlanetSelectable(PLANET_HARBINGER, FALSE);    
            SetPlanetAvailable(PLANET_PERAGUS, FALSE);
            SetPlanetSelectable(PLANET_PERAGUS, FALSE);   
            SetPlanetAvailable(PLANET_MALACHOR_V, FALSE);
            SetPlanetSelectable(PLANET_MALACHOR_V, FALSE); 
        }
    
    }
    else {
        //SetPlanetAvailable(PLANET_HARBINGER, TRUE);
        //SetPlanetSelectable(PLANET_HARBINGER, TRUE);    
        SetPlanetAvailable(PLANET_PERAGUS, TRUE);
        SetPlanetSelectable(PLANET_PERAGUS, FALSE);                                 
    }
	
    if ((GetGlobalNumber("000_M478_Found") == 0)) {
		SetPlanetAvailable(PLANET_M4_78, FALSE);
		SetPlanetSelectable(PLANET_M4_78, FALSE);
	}
    if (GetGlobalNumber("852NIH_Nihilus_Dead") == 1)
    {
      SetPlanetAvailable(PLANET_MALACHOR_V, TRUE);
      SetPlanetSelectable(PLANET_MALACHOR_V, TRUE); 
    }
    else // (GetGlobalNumber("GBL_GAME_COMPLETE") <= 1)
    {
      SetPlanetAvailable(PLANET_MALACHOR_V, FALSE);
      SetPlanetSelectable(PLANET_MALACHOR_V, FALSE); 
    } 
	
    //SetPlanetAvailable(PLANET_TELOS, FALSE);
    //SetPlanetSelectable(PLANET_TELOS, FALSE);
    SetPlanetAvailable(PLANET_EBON_HAWK, FALSE);
    SetPlanetSelectable(PLANET_EBON_HAWK, FALSE);   
    int int12 = sub1();
    
    // ST: In Space or Hyperspace
    if ((GetGlobalNumber("003EBO_BACKGROUND") == 8) || (GetGlobalNumber("003EBO_BACKGROUND") == 10)) {
        int12 = 2;
        SetPlanetAvailable(2, 1); 
    }
    
    SetPlanetSelectable(int12, FALSE);
    ShowGalaxyMap(int12);
}