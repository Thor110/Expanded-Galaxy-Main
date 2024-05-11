//:: k_inc_cheat
/*
    This will be localized area for all
    Cheat Bot scripting.
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"

//Takes a PLANET_ Constant
void CH_SetPlanetaryGlobal(int nPlanetConstant);
//Makes the specified party member available to the PC
void CH_SetPartyMemberAvailable(int nNPC);

//::///////////////////////////////////////////////
//:: Set Planet Local
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
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
//:: Created On: Oct 16, 2002
//:://////////////////////////////////////////////

void CH_SetPlanetaryGlobal(int nPlanetConstant)
{
/*
    if(nPlanetConstant == PLANET_ENDAR_SPIRE)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 5);
    }
    else if(nPlanetConstant == PLANET_TARIS)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 10);
    }
    else if(nPlanetConstant == PLANET_DANTOOINE)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 15);
    }
    else if(nPlanetConstant == PLANET_KASHYYYK)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 20);
    }
    else if(nPlanetConstant == PLANET_KORRIBAN)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 30);
    }
    else if(nPlanetConstant == PLANET_MANAAN)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 25);
    }
    else if(nPlanetConstant == PLANET_TATOOINE)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 35);
    }
    else if(nPlanetConstant == PLANET_LEVIATHAN)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 40);
    }
    else if(nPlanetConstant == PLANET_UNKNOWN_WORLD)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 45);
    }
    else if(nPlanetConstant == PLANET_STAR_FORGE)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 50);
    }
*/
}

//::///////////////////////////////////////////////
//:: Make NPC Available
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets an NPC as available
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2002
//:://////////////////////////////////////////////

void CH_SetPartyMemberAvailable(int nNPC)
{
/*
    if(nNPC == NPC_BASTILA)
    {
        AddAvailableNPCByTemplate(NPC_BASTILA, "p_bastilla");
    }
    else if(nNPC == NPC_CANDEROUS)
    {
        AddAvailableNPCByTemplate(NPC_CANDEROUS, "p_cand");
    }
    else if(nNPC == NPC_CARTH)
    {
        AddAvailableNPCByTemplate(NPC_CARTH, "p_carth");
    }
    else if(nNPC == NPC_HK_47)
    {
        AddAvailableNPCByTemplate(NPC_HK_47, "p_hk47");
    }
    else if(nNPC == NPC_JOLEE)
    {
        AddAvailableNPCByTemplate(NPC_JOLEE, "p_jolee");
    }
    else if(nNPC == NPC_JUHANI)
    {
        AddAvailableNPCByTemplate(NPC_JUHANI, "p_juhani");
    }
    else if(nNPC == NPC_MISSION)
    {
        AddAvailableNPCByTemplate(NPC_MISSION, "p_mission");
    }
    else if(nNPC == NPC_T3_M4)
    {
        AddAvailableNPCByTemplate(NPC_T3_M4, "p_t3m4");
    }
    else if(nNPC == NPC_ZAALBAR)
    {
        AddAvailableNPCByTemplate(NPC_ZAALBAR, "p_zaalbar");
    }
*/
}



