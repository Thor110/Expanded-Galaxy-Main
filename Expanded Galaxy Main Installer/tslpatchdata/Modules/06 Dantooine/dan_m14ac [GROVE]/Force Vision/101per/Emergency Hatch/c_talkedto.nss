//:: c_talkedto
/*
    Returns true if the PC has not
    talked to this NPC before.
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"
#include "k_inc_utility"

int StartingConditional()
{
    if(UT_GetTalkedToBooleanFlag(OBJECT_SELF) == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

