//:: k_inc_zones
/*
     Zone including for controlling
     the chaining of creatures
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_generic"

//Function run by the trigger to catalog the control nodes followers
void ZN_CatalogFollowers();
//Checks zone conditional on creature to if they belong to the zone
int ZN_CheckIsFollower(object oController, object oTarget);
//Checks the distance and creatures around the PC to see if it should return home.
int ZN_CheckReturnConditions();
//Gets the followers to move back to the controller object
void ZN_MoveToController(object oController, object oFollower);
//Checks to see if a specific individual needs to return to the controller.
int ZN_CheckFollowerReturnConditions(object oTarget);


//::///////////////////////////////////////////////
//:: Catalog Zone Followers
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Catalogs all creatures within
     the trigger area and marks
     them with an integer which
     is part of the creature's
     tag.
     Use local number SW_NUMBER_LAST_COMBO
     as a test. A new local number will
     be defined if the system works.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2003
//:://////////////////////////////////////////////
void ZN_CatalogFollowers()
{
    GN_PostString("FIRING", 10,10, 10.0);
    if(GetLocalBoolean(OBJECT_SELF, 10) == FALSE) //Has talked to boolean
    {
        string sZoneTag = GetTag(OBJECT_SELF);
        int nZoneNumber = StringToInt(GetStringRight(sZoneTag, 2));
        //Set up creature followers
        object oZoneFollower = GetFirstInPersistentObject();
        while(GetIsObjectValid(oZoneFollower))
        {
            SetLocalNumber(oZoneFollower, SW_NUMBER_COMBAT_ZONE, nZoneNumber);
            //GN_MyPrintString("ZONING DEBUG ***************** Setup Follower = " + GN_ReturnDebugName(oZoneFollower));
            //GN_MyPrintString("ZONING DEBUG ***************** Setup Follower Zone # = " + GN_ITS(GetLocalNumber(oZoneFollower, SW_NUMBER_COMBAT_ZONE)));

            oZoneFollower = GetNextInPersistentObject();
        }
        SetLocalBoolean(OBJECT_SELF, 10, TRUE);//Has talked to boolean
    }
}

//::///////////////////////////////////////////////
//:: Check Object for Zoning
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the object to see if they part of the
    zone. This function is run off of the control
    node.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2003
//:://////////////////////////////////////////////
int ZN_CheckIsFollower(object oController, object oTarget)
{
    int nNumber = GetLocalNumber(oTarget, SW_NUMBER_COMBAT_ZONE);
    string sZoneTag = GetTag(OBJECT_SELF);
    int nZoneNumber = StringToInt(GetStringRight(sZoneTag, 2));
    if(nZoneNumber == nNumber)
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Check Return Conditions
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the conditions exist to
    possibly check for followers to return to
    the controller.
*/
//:://////////////////////////////////////////////

//:://////////////////////////////////////////////
int ZN_CheckReturnConditions()
{
    object oPC = GetPartyMemberByIndex(0);
    /*
        1.  Is the PC more than 21m away from the control node
        2.  Is the follower more than 20m away from the control node
        3.  Are there 9 or more individuals around the any single party member out to a distance of 30m
    */
    object oNinth = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oPC, 9);
    //GN_MyPrintString("ZONING DEBUG ***************** 9th Creature = " + GN_ReturnDebugName(oNinth));
    //GN_MyPrintString("ZONING DEBUG ***************** 9th Creature Distance = " + FloatToString(GetDistanceBetween(oPC, oNinth), 4,2));

    if(GetIsObjectValid(oNinth) && GetDistanceBetween(oPC, oNinth) < 30.0)
    {
        if(GetDistanceBetween(OBJECT_SELF, oPC) > 21.0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Check Follower Return Conditions.
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the follower object needs to return
    to home base.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////
int ZN_CheckFollowerReturnConditions(object oTarget)
{
    float fDistance = GetDistanceBetween(oTarget, OBJECT_SELF);
    //GN_MyPrintString("ZONING DEBUG ***************** " + GN_ReturnDebugName(oTarget) + " control distance " + FloatToString(fDistance, 4, 2));

    if(fDistance >= 10.0 && GetIsEnemy(oTarget, GetFirstPC()))
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Move to Controller
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the follower object to move back to the
    controller object.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2003
//:://////////////////////////////////////////////
void ZN_MoveToController(object oController, object oFollower)
{
    //GN_MyPrintString("ZONING DEBUG ***************** Controller = " + GN_ReturnDebugName(oController));
    //GN_MyPrintString("ZONING DEBUG ***************** Follower = " + GN_ReturnDebugName(oFollower));
    //GN_MyPrintString("ZONING DEBUG ***************** Follower Zone # = " + GN_ITS(GetLocalNumber(oFollower, SW_NUMBER_LAST_COMBO)));
    if(GetCurrentAction(oFollower) != ACTION_INVALID)
    {
        SetCommandable(TRUE);
    }

    CancelCombat(oFollower);
    AssignCommand(oFollower, ClearAllActions());
    AssignCommand(oFollower, ActionForceMoveToObject(oController, TRUE, 5.0, 5.0));
    AssignCommand(oFollower, ActionDoCommand(SetCommandable(TRUE, oFollower)));
    AssignCommand(oFollower, SetCommandable(FALSE, oFollower));
}





