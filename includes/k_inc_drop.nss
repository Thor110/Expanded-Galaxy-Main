//::///////////////////////////////////////////////
//:: KOTOR Treasure drop Include
//:: k_inc_drop
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
// Contains the functions for handling creatures dropping random treasure
//Only human creatures not of the beast subrace willdrop treasure dependant
//on their hit dice
//:://////////////////////////////////////////////
//:: Created By: Aidan Scanlan On: 02/06/03
//:://////////////////////////////////////////////

int DR_HIGH_LEVEL = 15;
int DR_MEDIUM_LEVEL = 10;
int DR_LOW_LEVEL = 5;
int DR_SUBRACE_BEAST = 2;
//Checks for treasure drop conditions. Returns True if treasure will drop
int DR_SpawnCreatureTreasure(object oTarget = OBJECT_SELF);
//Dependant on the level of a creature drops treasure from a list
void DR_CreateRandomTreasure(object oTarget = OBJECT_SELF);
// creates a low level treasure: med pack/repair, frag grenade, credits
void DR_CreateLowTreasure();
// creates midlevel treasure: adv-med/repair, any gredade, stims, credits
void DR_CreateMidTreasure();
// creates high treasure: adv stims, grenades, ultra med/repair, credits
void DR_CreateHighTreasure();
// Creates 1-4 credits
void DR_CreateFillerCredits();
/////////////////////////////////////////////////////////////////////////


//Checks for treasure drop conditions. Returns True if treasure will drop
int DR_SpawnCreatureTreasure(object oTarget = OBJECT_SELF)
{
    int nRace = GetRacialType(oTarget);
    int nFaction = GetStandardFaction(oTarget);
    int nSubRace = GetSubRace(oTarget);
    if(Random(4) == 0 &&
       nRace != RACIAL_TYPE_DROID &&
       nSubRace != DR_SUBRACE_BEAST)
    {
        //AurPostString("will drop",5,5,5.0);
        DR_CreateRandomTreasure(oTarget);
        return TRUE;
    }
    return FALSE;
}

//Dependant on the level of a creature drops treasure from a list
void DR_CreateRandomTreasure(object oTarget = OBJECT_SELF)
{
    int nLevel = GetHitDice(oTarget);
    if (nLevel > DR_HIGH_LEVEL)
    {
        DR_CreateHighTreasure();
        if(Random(2) == 0)
        {
            DR_CreateHighTreasure();
        }
        if(Random(2) == 0)
        {
            DR_CreateMidTreasure();
        }
    }
    else if (nLevel <= DR_HIGH_LEVEL && nLevel > DR_MEDIUM_LEVEL)
    {
        DR_CreateMidTreasure();
        if(Random(3) == 0)
        {
            DR_CreateHighTreasure();
        }
        if(Random(2) == 0)
        {
            DR_CreateMidTreasure();
        }
    }
    else if (nLevel <= DR_MEDIUM_LEVEL && nLevel > DR_LOW_LEVEL)
    {
        DR_CreateMidTreasure();
        if(Random(2) == 0)
        {
            DR_CreateLowTreasure();
        }
    }
    else
    {
        DR_CreateLowTreasure();
        if(Random(3) == 0)
        {
            DR_CreateLowTreasure();
        }
        if(Random(4) == 0)
        {
            DR_CreateMidTreasure();
        }
    }
}

// creates a low level treasure: med pack/repair, frag grenade, credits
void DR_CreateLowTreasure()
{
   //AurPostString("dropping low",5,6,5.0);
    string sTemplate;
    int nStack = 1;
    int nRandom = Random(6);
    switch(nRandom)
    {
        case 0: sTemplate = "g_i_drdrepeqp001";  //repair kit
        break;

        case 1:
            sTemplate = "g_i_credits001";// 5 stack
            nStack = 5;
            DR_CreateFillerCredits();
        break;

        case 2:
            sTemplate = "g_i_credits002";  //10 stack
            nStack = 10;
            DR_CreateFillerCredits();
        break;

        case 3:
            sTemplate = "g_i_credits003";  // 25 stack
            nStack = 25;
            DR_CreateFillerCredits();
        break;

        case 4: sTemplate = "g_i_medeqpmnt01";// med kit
        break;

        case 5: sTemplate = "g_w_fraggren01"; // frag grenade
        break;
    }

    CreateItemOnObject(sTemplate,OBJECT_SELF,nStack);
}

