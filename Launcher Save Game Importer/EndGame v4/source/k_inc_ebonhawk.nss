//:: k_inc_ebonhawk
/*
     Ebon Hawk include file
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

//This checks the Star Map plot to see if it is at state 30.
int EBO_CheckStarMapPlot();
//Bastila intiates conversation with the PC
void EBO_BastilaStartConversation2();
//Should Bastila intiates conversation with the PC
int EBO_ShouldBastilaStartConversation();
//Bastila intiates conversation with the PC
void EBO_BastilaStartConversation2();
//Advances the state of the bounty hunters plot after galaxy map selections are made
void EBO_PlayBountyHunterCutScene();
//Play the current cutscene for taking off from the planet.
string EBO_PlayTakeOff(int nCurrentPlanet);
//Play the corrent cutscene for landing on the planet.
string EBO_PlayLanding(int nDestination);
//Creates items on the PC based on the NPC they are talking to.
void EBO_CreateEquipmentOnPC();
//Checks if the PC needs equipment based on the NPC they are talking to.
int EBO_GetIsEquipmentNeeded();
//Determines the number items held with specific tags
int EBO_CheckInventoryNumbers(string sTag1, string sTag2 = "", string sTag3 = "", string sTag4 = "");
//Returns the scripting constant for the current planet.
int EBO_GetCurrentPlanet();
//Returns the scripting constant for the future planet.
int EBO_GetFuturePlanet();
//Returns the correct K_CURRENT_PLANET value when a Planetary.2DA index is passed in.
int EBO_GetPlanetFrom2DA(int nPlanetIndex);
//Starts the correct sequence based on the planet being traveled to.
void EBO_PlayRenderSequence();

//::///////////////////////////////////////////////
//:: Check Star Map
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the variable K_STAR_MAP is at 30 and
    the variable K_CAPTURED_LEV = 5 then
    run the leviathan module.
    K_CAPTURED_LEV States
    0 = Pre Leviathan
    5 = Captured
    10 = Escaped
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 3, 2002
//:://////////////////////////////////////////////

int EBO_CheckStarMapPlot()
{
    int nStarMap = GetGlobalNumber("K_STAR_MAP");
    int nLev = GetGlobalBoolean("K_CAPTURED_LEV");
    if(nStarMap >= 40 && nLev == 5)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 40);
        //This will be removed when the new galaxy map is rolled out.
        StartNewModule("ebo_m40aa");

        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Bastila Start Vision Conversation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function gets bastila to start the
    appropriate cutscene dialogue with the PC
    You can use k_vis_[PLANET] == FALSE to see
    if they have been their before and seen the
    planet vision. This applies to Dantooine,
    Manaan, Korriban, Tatooine and Kashyyyk.

    Also set the script so that if Ebon_Vision !=99
    then it fires the dialog file ebo_bast_vision
    and has Bastila init dialog on the Ebon Hawk.
    (If Ebon_Vision==99 the dialog will not fire,
    but it should still play the vision.
    15 to 35
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 3, 2002
//:://////////////////////////////////////////////

void EBO_BastilaStartConversation()
{
    int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
    int nVision = GetGlobalNumber("Ebon_Vision");
    int nFLAG = FALSE;
    if( (nPlanet == 15 || nPlanet == 20 || nPlanet == 25 || nPlanet == 30 || nPlanet == 35) && nVision != 99)
    {
        object oBast = GetNearestObjectByTag("Bastila");
        if(GetIsObjectValid(oBast))
        {
            if(nPlanet == 15 && !GetGlobalBoolean("k_vis_dantooine"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_dantooine",1);
            }
            else if(nPlanet == 20 && !GetGlobalBoolean("k_vis_kashyyyk"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_kashyyyk",1);
            }
            else if(nPlanet == 25 && !GetGlobalBoolean("k_vis_manaan"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_manaan",1);
            }
            else if(nPlanet == 30 && !GetGlobalBoolean("k_vis_korriban"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_korriban",1);
            }
            else if(nPlanet == 35 && !GetGlobalBoolean("k_vis_tatooine"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_tatooine",1);
            }
            if(nFLAG == TRUE)
            {
                //HoldWorldFadeInForDialog();
                object oPC = GetFirstPC();
                AurPostString("I am going to talk", 5, 6, 4.0);
                AurPostString("Bastila is Valid = " + IntToString(GetIsObjectValid(oBast)), 5,7,4.0);
                AurPostString("PC is Valid = " + IntToString(GetIsObjectValid(oPC)), 5,8,4.0);
                AssignCommand(oBast, ActionStartConversation(oPC, "ebo_bast_vision", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
            }
        }
    }
}

//::///////////////////////////////////////////////
//::Calo Nord / Bandon Variable Advancement
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This plot involves the PC being tracked across the galaxy.
    Plot is tracked with the K_KALO_BANDON variable
    1 - Leaving Dantooine --> Cutscene with Calo Nord = 0, set to 10.
    2 - On 3rd Star Map Planet --> Next villain encounter will spawn Nord = 10, set to 20
    3 - Leaving 3rd Starmap Planet --> Darth Bandon cutscene = 20, set to 30.
    4 - On 4th Star Map planet --> Darth Bandon Attacks = 30, set to 99
    Trigger have been placed on all the creamy middle planets to simulate
    the ambush
    10 - 1st Map Activated - Set K_KALO_BANDON to 10
    30 - 3rd Map Activated - Set K_KALO_BANDON to 30
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////
void EBO_PlayBountyHunterCutScene()
{
    int nStar = GetGlobalNumber("K_STAR_MAP");
    if(nStar == 10)
    {
        //NOTE - PLAY FIRST CUTSCENE WITH CALO NORD HERE
        SetGlobalNumber("K_KALO_BANDON", 10);
    }
    else if(nStar == 30)
    {
        //NOTE - PLAY SECOND CUTSCENE WITH DARTH BANDON HERE
        SetGlobalNumber("K_KALO_BANDON", 30);
    }
}

//::///////////////////////////////////////////////
//::Play Appropriate Travel Cutscenes
//::Calo Nord / Bandon Variable Advancement
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    K_STAR_MAP variable
    0 - No maps activated
    10 - 1st Map Activated
    20 - 2nd Map Activated
    30 - 3rd Map Activated
    40 - 4th Map Activated
    50 - 5th Map Activated

World Variables
    Global Number Variable: Planet Settings
    VARIABLE = K_CURRENT_PLANET
        Endar Spire     5
        Taris           10
        Dantooine       15
        --Kashyyk       20
        --Manaan        25
        --Korriban      30
        --Tatooine      35
        Leviathan       40
        Unknown World   45
        Star Forge      50
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////
string EBO_PlayTakeOff(int nCurrentPlanet)
{
    int nPlanet = nCurrentPlanet;//GetGlobalNumber("K_CURRENT_PLANET");
    if(nPlanet == 15)
    {
        PlayMovie("05_2c");
    }
    else if(nPlanet == 20)
    {
        PlayMovie("05_4c");
    }
    else if(nPlanet == 25)
    {
        PlayMovie("05_5c");
    }
    else if(nPlanet == 30)
    {
        PlayMovie("05_7c");
    }
    else if(nPlanet == 35)
    {
        PlayMovie("05_3c");
    }
    else if(nPlanet == 40)
    {
        //PlayMovie("");
    }
    else if(nPlanet == 45)
    {
        PlayMovie("05_8c");
    }
    return "NULL";
}

string EBO_PlayLanding(int nDestination)
{
    int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
    if(nPlanet == 15)
    {
        PlayMovie("05_2a");
    }
    else if(nPlanet == 20)
    {
        PlayMovie("05_4a");
    }
    else if(nPlanet == 25)
    {
        PlayMovie("05_5a");
    }
    else if(nPlanet == 30)
    {
        PlayMovie("05_7a");
    }
    else if(nPlanet == 35)
    {
        PlayMovie("05_3a");
    }
    else if(nPlanet == 40)
    {
        //PlayMovie("");
    }
    else if(nPlanet == 45)
    {
        PlayMovie("05_8a");
    }
    return "NULL";
}

//::///////////////////////////////////////////////
//:: Does the PC need equipment
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the PCs inventory and determines based
    on OBJECT_SELF whether the PC needs equipment
    Returns true if the PC has enough of the selected
    item.

    The number of items given out is now tracked as
    of Feb 25, 2003.  The NPCs will not give out
    more items than the current setting of the
    star map variable + 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 19, 2002
//:://////////////////////////////////////////////
int EBO_GetIsEquipmentNeeded()
{
    int nNumber, nGlobal;
    string sTag = GetTag(OBJECT_SELF);
    int nStarMap = (GetGlobalNumber("K_STAR_MAP")*2) + 10;
    if(sTag == "zaalbar")
    {
        nNumber = EBO_CheckInventoryNumbers("G_w_StunGren01","g_w_iongren01","g_w_adhsvgren001");
        nGlobal = GetGlobalNumber("K_ZAALBAR_ITEMS");
        if((nNumber <= 10 && nGlobal < nStarMap) || nGlobal == 0)
        {
            return FALSE;
        }
        return TRUE;
    }
    else if(sTag == "jolee")
    {
        nNumber = EBO_CheckInventoryNumbers("g_I_medeqpmnt01","G_I_MEDEQPMNT02","g_I_medeqpmnt03");
        nGlobal = GetGlobalNumber("K_JOLEE_ITEMS");
        if((nNumber <= 10 && nGlobal < nStarMap) || nGlobal == 0)
        {
            return FALSE;
        }
        return TRUE;
    }
    else if(sTag == "mission")
    {
        nNumber = EBO_CheckInventoryNumbers("g_i_secspike01","G_I_SECSPIKE02");
        nGlobal = GetGlobalNumber("K_MISSION_ITEMS");
        if((nNumber <= 10 && nGlobal <= nStarMap) || nGlobal == 0)
        {
            return FALSE;
        }
        return TRUE;
    }
    else if(sTag == "cand")
    {
        nNumber = EBO_CheckInventoryNumbers("g_i_adrnaline001","G_I_ADRNALINE002","g_i_adrnaline003", "g_i_cmbtshot001");
        nGlobal = GetGlobalNumber("K_CAND_ITEMS");

        PrintString("Number = " + IntToString(nNumber));
        PrintString("Global = " + IntToString(nGlobal));
        PrintString("StarMap = " + IntToString(nStarMap));

        if((nNumber <= 10 && nGlobal <= nStarMap) || nGlobal == 0)
        {
            return FALSE;
        }
        return TRUE;
    }
    else if(sTag == "t3m4")
    {
        nNumber = EBO_CheckInventoryNumbers("K_COMPUTER_SPIKE");
        nGlobal = GetGlobalNumber("K_T3M4_ITEMS");

        if((nNumber <= 10 && nGlobal <= nStarMap) || nGlobal == 0)
        {
            return FALSE;
        }
        return TRUE;
    }
    return TRUE;
}

//::///////////////////////////////////////////////
//:: NPC Item Creation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines who the person being talked to is
    and what items the character should receive.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 19, 2002
//:://////////////////////////////////////////////

void EBO_CreateEquipmentOnPC()
{
    int nCount;
    string sTag = GetTag(OBJECT_SELF);
    object oProxy;
    if(sTag == "zaalbar")
    {
        int nRand = d3();
        if(nRand == 1)
        {
            oProxy = CreateItemOnObject("g_w_stungren01", GetFirstPC());
        }
        else if(nRand == 2)
        {
            oProxy = CreateItemOnObject("g_w_iongren01", GetFirstPC());
        }
        else if(nRand == 3)
        {
            oProxy = CreateItemOnObject("g_w_adhsvgren001", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_ZAALBAR_ITEMS");
        nCount++;
        SetGlobalNumber("K_ZAALBAR_ITEMS", nCount);
    }
    else if(sTag == "jolee")
    {
        int nLevel = GetHitDice(GetFirstPC());
        if(nLevel <= 4)
        {
            oProxy = CreateItemOnObject("G_I_MEDEQPMNT01", GetFirstPC());
        }
        else if(nLevel > 4 && nLevel <= 10)
        {
            oProxy = CreateItemOnObject("G_I_MEDEQPMNT02", GetFirstPC());
        }
        else if(nLevel > 10)
        {
            oProxy = CreateItemOnObject("G_I_MEDEQPMNT03", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_JOLEE_ITEMS");
        nCount++;
        SetGlobalNumber("K_JOLEE_ITEMS", nCount);
    }
    else if(sTag == "mission")
    {
        int nLevel = GetHitDice(GetFirstPC());
        if(nLevel <= 7)
        {
            oProxy = CreateItemOnObject("g_i_secspike01", GetFirstPC());
        }
        else if(nLevel > 7)
        {
            oProxy = CreateItemOnObject("g_i_secspike02", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_MISSION_ITEMS");
        nCount++;
        SetGlobalNumber("K_MISSION_ITEMS", nCount);
    }
    else if(sTag == "cand")
    {
        int nRand = d4();

        if(nRand == 1)
        {
            oProxy = CreateItemOnObject("G_I_ADRNALINE001", GetFirstPC());
        }
        else if(nRand == 2)
        {
            oProxy = CreateItemOnObject("G_I_ADRNALINE002", GetFirstPC());
        }
        else if(nRand == 3)
        {
            oProxy = CreateItemOnObject("G_I_ADRNALINE003", GetFirstPC());
        }
        else if(nRand == 4)
        {
            oProxy = CreateItemOnObject("G_I_CMBTSHOT001", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_CAND_ITEMS");
        nCount++;
        SetGlobalNumber("K_CAND_ITEMS", nCount);
    }
    else if(sTag == "t3m4")
    {
        oProxy = CreateItemOnObject("G_I_PROGSPIKE01", GetFirstPC());
        nCount = GetGlobalNumber("K_T3M4_ITEMS");
        nCount++;
        SetGlobalNumber("K_T3M4_ITEMS", nCount);
    }
}

//::///////////////////////////////////////////////
//:: Count Inventory Items
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Counts and totals up to four different items
    within the PCs inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 19, 2002
//:://////////////////////////////////////////////

int EBO_CheckInventoryNumbers(string sTag1, string sTag2 = "", string sTag3 = "", string sTag4 = "")
{
    int nNumber;
    object oGrenade;
    if(sTag1 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag1);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    if(sTag2 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag2);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    if(sTag3 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag3);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    if(sTag4 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag4);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    return nNumber;
}

//::///////////////////////////////////////////////
//:: Get Planet Constant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Uses K_CURRENT_PLANET to return the current
    planets scripting constant
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
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 1, 2002
//:://////////////////////////////////////////////
int EBO_GetCurrentPlanet()
{
    int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
    if(nPlanet == 5)
    {
        return PLANET_ENDAR_SPIRE;
    }
    else if(nPlanet == 10)
    {
        return PLANET_TARIS;
    }
    else if(nPlanet == 15)
    {
        return PLANET_DANTOOINE;
    }
    else if(nPlanet == 20)
    {
        return PLANET_KASHYYYK;
    }
    else if(nPlanet == 25)
    {
        return PLANET_MANAAN;
    }
    else if(nPlanet == 30)
    {
        return PLANET_KORRIBAN;
    }
    else if(nPlanet == 35)
    {
        return PLANET_TATOOINE;
    }
    else if(nPlanet == 40)
    {
        return PLANET_LEVIATHAN;
    }
    else if(nPlanet == 45)
    {
        return PLANET_UNKNOWN_WORLD;
    }
    else if(nPlanet == 50)
    {
        return PLANET_STAR_FORGE;
    }
    return -1;
}

//::///////////////////////////////////////////////
//:: Get Planet Constant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Uses K_FUTURE_PLANET to return the current
    planets scripting constant
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
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 1, 2002
//:://////////////////////////////////////////////
int EBO_GetFuturePlanet()
{
    int nPlanet = GetGlobalNumber("K_FUTURE_PLANET");
    if(nPlanet == 5)
    {
        return PLANET_ENDAR_SPIRE;
    }
    else if(nPlanet == 10)
    {
        return PLANET_TARIS;
    }
    else if(nPlanet == 15)
    {
        return PLANET_DANTOOINE;
    }
    else if(nPlanet == 20)
    {
        return PLANET_KASHYYYK;
    }
    else if(nPlanet == 25)
    {
        return PLANET_MANAAN;
    }
    else if(nPlanet == 30)
    {
        return PLANET_KORRIBAN;
    }
    else if(nPlanet == 35)
    {
        return PLANET_TATOOINE;
    }
    else if(nPlanet == 40)
    {
        return PLANET_LEVIATHAN;
    }
    else if(nPlanet == 45)
    {
        return PLANET_UNKNOWN_WORLD;
    }
    else if(nPlanet == 50)
    {
        return PLANET_STAR_FORGE;
    }
    else if(nPlanet == 55)
    {
        return PLANET_LIVE_01;
    }
    else if(nPlanet == 60)
    {
        return PLANET_LIVE_02;
    }
    else if(nPlanet == 65)
    {
        return PLANET_LIVE_03;
    }
    else if(nPlanet == 70)
    {
        return PLANET_LIVE_04;
    }
    else if(nPlanet == 75)
    {
        return PLANET_LIVE_05;
    }
    return -1;
}


int EBO_GetPlanetFrom2DA(int nPlanetIndex)
{
/*Scripting Constants              2DA Values
int PLANET_ENDAR_SPIRE      = 0;   0          Endar_Spire
int PLANET_TARIS            = 1;   1          Taris
int PLANET_EBON_HAWK        = 2;   2          Ebon_Hawk
int PLANET_DANTOOINE        = 3;   3          Dantooine
int PLANET_TATOOINE         = 4;   4          Tatooine
int PLANET_KASHYYYK         = 5;   5          Kashyyyk
int PLANET_MANAAN           = 6;   6          Manaan
int PLANET_KORRIBAN         = 7;   7          Korriban
int PLANET_LEVIATHAN        = 8;   8          Leviathan
int PLANET_UNKNOWN_WORLD    = 9;   9          Unknown_World
int PLANET_STAR_FORGE       = 10;  10         Star_Forge

Plot Values
0    Endar Spire     5
1    Taris           10
3    Dantooine       15
5    --Kashyyk       20
6    --Manaan        25
7    --Korriban      30
4    --Tatooine      35
8    Leviathan       40
9    Unknown World   45
10   Star Forge      50

*/
    if(nPlanetIndex == PLANET_ENDAR_SPIRE)
    {
        return 5;
    }
    else if(nPlanetIndex == PLANET_TARIS)
    {
        return 10;
    }
    else if(nPlanetIndex == PLANET_EBON_HAWK)
    {
        return -1;
    }
    else if(nPlanetIndex == PLANET_DANTOOINE)
    {
        return 15;
    }
    else if(nPlanetIndex == PLANET_TATOOINE)
    {
        return 35;
    }
    else if(nPlanetIndex == PLANET_KASHYYYK)
    {
        return 20;
    }
    else if(nPlanetIndex == PLANET_MANAAN)
    {
        return 25;
    }
    else if(nPlanetIndex == PLANET_KORRIBAN)
    {
        return 30;
    }
    else if(nPlanetIndex == PLANET_LEVIATHAN)
    {
        return 40;
    }
    else if(nPlanetIndex == PLANET_UNKNOWN_WORLD)
    {
        return 45;
    }
    else if(nPlanetIndex == PLANET_STAR_FORGE)
    {
        return 50;
    }
    else if(nPlanetIndex == PLANET_LIVE_01)
    {
        return 55;
    }
    else if(nPlanetIndex == PLANET_LIVE_02)
    {
        return 60;
    }
    else if(nPlanetIndex == PLANET_LIVE_03)
    {
        return 65;
    }
    else if(nPlanetIndex == PLANET_LIVE_04)
    {
        return 70;
    }
    else if(nPlanetIndex == PLANET_LIVE_05)
    {
        return 75;
    }
    return -1;
}

