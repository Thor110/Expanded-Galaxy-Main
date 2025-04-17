//:: k_pebn_galaxy
/*
    Brings up the galaxy map with
    the current planet selected
    Planetary.2DA indexes should be
    used instead of PLANET_ constants

0          Endar_Spire
1          Taris
2          Dantooine
3          Kashyyyk
4          Manaan
5          Korriban
6          Tatooine
7          Leviathan
8          Unknown_World
9          Star_Forge

    Modifications by Peter T.
    When the player uses the galaxy map and only Dantooine
    is available (i.e. after Taris, but before being given
    the main quest),

*/
//:: Created By: Preston Watamaniuk
//:: Modified By: Peter Thomas 11/03/03
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"
#include "k_inc_ebonhawk"

void main()
{
    Db_PostString("Running v3.0", 5, 5, 3.0);
    int nPlanet = EBO_GetCurrentPlanet();
    if(nPlanet == -1)
    {
        nPlanet == PLANET_DANTOOINE;
    }

//Datooine
    int nMain = GetGlobalNumber("K_KOTOR_MASTER");
    if(nMain == 10)
    {
        SetPlanetAvailable(PLANET_DANTOOINE, TRUE); //DAT
        SetPlanetSelectable(PLANET_DANTOOINE, TRUE);
        //SetPlanetAvailable(PLANET_TARIS, TRUE); //TARIS DESTROYED
        //SetPlanetSelectable(PLANET_TARIS, FALSE);
        // Peter T. 11/03/03
        // add journal entry about the Ebon Hawk
        //AddJournalQuestEntry("k_ebonhawk", 1);
    }

//Creamy Middle
    if(nMain == 15)
    {
        //SetPlanetAvailable(PLANET_TARIS, TRUE); //TARIS DESTROYED
        //SetPlanetSelectable(PLANET_TARIS, FALSE);
        SetPlanetAvailable(PLANET_DANTOOINE, TRUE); //DAT
        SetPlanetSelectable(PLANET_DANTOOINE, TRUE);
        SetPlanetAvailable(PLANET_KASHYYYK, TRUE); //KAS
        SetPlanetSelectable(PLANET_KASHYYYK, TRUE);
        SetPlanetAvailable(PLANET_MANAAN, TRUE); //MAN
        SetPlanetSelectable(PLANET_MANAAN, TRUE);
        SetPlanetAvailable(PLANET_KORRIBAN, TRUE); //KOR
        SetPlanetSelectable(PLANET_KORRIBAN, TRUE);
        SetPlanetAvailable(PLANET_TATOOINE, TRUE); //TAT
        SetPlanetSelectable(PLANET_TATOOINE, TRUE);

        //MODIFIED by Preston Watamaniuk on May 10, 2003
        //Putting in the scripting for the live content packages
        //MODIFIED by Preston Watamaniuk on Oct 14, 2003
        //Moved this from the top of the script to the Creamy Middle Activation
        if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG1))
        {
            SetPlanetAvailable(11, TRUE);
            SetPlanetSelectable(11, TRUE);
        }
        else if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG2))
        {
            SetPlanetAvailable(12, TRUE);
            SetPlanetSelectable(12, TRUE);
        }
        else if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG3))
        {
            SetPlanetAvailable(13, TRUE);
            SetPlanetSelectable(13, TRUE);
        }
        else if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG4))
        {
            SetPlanetAvailable(14, TRUE);
            SetPlanetSelectable(14, TRUE);
        }
        else if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG5))
        {
            SetPlanetAvailable(15, TRUE);
            SetPlanetSelectable(15, TRUE);
        }
        else if(GetIsLiveContentAvailable(LIVE_CONTENT_PKG6))
        {
            SetPlanetAvailable(16, TRUE);
            SetPlanetSelectable(16, TRUE);
        }

        // Peter T. 11/03/03
        // remove the journal entry about the Ebon Hawk
        Db_PostString("journal removed");
        RemoveJournalQuestEntry("k_ebonhawk");
    }

//Dantooine Destroyed
    if(nMain == 20)
    {
        SetPlanetAvailable(PLANET_DANTOOINE, TRUE); //DAT
        SetPlanetSelectable(PLANET_DANTOOINE, FALSE);
        SetPlanetAvailable(PLANET_KASHYYYK, TRUE); //KAS
        SetPlanetSelectable(PLANET_KASHYYYK, TRUE);
        SetPlanetAvailable(PLANET_MANAAN, TRUE); //MAN
        SetPlanetSelectable(PLANET_MANAAN, TRUE);
        SetPlanetAvailable(PLANET_KORRIBAN, TRUE); //KOR
        SetPlanetSelectable(PLANET_KORRIBAN, TRUE);
        SetPlanetAvailable(PLANET_TATOOINE, TRUE); //TAT
        SetPlanetSelectable(PLANET_TATOOINE, TRUE);
    }

//Unknown World
    if(nMain == 30)
    {
        SetPlanetAvailable(PLANET_UNKNOWN_WORLD, TRUE);
        SetPlanetSelectable(PLANET_UNKNOWN_WORLD, TRUE);
    }

//Star Forge
    if(nMain == 50)
    {
        //P.W. (June 8) - When the Star Forge Opens up all the live planets are gone.
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
        SetPlanetSelectable(PLANET_UNKNOWN_WORLD, FALSE);
        SetPlanetAvailable(PLANET_STAR_FORGE, TRUE);
        SetPlanetSelectable(PLANET_STAR_FORGE, TRUE);
    }
    if(nMain == 60)
    {
        if(GetGlobalBoolean("CREDITPLAY")==TRUE){
            SetPlanetAvailable(PLANET_STAR_FORGE, TRUE);
            SetPlanetSelectable(PLANET_STAR_FORGE, TRUE);
        }
        else{
            SetPlanetAvailable(PLANET_STAR_FORGE, FALSE);
            SetPlanetSelectable(PLANET_STAR_FORGE, FALSE);
        }
        SetPlanetSelectable(PLANET_UNKNOWN_WORLD, TRUE);
        SetPlanetSelectable(PLANET_KASHYYYK, TRUE);
        SetPlanetSelectable(PLANET_MANAAN, TRUE);
        SetPlanetSelectable(PLANET_KORRIBAN, TRUE);
        SetPlanetSelectable(PLANET_TATOOINE, TRUE);
        SetPlanetSelectable(11, TRUE);
        //return;
    }
    ShowGalaxyMap(nPlanet);
}
