//:: a_q_cryst_change
/*

Takes the quest crystal the player has, if any.
Gives the player the appropriate quest crystal for their alignment/level

*/
//:: Created By: Kevin Saunders, 06/26/04
//:: Copyright 2004 Obsidian Entertainment
#include "k_inc_utility"

int GetPCLevel()
{
    int n = GetGlobalNumber("G_PC_LEVEL");

    return(n);
}

string GetPCAlignType()
{
    string s;

    if(IsDark()) s = "1";
    if(IsNeutral()) s = "2";
    if(IsLight()) s = "3";

    if(IsDarkComplete()) s = "0";
    if(IsLightComplete()) s = "4";

    return(s);
}


int GetCrystalLevel()
{

    int n = 1 + (GetPCLevel() - 9)/3;

    if(n < 1) n = 1;
    if(n > 9) n = 9;
    return(n);
}