//::///////////////////////////////////////////////
//:: Start Render/Stunt Sequence
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the correct sequence based on the
    planet being traveled to.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 9, 2002
//:://////////////////////////////////////////////

void EBO_PlayRenderSequence()
{
    int nSelected = GetSelectedPlanet();
    nSelected = EBO_GetPlanetFrom2DA(nSelected);
    SetGlobalNumber("K_FUTURE_PLANET", nSelected);
    int nCurrent = GetGlobalNumber("K_CURRENT_PLANET");
}

//::///////////////////////////////////////////////
//:: Should Bastila Start Vision Conversation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function returns true if bastila should
    start a cutscene dialogue with the PC
    You can use k_vis_[PLANET] == FALSE to see
    if they have been their before and seen the
    planet vision. This applies to Dantooine,
    Manaan, Korriban, Tatooine and Kashyyyk.

    Also set the script so that if Ebon_Vision !=99
    then it fires the dialog file ebo_bast_vision
    and has Bastila init dialog on the Ebon Hawk.
    (If Ebon_Vision==99 the dialog will not fire,
    but it should still play the vision.
    15 to 35
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 3, 2002
//:://////////////////////////////////////////////

int EBO_ShouldBastilaStartConversation()
{
    int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
    int nVision = GetGlobalNumber("Ebon_Vision");
    int nFLAG = FALSE;
    if( (nPlanet == 15 || nPlanet == 20 || nPlanet == 25 || nPlanet == 30 || nPlanet == 35) && nVision != 99)
    {
        //object oBast = GetNearestObjectByTag("Bastila");
        //if(GetIsObjectValid(oBast))
        //{
            if(nPlanet == 15 && !GetGlobalBoolean("k_vis_dantooine"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_dantooine",1);
            }
            else if(nPlanet == 20 && !GetGlobalBoolean("k_vis_kashyyyk"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_kashyyyk",1);
            }
            else if(nPlanet == 25 && !GetGlobalBoolean("k_vis_manaan"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_manaan",1);
            }
            else if(nPlanet == 30 && !GetGlobalBoolean("k_vis_korriban"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_korriban",1);
            }
            else if(nPlanet == 35 && !GetGlobalBoolean("k_vis_tatooine"))
            {
                nFLAG = TRUE;
                SetGlobalBoolean("k_vis_tatooine",1);
            }
            if(nFLAG == TRUE)
            {
                //AurPostString("k_vis_kashyyyk = " + IntToString(GetGlobalBoolean("k_vis_kashyyyk")), 5, 6, 3.0);
                //AurPostString("k_vis_manaan = " + IntToString(GetGlobalBoolean("k_vis_manaan")), 5, 7, 3.0);
                //AurPostString("k_vis_korriban = " + IntToString(GetGlobalBoolean("k_vis_korriban")), 5, 8, 3.0);
                //AurPostString("k_vis_tatooine = " + IntToString(GetGlobalBoolean("k_vis_tatooine")), 5, 9, 3.0);

                return TRUE;
                //HoldWorldFadeInForDialog();
                //object oPC = GetFirstPC();
                //AssignCommand(oBast, ActionStartConversation(oPC, "ebo_bast_vision", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
            }
        //}
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Bastila Start Conversation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 17,
//:://////////////////////////////////////////////

void EBO_BastilaStartConversation2()
{
    object oPC = GetFirstPC();
    object oBast = GetNearestObjectByTag("Bastila_Starter");
    if(GetIsObjectValid(oBast))
    {
        //AurPostString("Ebon_Vision = " + IntToString(GetGlobalNumber("Ebon_Vision")), 5, 6, 4.0);
        //AurPostString("Firing Bastila's Conversation", 5, 7, 4.0);
        AssignCommand(oBast, ActionStartConversation(oPC, "ebo_bast_vision", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "Bastila"));
    }
}
