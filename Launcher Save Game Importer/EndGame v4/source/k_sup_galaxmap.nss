//:: k_sup_galaxmap
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

#include "k_inc_ebonhawk"
#include "k_inc_stunt"

void main()
{
    int nSelected = GetSelectedPlanet();
    nSelected = EBO_GetPlanetFrom2DA(nSelected);
    SetGlobalNumber("K_FUTURE_PLANET", nSelected);
    int nCurrent = GetGlobalNumber("K_CURRENT_PLANET");
    int nStarmap = GetGlobalNumber("K_STAR_MAP");
    int nLevCapture = GetGlobalNumber("K_CAPTURE_LEV");

    if(nStarmap == 40 && nLevCapture == 5)
    {
        ST_PlayLevCaptureStunt();
        SetGlobalNumber("K_CURRENT_PLANET", 40);
    }
    else
    {
        StartNewModule("ebo_m12aa", ST_GetTakeOffRender(), "8", ST_GetLandingRender());
        SetGlobalNumber("K_CURRENT_PLANET", EBO_GetPlanetFrom2DA(nSelected));
    }
}
