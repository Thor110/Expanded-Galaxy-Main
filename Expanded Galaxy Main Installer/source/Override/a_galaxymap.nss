// ST: a_galaxymap.nss (003EBO_s.rim)

#include "k_inc_hawk"

// Prototypes
int sub1();

int sub1() {
	int nGlobal = GetGlobalNumber("003EBO_BACKGROUND");
	switch (nGlobal) {
		case 0:
			return 8;//8 = sleheyron ///////
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
		case 5: // onderon ////////
			return 0;//1
			break;
		case 6: // dantooine
			return 3;
			break;
		case 7: // korriban
			return 4;
			break;
		case 8: //
			return 5;//5 = extra planet ///////
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
		default:
			return 2;
	}
	return 2;
}

void main() {
  int int12 = sub1();
  if(GetGlobalNumber("003EBO_Atton_Talk") <= 4)
  {
    object oPC = GetFirstPC();
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "galaxy", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));   
    return;
  }
  else if(GetGlobalNumber("003EBO_RETURN_DEST") == 4)
  {
    if (GetGlobalNumber("502OND_End_First") == 0)
    {
      object oPC = GetFirstPC();
      AssignCommand(oPC, ClearAllActions());
      AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "galaxy2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));          
      return;
    }
  }
  else if(GetGlobalNumber("003_IN_COMBAT") == 1)
  {
    object oPC = GetFirstPC();
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "galaxy", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));           
    return;
  }
  int nWorld = 0;
  /*for (nWorld = PLANET_DANTOOINE; nWorld < PLANET_LIVE_06; ++nWorld)
  {
    SetPlanetAvailable(nWorld, FALSE);
    SetPlanetSelectable(nWorld, FALSE); 
  }*/
  /*if (GetGlobalNumber("900MAL_Open") == 1) // This number variable can be cleansed.
  {
    for (nWorld = PLANET_DANTOOINE; nWorld < PLANET_LIVE_06; nWorld++)
    {
      int nPlanet = nWorld;
      SetPlanetAvailable(nPlanet, TRUE);
      if (nWorld == PLANET_MALACHOR_V) // MALACHOR_V IS PERAGUS
          SetPlanetSelectable(nPlanet, TRUE); 
    }       
  }*/
  if(GetGlobalNumber("262TEL_Escape_Telos") == 1)
  {
    if (GetGlobalBoolean("LEAVING_POLAR") == 0)// Set to false if you haven't left yet.
    {
      SetGlobalNumber("003EBO_BACKGROUND",1);// To ensure int12 is set correctly after using the galaxy map and not travelling anywhere. Example : selecting Peragus.
      //SetGlobalNumber("003EBO_RETURN_DEST",8);//
      //SetGlobalNumber("003EBO_BACKGROUND",10);//
      int12=10;
      SetGlobalBoolean("LEAVING_POLAR",1);// Set to true if you have left.
    }
    for (nWorld = PLANET_DANTOOINE; nWorld < PLANET_LIVE_06; nWorld++)
    {
      int nPlanet = nWorld;
      if (nWorld != PLANET_EBON_HAWK) // EBON_HAWK IS MALACHOR_V
      {
        SetPlanetAvailable(nPlanet, TRUE);
        if (nWorld != PLANET_MALACHOR_V) // MALACHOR_V IS PERAGUS
          SetPlanetSelectable(nPlanet, TRUE);
      }
    }
  }
  else{ 
    // After Peragus Before Telos
    int12 = 5;
    // Planetary index.
    SetPlanetAvailable(PLANET_HARBINGER, TRUE);   // HARBINGER IS TELOS : CITADEL STATION
    SetPlanetSelectable(PLANET_HARBINGER, TRUE);
    SetPlanetAvailable(PLANET_MALACHOR_V, TRUE);  // MALACHOR_V IS PERAGUS
    SetPlanetSelectable(PLANET_MALACHOR_V, FALSE);
    //SetPlanetAvailable(PLANET_EBON_HAWK, TRUE); // EBON_HAWK IS MALACHOR_V
    //SetPlanetSelectable(PLANET_EBON_HAWK, TRUE);
    //SetPlanetAvailable(PLANET_PERAGUS, TRUE);   // PERAGUS IS SLEHEYRON
    //SetPlanetSelectable(PLANET_PERAGUS, TRUE);
    //SetPlanetAvailable(PLANET_TELOS, TRUE);     // TELOS IS LEHON
    //SetPlanetSelectable(PLANET_TELOS, TRUE);
    //SetPlanetAvailable(PLANET_LIVE_01, TRUE);   // LIVE_01 IS KASHYYYK
    //SetPlanetSelectable(PLANET_LIVE_01, TRUE);
    //SetPlanetAvailable(PLANET_LIVE_02, TRUE);   // LIVE_02 IS CORUSCANT
    //SetPlanetSelectable(PLANET_LIVE_02, TRUE);
    //SetPlanetAvailable(PLANET_LIVE_03, TRUE);   // LIVE_03 IS YAVIN
    //SetPlanetSelectable(PLANET_LIVE_03, TRUE);
    //SetPlanetAvailable(PLANET_LIVE_04, TRUE);   // LIVE_04 IS TATOOINE
    //SetPlanetSelectable(PLANET_LIVE_04, TRUE);
    //SetPlanetAvailable(PLANET_LIVE_05, TRUE);   // LIVE_05 IS MANAAN
    //SetPlanetSelectable(PLANET_LIVE_05, TRUE);
  }
  if(GetGlobalBoolean("COR_COUNCIL_DATA") == 0){
    SetPlanetAvailable(PLANET_PERAGUS, FALSE);   // PERAGUS IS SLEHEYRON
    SetPlanetSelectable(PLANET_PERAGUS, FALSE);
    SetPlanetAvailable(PLANET_TELOS, FALSE);     // TELOS IS LEHON
    SetPlanetSelectable(PLANET_TELOS, FALSE);
    SetPlanetAvailable(PLANET_LIVE_01, FALSE);   // LIVE_01 IS KASHYYYK
    SetPlanetSelectable(PLANET_LIVE_01, FALSE);
    SetPlanetAvailable(PLANET_LIVE_04, FALSE);   // LIVE_04 IS TATOOINE
    SetPlanetSelectable(PLANET_LIVE_04, FALSE);
    SetPlanetAvailable(PLANET_LIVE_05, FALSE);   // LIVE_05 IS MANAAN
    SetPlanetSelectable(PLANET_LIVE_05, FALSE);
  }
  else{
    SetPlanetAvailable(PLANET_PERAGUS, TRUE);   // PERAGUS IS SLEHEYRON
    SetPlanetSelectable(PLANET_PERAGUS, TRUE);
    SetPlanetAvailable(PLANET_TELOS, TRUE);     // TELOS IS LEHON
    SetPlanetSelectable(PLANET_TELOS, TRUE);
    SetPlanetAvailable(PLANET_LIVE_01, TRUE);   // LIVE_01 IS KASHYYYK
    SetPlanetSelectable(PLANET_LIVE_01, TRUE);
    SetPlanetAvailable(PLANET_LIVE_04, TRUE);   // LIVE_04 IS TATOOINE
    SetPlanetSelectable(PLANET_LIVE_04, TRUE);
    SetPlanetAvailable(PLANET_LIVE_05, TRUE);   // LIVE_05 IS MANAAN
    SetPlanetSelectable(PLANET_LIVE_05, TRUE);
  }
  if(GetGlobalNumber("401DXN_Visited") == 0) {
    SetPlanetAvailable(PLANET_DXUN, FALSE);
    SetPlanetSelectable(PLANET_DXUN, FALSE);    
  }
  else {
    SetPlanetSelectable(PLANET_ONDERON, FALSE);
  }
  if((GetGlobalNumber("000_M478_Found") == 0)) {
    SetPlanetAvailable(PLANET_M4_78, FALSE);
		SetPlanetSelectable(PLANET_M4_78, FALSE);
  }
  if(GetGlobalNumber("852NIH_Nihilus_Dead") == 1)// This number variable can become a boolean.
  {
    SetPlanetAvailable(PLANET_EBON_HAWK, TRUE);// EBON_HAWK IS MALACHOR_V
    SetPlanetSelectable(PLANET_EBON_HAWK, TRUE); 
    if(GetGlobalNumber("GBL_GAME_COMPLETE") >= 1)// Might need a new variable for this, as this variable is set for those that have played the game through multiple times
    {
      SetPlanetAvailable(PLANET_EBON_HAWK, TRUE);// EBON HAWK IS MALACHOR
      SetPlanetSelectable(PLANET_EBON_HAWK, FALSE); 
    }
  }
  else
  {
    SetPlanetAvailable(PLANET_EBON_HAWK, FALSE);// EBON_HAWK IS MALACHOR_V
    SetPlanetSelectable(PLANET_EBON_HAWK, FALSE); 
  }
  // ST: In Space or Hyperspace // This was previously set to the Ebon Hawk when in hyperspace.
  //if ((GetGlobalNumber("003EBO_BACKGROUND") == 8) || (GetGlobalNumber("003EBO_BACKGROUND") == 10)) {
    //int12 = 2;
    //SetPlanetAvailable(2, 1); 
  //}
  if(GetGlobalBoolean("CARTH_SCENE") == 1)// Set to true during the Carth scene, this logic could be flipped and the boolean used again for something else.
  {
    SetGlobalBoolean("CARTH_SCENE",0);// Set to false to prevent this statement tripping itself.
    SetGlobalNumber("003EBO_BACKGROUND",1);// To ensure int12 is set correctly after using the galaxy map and not travelling anywhere. Example : selecting Peragus.
    int12 = 10;
  }
  SetPlanetSelectable(int12, FALSE);
  ShowGalaxyMap(int12);
}

