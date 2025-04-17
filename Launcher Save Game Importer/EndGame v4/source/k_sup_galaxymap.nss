//:: k_sup_galaxymap
/*
    Universal Script that fires when
    the galaxy map is used.

    Uses K_CURRENT_PLANET to return the current
    planets scripting constant
    Uses K_FUTURE_PLANET to save the selected
    planet for smooth transition from one
    Sequence to another.

    0    Endar Spire     5
    1    Taris           10
    2    Dantooine       15
    3    --Kashyyk       20
    4    --Manaan        25
    5    --Korriban      30
    6    --Tatooine      35
    7    Leviathan       40
    8    Unknown World   45
    9    Star Forge      50
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_utility"
#include "k_inc_debug"
#include "k_inc_ebonhawk"
#include "k_inc_stunt"

//turns off all of the core worlds and live planets.
void CUSTOM_TurnOffPlanets();

void main()
{
    //MODIFIED by Preston Watamaniuk on April 24, 2003
    //This sets all party initialization variables back to 0
    UT_ReinitializePartyPlanetVariables();

    //Set the transit variable to null so the transit system is renewed for each jump between planets.
    SetGlobalString("K_LAST_MODULE", "");

    Db_PostString("FIRING GALAXY MAP v3.0", 10, 10, 4.0);
    Db_MyPrintString("");
    Db_MyPrintString("GALAXY MAP DEBUG ********************** K_SUP_GALAXYMAP FIRING");

    int nSelected = GetSelectedPlanet();
    Db_MyPrintString("GALAXY MAP DEBUG *********** nSelected Planet Constant = " + IntToString(nSelected));

    nSelected = EBO_GetPlanetFrom2DA(nSelected);
    SetGlobalNumber("K_FUTURE_PLANET", nSelected);
    //Game Variables
    int nCurrent = GetGlobalNumber("K_CURRENT_PLANET");
    int nStarmap = GetGlobalNumber("K_STAR_MAP");
    int nLevCapture = GetGlobalNumber("K_CAPTURED_LEV");
    int nKOTOR = GetGlobalNumber("K_KOTOR_MASTER");
    int nCALO = GetGlobalNumber("K_KALO_BANDON");

    //Make sure the Current planet is selectable and future planet is turned off.
    SetPlanetSelectable(nSelected, FALSE);
    SetPlanetSelectable(EBO_GetCurrentPlanet(), TRUE);

    //While on Korriban Bastila is not available to take outside the Ebon Hawk.
    //After the Leviathan Bastila will never be available again. I put this check in to
    //make sure she does not get made selectable by accident after the Leviathan.  It also
    //does not allow Bastila to be taken on to Korriban
    if(nSelected != 30 && nKOTOR == 15)
    {
        SetNPCSelectability(NPC_BASTILA, TRUE);
    }
    else if (nSelected == 30)
    {
        SetNPCSelectability(NPC_BASTILA, FALSE);
    }

    Db_MyPrintString("GALAXY MAP DEBUG *********** nSelected Planet = " + IntToString(nSelected));
    Db_MyPrintString("GALAXY MAP DEBUG *********** K_FUTURE_PLANET = " + IntToString(nSelected));
    Db_MyPrintString("GALAXY MAP DEBUG *********** K_CURRENT_PLANET = " + IntToString(nCurrent));
    Db_MyPrintString("GALAXY MAP DEBUG *********** K_STAR_MAP = " + IntToString(nStarmap));
    Db_MyPrintString("GALAXY MAP DEBUG *********** K_CAPTURED_LEV = " + IntToString(nLevCapture));
    Db_MyPrintString("GALAXY MAP DEBUG *********** K_KOTOR_MASTER = " + IntToString(nKOTOR));
    Db_MyPrintString("GALAXY MAP DEBUG *********** K_KALO_BANDON = " + IntToString(nCALO));

    if(nSelected != -1 && nSelected != nCurrent)
    {
        if(nKOTOR == 15 && nCALO == 0)
        {
            Db_MyPrintString("GALAXY MAP DEBUG *********** I am running ST_PlayDantooineTakeOff()");
            SetGlobalNumber("K_KALO_BANDON", 10);
            ST_PlayDantooineTakeOff();
        }
        else if(nStarmap == 30 && nCALO == 20)
        {
            Db_MyPrintString("GALAXY MAP DEBUG *********** I am running ST_PlayStunt14()");
            SetGlobalNumber("K_KALO_BANDON", 30);
            ST_PlayStunt14();
        }
        else if(nStarmap == 40 && nLevCapture == 5)
        {
            Db_MyPrintString("GALAXY MAP DEBUG *********** I am running ST_PlayLevCaptureStunt()");
            SetPlanetSelectable(PLANET_DANTOOINE, FALSE);
            ST_PlayLevCaptureStunt();

        }
        else if(nStarmap == 50 && nKOTOR == 30 && nSelected == 45)
        {
            //When the Unknown World is selected then turn off the other parts of the galaxy map.
            CUSTOM_TurnOffPlanets();
            Db_MyPrintString("GALAXY MAP DEBUG *********** I am running ST_PlayBastilaTorture()");
            SetGlobalNumber("K_KOTOR_MASTER", 40);
            ST_PlayBastilaTorture();
        }
        else if(nKOTOR == 50)
        {
            //Play the Lightside / Darkside Starforge approach
            Db_MyPrintString("GALAXY MAP DEBUG *********** I am running Unknown World Take-Off");
            ST_PlayUnknownWorldTakeOff();
        }
        else if(nSelected != -1 && nSelected != nCurrent)
        {
            Db_MyPrintString("GALAXY MAP DEBUG *********** Firing Default Transition ST_PlayPlanetToPlanet");
            ST_PlayPlanetToPlanet();
            //StartNewModule("ebo_m12aa", ST_GetTakeOffRender(), ST_GetLandingRender());
            SetGlobalNumber("K_CURRENT_PLANET", nSelected);
        }
        else
        {
            Db_MyPrintString("GALAXY MAP DEBUG ********************** NO PLANETS SELECTED AND/OR AVAILABLE");
        }
        Db_MyPrintString("GALAXY MAP DEBUG ********************** K_SUP_GALAXYMAP ENDING");
        Db_MyPrintString("");
    }
    else
    {
        Db_MyPrintString("GALAXY MAP DEBUG ********************** INVALID SELECTION K_SUP_GALAXYMAP ENDING");
        Db_MyPrintString("");
    }
}


//turns off all of the core worlds and live planets.
void CUSTOM_TurnOffPlanets()
{
    SetPlanetSelectable(PLANET_KASHYYYK, FALSE);
    SetPlanetSelectable(PLANET_MANAAN, FALSE);
    SetPlanetSelectable(PLANET_KORRIBAN, FALSE);
    SetPlanetSelectable(PLANET_TATOOINE, FALSE);
    //MODIFIED by Preston Watamaniuk on May 10, 2003
    //Added in the functionality to turn off the live content planets when the PC goes to the unknown world
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG1))
    {
        Db_MyPrintString("GALAXY MAP DEBUG ********************** Live Planet 1 is now unselectable");
        SetPlanetSelectable(11, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG2))
    {
        SetPlanetSelectable(12, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG3))
    {
        SetPlanetSelectable(13, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG4))
    {
        SetPlanetSelectable(14, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG5))
    {
        SetPlanetSelectable(15, FALSE);
    }
    if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG6))
    {
        SetPlanetSelectable(16, FALSE);
    }
}
