//:: k_con_makeitem
/*
    Determines whether the PC
    needs items from an NPC
    character
    
    TRUE = Character does need equipment
    FALSE = Character does not need equipment
*/
//:: Created By:
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"
#include "k_inc_ebonhawk"

int StartingConditional()
{
    if(EBO_GetIsEquipmentNeeded())
    {
        return TRUE;
    }
    return FALSE;
}