// creates midlevel treasure: adv-med/repair, any gredade, stims, credits
void DR_CreateMidTreasure()
{
    string sTemplate;
    int nStack = 1;
    int nRandom = Random(15);
    switch (nRandom)
    {
        case 0: sTemplate = "g_i_drdrepeqp002";  //advanced repair kit
        break;

        case 1:
            sTemplate = "g_i_credits004";  // 50 stack
            nStack = 50;
            DR_CreateFillerCredits();
        break;

        case 2: sTemplate = "g_i_medeqpmnt02"; //advanced med pack
        break;

        case 3: sTemplate = "g_i_cmbtshot001"; //battle stimulant
        break;

        case 4: sTemplate = "g_i_adrnaline003";  //adrenal stamina
        break;

        case 5: sTemplate = "g_i_adrnaline002"; // adrenal alacrity
        break;

        case 6: sTemplate = "g_i_adrnaline001"; // adrenal strength
        break;

        case 7:
            sTemplate = "g_w_stungren01";  // stun grenade
            nStack = 2;
        break;

        case 8:
            sTemplate = "g_w_fraggren01";  // fragmentation grenade
            nStack = 2;
        break;

        case 9: sTemplate = "g_w_poisngren01"; // poison gredade
        break;

        case 10: sTemplate = "g_w_sonicgren01"; // sonic grenade
        break;

        case 11: sTemplate = "g_w_adhsvgren001"; // adhesive grenade
        break;

        case 12: sTemplate = "g_w_cryobgren001";// cryo grenade
        break;

        case 13: sTemplate = "g_w_iongren01";// ion grenade
        break;
    }
    CreateItemOnObject(sTemplate,OBJECT_SELF,nStack);
}

// creates high treasure: adv stims, grenades, ultra med/repair, credits
void DR_CreateHighTreasure()
{
    string sTemplate;
    int nStack = 1;
    int nRandom = Random(16);
    switch (nRandom)
    {
        case 0: sTemplate = "g_i_drdrepeqp003";  //super repair kit
        break;

        case 1: sTemplate = "g_w_thermldet01"; //Thermal detinator
        break;

        case 2: sTemplate = "g_i_medeqpmnt03"; //life pack
        break;

        case 3: sTemplate = "g_i_cmbtshot003";//speed stim
        break;

        case 4: sTemplate = "g_i_cmbtshot002"; //hyper battle stim
        break;

        case 5: sTemplate = "g_i_adrnaline006"; //huper adrenal stamina
        break;

        case 6: sTemplate = "g_i_adrnaline005"; //hyper adrenal alacrity
        break;

        case 7: sTemplate = "g_i_adrnaline004";// hyper adrenal strength
        break;

        case 8:
        sTemplate = "g_w_poisngren01"; // poison gredade
        nStack = 2;
        break;

        case 9:
        sTemplate = "g_w_sonicgren01"; // sonic grenade
        nStack = 2;
        break;

        case 10:
        sTemplate = "g_w_adhsvgren001"; // adhesive grenade
        nStack = 2;
        break;

        case 11:
        sTemplate = "g_w_cryobgren001";// cryo grenade
        nStack = 2;
        break;

        case 12:
        sTemplate = "g_w_firegren001";// plasma grenade
        nStack = 2;
        break;

        case 13:
        sTemplate = "g_w_iongren01";// ion grenade
        nStack = 2;
        break;

        case 14:
        sTemplate = "g_i_credits015";
        nStack = Random(50) + 50;
        break;

        case 15: sTemplate = "g_w_firegren001";// plasma grenade
        break;

    }
    CreateItemOnObject(sTemplate,OBJECT_SELF,nStack);
}

// Creates 1-4 credits
void DR_CreateFillerCredits()
{
    CreateItemOnObject("g_i_credits015",OBJECT_SELF,Random(4) + 1);
}
