//:: k_sup_galaxymap
/*
    Universal Script that fires when
    the galaxy map is used.
*/

#include "k_inc_hawk"

//turns off all of the core worlds and live planets.
void CUSTOM_TurnOffPlanets();

int CUSTOM_PlanetIDTo2DA(int nPlanetID);
int CUSTOM_2DAToPlanetID(int nPlanet2DA);

void DoFirst301()
{
    NoClicksFor(1.0);
    SetGlobalFadeOut();
    object oPlayer = GetFirstPC();
    object oAtton = GetObjectByTag("atton");
    object oMand = GetObjectByTag("mand");
    object oKreia = GetObjectByTag("kreia");
    object oT3M4 = GetObjectByTag("t3m4");
    object oDisc = GetObjectByTag("disciple");
    object oMaid = GetObjectByTag("handmaiden");

    TurnOffCutsceneMode(oAtton);
    TurnOffCutsceneMode(oMand);
    TurnOffCutsceneMode(oKreia);
    TurnOffCutsceneMode(oT3M4);
    TurnOffCutsceneMode(oDisc);
    TurnOffCutsceneMode(oMaid);

    //AssignCommand(oAtton, ClearAllActions());
    //AssignCommand(oMand, ClearAllActions());
    //AssignCommand(oKreia, ClearAllActions());
    //AssignCommand(oT3M4, ClearAllActions());
    //AssignCommand(oDisc, ClearAllActions());
    //AssignCommand(oMaid, ClearAllActions());

    //AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_atton"))));
    AssignCommand(oMand, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_mand"))));
    AssignCommand(oKreia, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_kreia"))));
    AssignCommand(oT3M4, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_t3m4"))));
    AssignCommand(oDisc, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_disc"))));
    AssignCommand(oMaid, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_maid"))));

    SignalEvent(GetArea(oPlayer), EventUserDefined(1));
    AssignCommand(oPlayer, ClearAllActions());
    AssignCommand(oPlayer, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_player"))));
}

void DoFirst701()
{
    NoClicksFor(1.0);
    SetGlobalFadeOut();
    object oPlayer = GetFirstPC();
    object oAtton = GetObjectByTag("mand");
    object oVisas = GetObjectByTag("visasmarr");
    object oKreia = GetObjectByTag("kreia");

    TurnOffCutsceneMode(oAtton);
    TurnOffCutsceneMode(oKreia);
    TurnOffCutsceneMode(oVisas);

    //AssignCommand(oAtton, ClearAllActions());
    //AssignCommand(oKreia, ClearAllActions());
    //AssignCommand(oVisas, ClearAllActions());

    //AssignCommand(oAtton, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_atton"))));
    AssignCommand(oVisas, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_mand"))));
    AssignCommand(oKreia, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_kreia"))));

    SignalEvent(GetArea(oPlayer), EventUserDefined(1));
    AssignCommand(oPlayer, ClearAllActions());
    AssignCommand(oPlayer, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_301_player"))));
}


void DoPlanetChange()
{
    SetGlobalBoolean("K_LAST_WAYPOINT",FALSE);
    if(GetGlobalNumber("401DXN_STARTED") == 1)
    {
        SetGlobalNumber("401DXN_STARTED", 2);
        PlayMovieQueue();
        StartNewModule("003EBO", "WP_PC_WALK_MAP");
    }
    else if(GetModuleName() == "001EBO")
    {
        // if we are in tutorial, the galaxy map has different functionality
        SetGlobalNumber ( "001EBO_Movie_End", 1);
        PlayMovie("permov02");//play tutorial
        AssignCommand( GetObjectByTag("Galaxymap"),ActionStartConversation(GetFirstPC(),"outro") );
    }
    else if( (GetGlobalNumber("003EBO_BACKGROUND") == 3)  && !GetGlobalBoolean("301_FIRST_ENTER") && (GetGlobalNumber("301_INTRO_SCENE") == 0) )
    {// first time to nar shadda
        SetGlobalNumber("003EBO_RETURN_DEST",3);
        SetGlobalNumber("301_INTRO_SCENE", 1);
        DoFirst301();
    }
    else if( (GetGlobalNumber("003EBO_BACKGROUND") == 6) && !GetGlobalBoolean("701_FIRST_ENTER") && (GetGlobalNumber("701_INTRO_SCENE") == 0) )
    {//first time to koriban
        SetGlobalNumber("003EBO_RETURN_DEST",6);
        SetGlobalBoolean("701_FIRST_SCENE", TRUE);
        SetGlobalNumber("701_INTRO_SCENE", 1);
        DoFirst701();

        //old module load way below:
        //PlayMovieQueue();
        //StartNewModule("003EBO", "WP_from_outside");
    }
    //AWD-OEI 10-23-2004
    else if((GetGlobalNumber("003EBO_BACKGROUND") == 1) && (!GetGlobalBoolean("201_FIRST_ENTER")))//201 first time
    {//first time to Telos, go ahead and jump to 201
        PlayMovieQueue();
        StartNewModule("201TEL", "WP_from_ebonhawk");
    }
    //if (GetGlobalNumber("262TEL_Escape_Telos") == 0)
    //{
        //int12=10;// otherwise Sleheyron is selected
        //SetGlobalNumber("003EBO_RETURN_DEST",10);
        //SetGlobalNumber("003EBO_BACKGROUND",8);
        
        //PlayMovie("HypMov01");// make a "HypMov02" removing the entering hyperspace
        //PlayMovie("TelMov01");
        //QueueMovie("HypMov01");// make a "HypMov02" removing the entering hyperspace
        //QueueMovie("TelMov01");
        //PlayMovieQueue();
        
        //StartNewModule("201TEL","WP_from_ebonhawk"); // ("", "WP_from_ebonhawk")
    //}
    // 262TEL cutscene triggers (JAB-OEI 10/22/04)
    else if( (GetGlobalNumber("000_Jedi_Found") >= 1) && (GetGlobalNumber("000_Jedi_Found") < 4) && (GetGlobalNumber("000_Atriscs1") == 0) && (IsAvailableCreature(NPC_HANDMAIDEN)))
    {//only if player is male
        PlayMovieQueue();
        SetGlobalNumber("000_Atriscs1",2);
        StartNewModule("262TEL");
    }
    else if( (GetGlobalNumber("000_Jedi_Found") >= 2) && (GetGlobalNumber("000_Jedi_Found") < 4) && (GetGlobalNumber("000_Siscut1") == 0) && (IsAvailableCreature(NPC_HANDMAIDEN)))
    {//only if player is male
        PlayMovieQueue();
        SetGlobalNumber("000_Siscut1",2);
        StartNewModule("262TEL");
    }
    else
    {
        SignalEvent(GetArea(GetFirstPC()), EventUserDefined(1));
        PlayMovieQueue();
    }
}


void main()
{
    int nSelected = GetSelectedPlanet();
    int nPrevPlanet = GetCurrentPlanet();

    if(nSelected == -1)
        return;

        // play extra hyperspace movie after ravager
        if (GetGlobalBoolean("CARTH_SCENE") == TRUE)
        {
            SetGlobalNumber("003EBO_RETURN_DEST",8);//
            SetGlobalNumber("003EBO_BACKGROUND",10);//
            QueueMovie("HypMov01");
            SetGlobalBoolean("CARTH_SCENE", FALSE);
        }
        // play extra hyperspace movie after polar academy
        if (GetGlobalBoolean("LEAVING_POLAR") == TRUE && GetGlobalBoolean("LEFT_POLAR") == FALSE)
        {
            SetGlobalNumber("003EBO_RETURN_DEST",8);//
            SetGlobalNumber("003EBO_BACKGROUND",10);//
            QueueMovie("HypMov01");
            SetGlobalBoolean("LEFT_POLAR", TRUE);
        }
        // play extra hyperspace movie after end of the game
        /*if (GetGlobalNumber("GBL_GAME_COMPLETE") <= 1) // not used at the moment
        {
            SetGlobalBoolean("999EBO_Entered",TRUE);
            if (GetGlobalBoolean("999EBO_Entered") == TRUE)
            {
                if (GetGlobalBoolean("999EBO_Exited") == FALSE)
                {
                  
                  SetGlobalNumber("003EBO_RETURN_DEST",8);
                  SetGlobalNumber("003EBO_BACKGROUND",10);
                  QueueMovie("HypMov01");
                  SetGlobalBoolean("999EBO_Exited",TRUE);
                }
            }
        }*/
    // queue up leaving movie
    switch(GetGlobalNumber("003EBO_BACKGROUND"))
    {
        case 0://106PER
        {
            // I don't think we have a movie to play here
            QueueMovie("KorMov02");
            QueueMovie("HypMov01");
        }break;
        case 1://201TEL
        {
            QueueMovie("TelMov02");
            QueueMovie("HypMov01");
        }break;
        case 2://New Yavin
        {
            QueueMovie("05_8c");
            QueueMovie("HypMov01");
        }break;
        case 3://301NAR
        {
            QueueMovie("NarMov02");
            QueueMovie("HypMov01");
        }break;
        case 4://401DXN
        {
            QueueMovie("OndMov04");
            QueueMovie("HypMov01");
        }break;
        case 5://601DAN
        {
            QueueMovie("DanMov02");
            QueueMovie("HypMov01");
        }break;
        case 6://701KOR
        {
            QueueMovie("KorMov02");
            QueueMovie("HypMov01");
        }break;
        case 7://801DRO
        {
            QueueMovie("DroMov04");
            QueueMovie("HypMov01");
        }break;
        case 8://
        {
            QueueMovie("Live_1c");
            QueueMovie("HypMov01");
        }break;
        case 9://901MAL // new planet 02?
        {
            QueueMovie("Live_1c");
            QueueMovie("HypMov01");
        }break;
        case 10://Hyperspace // new planet 03?
        {
            //QueueMovie("KasMov02");
            //QueueMovie("HypMov01");
        }break;
        case 11: //KASHYYK
        {
            QueueMovie("05_4c");
            QueueMovie("HypMov01");
        }break;
        case 12: //954COR
        {
            QueueMovie("NarMov02");
            QueueMovie("HypMov01");
        }break;
        case 13: //YAVIN
        {
            QueueMovie("Live_1c");
            QueueMovie("HypMov01");
        }break;
        case 14: //TATOOINE
        {
            QueueMovie("05_3c");
            QueueMovie("HypMov01");
        }break;
        case 15: //MANAAN
        {
            QueueMovie("05_5c");
            QueueMovie("HypMov01");
        }break;
	}

    int nPlanet = nSelected;

    // Do other stuff like play movies, do stuff to Ebon Hawk
    // we need two movies - the planet that we are leaving, and then the dest planet
    // after we get those two string, we can then play the two movies in sequence
    // we are setting two variables on the ebon hawk. One is for the background, and the
    // other is for the exit module.
    switch(nPlanet)
    {
        case PLANET_PERAGUS:
        {
            AurPostString("ERROR: We should not be able to travel back to peragus.",0,10,5.0);
            // See if peragus slot can be usedSetGlobalNumber("003EBO_RETURN_DEST",2);
            SetGlobalNumber("003EBO_RETURN_DEST",0);//
            SetGlobalNumber("003EBO_BACKGROUND",0);//2

            // need to check where we are landing
            QueueMovie("KorMov01");
        }break;
        case 10://citadel station
        {
            SetGlobalNumber("003EBO_RETURN_DEST",1);
            SetGlobalNumber("003EBO_BACKGROUND",1);

            // need to check where we are landing
            QueueMovie("TelMov01");
        }break;
        case PLANET_TELOS://polar region
        {
            SetGlobalNumber("003EBO_RETURN_DEST",2);
            SetGlobalNumber("003EBO_BACKGROUND",2);

            // need to check where we are landing
            //QueueMovie("TelMov15");
            QueueMovie("05_8a");
        }break;
        case PLANET_NAR_SHADDAA://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",3);
            SetGlobalNumber("003EBO_BACKGROUND",3);

            //if(GetGlobalBoolean("301_FIRST_ENTER"))//only que this movie if we have been here before
            QueueMovie("NarMov01");
        }break;
        case PLANET_DXUN://
        {

            SetGlobalNumber("003EBO_RETURN_DEST",4);
            SetGlobalNumber("003EBO_BACKGROUND",4);

            QueueMovie("OndMov03");
        }break;
        case PLANET_ONDERON://
        {

            SetGlobalNumber("003EBO_RETURN_DEST",4);
            SetGlobalNumber("003EBO_BACKGROUND",4);

            //first time going to onderon?
            if( (GetGlobalNumber("401DXN_Visited") == 0) && (GetGlobalNumber("401DXN_STARTED") == 0) )
            {
                SetGlobalNumber("401DXN_STARTED", 1);
                SetGlobalNumber("003EBO_RETURN_DEST",8);
                SetGlobalNumber("003EBO_BACKGROUND",8);//set space background
                QueueMovie("OndScn01");
            }
            else
                AurPostString("ERROR!!! GALAXY MAP!",5,15,10.0);
        }break;
        case PLANET_DANTOOINE://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",5);
            SetGlobalNumber("003EBO_BACKGROUND",5);

            QueueMovie("DanMov01");
        }break;
        case PLANET_KORRIBAN://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",6);
            SetGlobalNumber("003EBO_BACKGROUND",6);

            QueueMovie("KorMov01");
        }break;
        case PLANET_M4_78://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",7);
            SetGlobalNumber("003EBO_BACKGROUND",7);

            QueueMovie("DroMov02");
        }break;
        case PLANET_MALACHOR_V: // EXTRA PLANET SPACE
        {
            //SetGlobalNumber("003EBO_RETURN_DEST",8);//use to drop out of or mimic hyperspace
            //SetGlobalNumber("003EBO_BACKGROUND",8);//can be used to put ebon hawk into transit
            // check if this is actually used
            SetGlobalNumber("003EBO_RETURN_DEST",9);//8 originally - exit destination case
            SetGlobalNumber("003EBO_BACKGROUND",8);//4 is dxun - background and return planet icon case
                                                // alternating 8 for space background and 9 for return destination

            QueueMovie("LIVE_1a");//
        }break;
        case PLANET_LIVE_01://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",11);
            SetGlobalNumber("003EBO_BACKGROUND",11);// background check fires different planet exit

            QueueMovie("05_4a");
        }break;
        case PLANET_LIVE_02://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",12);
            SetGlobalNumber("003EBO_BACKGROUND",12);
          
            //Coruscant No Movie
            QueueMovie("NarMov01");
        }break;
        case PLANET_LIVE_03://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",13);
            SetGlobalNumber("003EBO_BACKGROUND",13);

            QueueMovie("LIVE_1a");
        }break;
        case PLANET_LIVE_04://
        {
            SetGlobalNumber("003EBO_RETURN_DEST",14);
            SetGlobalNumber("003EBO_BACKGROUND",14);

            QueueMovie("05_3a");
        }break;
        case PLANET_LIVE_05:
        {
            SetGlobalNumber("003EBO_RETURN_DEST",15);
            SetGlobalNumber("003EBO_BACKGROUND",15);

            QueueMovie("05_5a");//
        }break;
        case PLANET_EBON_HAWK:
        {
            SetGlobalNumber("003EBO_RETURN_DEST",8);
            SetGlobalNumber("003EBO_BACKGROUND",10);

            QueueMovie("MalMov07");
            //PlayMovie("MalMov07", 0);
            SetGlobalNumber("907MAL_CUTSCENE", 2);
            SetGlobalNumber("852NIH_Nihilus_Dead", 2);
            StartNewModule("907MAL", "", "", "", "", "", "", "");
        }break;
        case PLANET_HARBINGER:
        {
            //SetGlobalNumber("003EBO_RETURN_DEST",15);
            //SetGlobalNumber("003EBO_BACKGROUND",15);

            //QueueMovie("KasMov01");//
            // case 15 is used for PLANET_LIVE_05
        }break;
        
    }
    //fade out
    SetBackground();
    ExecuteScript("a_holoworld", GetFirstPC());
    DoPlanetChange();
}


//turns off all of the core worlds and live planets.
void CUSTOM_TurnOffPlanets()
{

    SetPlanetSelectable(PLANET_TELOS, FALSE);
    SetPlanetSelectable(PLANET_NAR_SHADDAA, FALSE);
    SetPlanetSelectable(PLANET_DXUN, FALSE);
    SetPlanetSelectable(PLANET_ONDERON, FALSE);
    SetPlanetSelectable(PLANET_DANTOOINE, FALSE);
    SetPlanetSelectable(PLANET_KORRIBAN, FALSE);
    SetPlanetSelectable(PLANET_MALACHOR_V, FALSE);
    SetPlanetSelectable(PLANET_TELOS, FALSE);
    SetPlanetSelectable(PLANET_EBON_HAWK, FALSE);  
    SetPlanetSelectable(PLANET_HARBINGER, FALSE);  
    SetPlanetSelectable(PLANET_PERAGUS, FALSE);   

    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG1))
    {
        SetPlanetSelectable(PLANET_M4_78, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG2))
    {
        SetPlanetSelectable(PLANET_LIVE_01, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG3))
    {
        SetPlanetSelectable(PLANET_LIVE_02, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG4))
    {
        SetPlanetSelectable(PLANET_LIVE_03, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG5))
    {
        SetPlanetSelectable(PLANET_LIVE_04, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG6))
    {
        SetPlanetSelectable(PLANET_LIVE_05, FALSE);
    }
}

