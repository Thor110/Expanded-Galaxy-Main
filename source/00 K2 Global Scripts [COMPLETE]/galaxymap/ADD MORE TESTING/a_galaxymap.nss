// ST: a_galaxymap.nss (003EBO_s.rim)

#include "k_inc_hawk"

// Prototypes
int sub1();

int sub1() {
	int nGlobal = GetGlobalNumber("003EBO_BACKGROUND");
	switch (nGlobal) {
		case 0:
			return 8;//8 = sleheyron
			break;
		case 1://telos
			return 10;//10 = telos
			break;
		case 2://lehon
			return 9;//8
			break;
		case 3:// nar shaddaa
			return 6;
			break;
		case 4: // dxun
			return 1;//2
			break;
		case 5: // onderon
			return 0;//1
			break;
		case 6: // dantooine
			return 3;
			break;
		case 7: // korriban
			return 4;
			break;
		case 8: //
			return 5;//5 = extra planet
			break;
		case 9: // malachor / onderon ?
			return 7;//9
			break;
		case 10: // malachor / onderon ?
			return 2;//2
			break;
		case 11: // kashyyyk
			return 11;
			break;
		case 12: // coruscant
			return 12;
			break;
		case 13: // yavin
			return 13;
			break;
		case 14: // tatooine
			return 14;
			break;
		case 15: // manaan
			return 15;
			break;
		case 16: // manaan
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
            SetPlanetAvailable(PLANET_HARBINGER, TRUE);
            SetPlanetSelectable(PLANET_HARBINGER, TRUE);    
            SetPlanetAvailable(PLANET_PERAGUS, TRUE);
            SetPlanetSelectable(PLANET_PERAGUS, TRUE);   
            SetPlanetAvailable(PLANET_MALACHOR_V, TRUE);
            SetPlanetSelectable(PLANET_MALACHOR_V, TRUE);
        }
        //else if (GetGlobalNumber("262TEL_Escape_Telos") == 1){
            //SetPlanetAvailable(PLANET_LIVE_01, TRUE);
            //SetPlanetSelectable(PLANET_LIVE_01, TRUE); 
            //SetPlanetAvailable(PLANET_LIVE_02, TRUE);
            //SetPlanetSelectable(PLANET_LIVE_02, TRUE);  
            //SetPlanetAvailable(PLANET_LIVE_03, TRUE);
            //SetPlanetSelectable(PLANET_LIVE_03, TRUE);   
            //SetPlanetAvailable(PLANET_LIVE_04, TRUE);
            //SetPlanetSelectable(PLANET_LIVE_04, TRUE);   
            //SetPlanetAvailable(PLANET_LIVE_05, TRUE);
            //SetPlanetSelectable(PLANET_LIVE_05, TRUE);  
            //SetPlanetAvailable(PLANET_TELOS, TRUE);
            //SetPlanetSelectable(PLANET_TELOS, TRUE);
            //SetPlanetAvailable(PLANET_HARBINGER, TRUE);
            //SetPlanetSelectable(PLANET_HARBINGER, TRUE);    
            //SetPlanetAvailable(PLANET_PERAGUS, TRUE);
            //SetPlanetSelectable(PLANET_PERAGUS, TRUE);   
            //SetPlanetAvailable(PLANET_MALACHOR_V, TRUE);
            //SetPlanetSelectable(PLANET_MALACHOR_V, TRUE);
        //}
        else {
            SetPlanetSelectable(PLANET_LIVE_01, FALSE);
            SetPlanetSelectable(PLANET_LIVE_02, FALSE);
            SetPlanetSelectable(PLANET_LIVE_03, FALSE);
            SetPlanetSelectable(PLANET_LIVE_04, FALSE);
            SetPlanetSelectable(PLANET_LIVE_05, FALSE);
            SetPlanetAvailable(PLANET_TELOS, FALSE);
            SetPlanetSelectable(PLANET_TELOS, FALSE);
            SetPlanetAvailable(PLANET_EBON_HAWK, FALSE);
            SetPlanetSelectable(PLANET_EBON_HAWK, FALSE);
            SetPlanetAvailable(PLANET_HARBINGER, FALSE);
            SetPlanetSelectable(PLANET_HARBINGER, FALSE);    
            SetPlanetAvailable(PLANET_PERAGUS, FALSE);
            SetPlanetSelectable(PLANET_PERAGUS, FALSE);   
            SetPlanetAvailable(PLANET_MALACHOR_V, FALSE);
            SetPlanetSelectable(PLANET_MALACHOR_V, FALSE); 
        }
    
    }
    else { 
        // After Peragus Before Telos
        SetPlanetAvailable(PLANET_HARBINGER, TRUE); // HARBINGER IS TELOS : CITADEL STATION
        SetPlanetSelectable(PLANET_HARBINGER, TRUE); //
        //SetPlanetAvailable(PLANET_MALACHOR_V, TRUE); // MALACHOR_V is a spare planet space
        //SetPlanetSelectable(PLANET_MALACHOR_V, TRUE);
        //SetPlanetAvailable(PLANET_EBON_HAWK, TRUE);// EBON_HAWK IS MALACHOR_V
        //SetPlanetSelectable(PLANET_EBON_HAWK, TRUE);
        //SetPlanetAvailable(PLANET_PERAGUS, TRUE);// PERAGUS IS SLEHEYRON
        //SetPlanetSelectable(PLANET_PERAGUS, TRUE);//     
        //SetPlanetAvailable(PLANET_TELOS, TRUE);// TELOS IS LEHON
        //SetPlanetSelectable(PLANET_TELOS, TRUE);//   
        //SetPlanetAvailable(PLANET_LIVE_01, TRUE); // LIVE_01 IS KASHYYYK
        //SetPlanetSelectable(PLANET_LIVE_01, TRUE); 
        //SetPlanetAvailable(PLANET_LIVE_02, TRUE); // LIVE_02 IS CORUSCANT
        //SetPlanetSelectable(PLANET_LIVE_02, TRUE);  
        //SetPlanetAvailable(PLANET_LIVE_03, TRUE); // LIVE_03 IS YAVIN
        //SetPlanetSelectable(PLANET_LIVE_03, TRUE);   
        //SetPlanetAvailable(PLANET_LIVE_04, TRUE); // LIVE_04 IS TATOOINE
        //SetPlanetSelectable(PLANET_LIVE_04, TRUE);   
        //SetPlanetAvailable(PLANET_LIVE_05, TRUE); // LIVE_05 IS MANAAN
        //SetPlanetSelectable(PLANET_LIVE_05, TRUE);      // can PLANET_ONDERON be used?                  
    }
	
    if ((GetGlobalNumber("000_M478_Found") == 0)) {
		SetPlanetAvailable(PLANET_M4_78, FALSE);
		SetPlanetSelectable(PLANET_M4_78, FALSE);
    }
    if (GetGlobalNumber("852NIH_Nihilus_Dead") == 1)
    {
      SetPlanetAvailable(PLANET_EBON_HAWK, TRUE);
      SetPlanetSelectable(PLANET_EBON_HAWK, TRUE); 
      if (GetGlobalNumber("GBL_GAME_COMPLETE") >= 1)
      {
        SetPlanetAvailable(PLANET_EBON_HAWK, FALSE);// EBON HAWK IS MALACHOR
        SetPlanetSelectable(PLANET_EBON_HAWK, FALSE); 
      }
    }
    else
    {
      SetPlanetAvailable(PLANET_EBON_HAWK, FALSE);
      SetPlanetSelectable(PLANET_EBON_HAWK, FALSE); 
    }
    int int12 = sub1();
    
    // ST: In Space or Hyperspace
    if ((GetGlobalNumber("003EBO_BACKGROUND") == 8) || (GetGlobalNumber("003EBO_BACKGROUND") == 10)) {
        //int12 = 2;
        //SetPlanetAvailable(2, 1); 
    }

    //if (GetGlobalNumber("852NIH_Nihilus_Dead") <= 1) {
        //int12 = 10;
        //SetPlanetAvailable(2, 1); 
        //SetGlobalNumber("003EBO_RETURN_DEST",8);//use to drop out of or mimic hyperspace
        //SetGlobalNumber("003EBO_BACKGROUND",10);//can be used to put ebon hawk into transit
        //PlayMovie("HypMov01");
        //SetGlobalBoolean("CARTH_SCENE",FALSE);
    //}
    if (GetGlobalBoolean("CARTH_SCENE") == TRUE) {
        int12 = 10;
        //SetPlanetAvailable(2, 1); 
        //SetGlobalNumber("003EBO_RETURN_DEST",8);//use to drop out of or mimic hyperspace
        //SetGlobalNumber("003EBO_BACKGROUND",10);//can be used to put ebon hawk into transit
        //PlayMovie("HypMov01");
        //SetGlobalBoolean("CARTH_SCENE",FALSE);
    }
    if (GetGlobalBoolean("LEAVING_POLAR") == TRUE)
    {
        int12=10;
        //SetGlobalNumber("003EBO_RETURN_DEST",8);//use to drop out of or mimic hyperspace
        //SetGlobalNumber("003EBO_BACKGROUND",10);//can be used to put ebon hawk into transit
        // check party screen still shows
        //PlayMovie("HypMov01");
        //SetGlobalBoolean("LEAVING_POLAR", FALSE);
        //SetGlobalNumber("262TEL_Escape_Telos",2);
        // set up a variable to use for when leaving the academy on telos
    }
    if (GetGlobalNumber("262TEL_Escape_Telos") == 0)
    {
        //int12=10;// otherwise Sleheyron is selected
        //SetGlobalNumber("003EBO_RETURN_DEST",10);
        //SetGlobalNumber("003EBO_BACKGROUND",8);
        
        PlayMovie("HypMov01");// make a "HypMov02" removing the entering hyperspace
        PlayMovie("TelMov01");
        
        StartNewModule("201tel","WP_from_ebonhawk","","","","","",""); // ("", "WP_from_ebonhawk")
    }
    // on enter 999EBO
    // if game complete
    // if entered = false
    // if exited = false
    // "999EBO_Entered" = true
    //if (GetGlobalNumber("GBL_GAME_COMPLETE") >= 1) // not used at the moment
    //{
        
        //SetGlobalNumber("003EBO_RETURN_DEST",8);
        //SetGlobalNumber("003EBO_BACKGROUND",10);
        // this causes no exit planet scene to play every time until I alter "999EBO_Entered"
        //if (GetGlobalBoolean("999EBO_Entered") == TRUE)
        //{
            //SetGlobalNumber("003EBO_RETURN_DEST",8);
            //SetGlobalNumber("003EBO_BACKGROUND",10);
            //int12=2;
            //if (GetGlobalBoolean("999EBO_Exited") == FALSE)
            //{
              
              //SetGlobalBoolean("999EBO_Exited",FALSE);
              //SetGlobalNumber("003EBO_RETURN_DEST",10);
              //SetGlobalNumber("003EBO_BACKGROUND",10);
            //}
        //SetGlobalNumber("003EBO_RETURN_DEST",8);//use to drop out of or mimic hyperspace
        //SetGlobalNumber("003EBO_BACKGROUND",10);//can be used to put ebon hawk into transit
        //}
    //}
    SetPlanetSelectable(int12, FALSE);
    ShowGalaxyMap(int12);
}