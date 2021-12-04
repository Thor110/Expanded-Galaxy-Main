//:: a_talktrue
/*
    Sets the NPC talk to state to
    true.
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"
#include "k_inc_utility"

void main()
{
    UT_SetTalkedToBooleanFlag(OBJECT_SELF);
}
