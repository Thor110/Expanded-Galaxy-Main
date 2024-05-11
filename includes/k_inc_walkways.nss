//:: k_inc_walkways
/*
    v1.0
    Walk Way Points Include
    used by k_inc_generic

    NOTE - To get these functions
    use k_inc_generic
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

int WALKWAYS_CURRENT_POSITION = 0;
int WALKWAYS_END_POINT = 1;
int WALKWAYS_SERIES_NUMBER = 2;

int SW_FLAG_AMBIENT_ANIMATIONS  =   29;
// DJS-OEI 3/31/2004
// Modified to make room for designer-reserved values.
/*
int SW_FLAG_AMBIENT_ANIMATIONS_MOBILE = 30;
int SW_FLAG_WAYPOINT_WALK_ONCE  =   34;
int SW_FLAG_WAYPOINT_WALK_CIRCULAR  =   35;
int SW_FLAG_WAYPOINT_WALK_PATH  =   36;
int SW_FLAG_WAYPOINT_WALK_STOP  =   37; //One to three
int SW_FLAG_WAYPOINT_WALK_RANDOM    =   38;
int SW_FLAG_WAYPOINT_WALK_RUN    =   39;
int SW_FLAG_WAYPOINT_DIRECTION = 41;
int SW_FLAG_WAYPOINT_DEACTIVATE = 42;
int SW_FLAG_WAYPOINT_WALK_STOP_LONG = 46;
int SW_FLAG_WAYPOINT_WALK_STOP_RANDOM = 47;
int SW_FLAG_WAYPOINT_START_AT_NEAREST = 73;
*/
int SW_FLAG_AMBIENT_ANIMATIONS_MOBILE = 65;
int SW_FLAG_WAYPOINT_START_AT_NEAREST = 98;
int SW_FLAG_WAYPOINT_WALK_ONCE  =   99;
int SW_FLAG_WAYPOINT_WALK_CIRCULAR  =   100;
int SW_FLAG_WAYPOINT_WALK_PATH  =   101;
int SW_FLAG_WAYPOINT_WALK_RANDOM    =   103;
int SW_FLAG_WAYPOINT_WALK_RUN    =   104;
int SW_FLAG_WAYPOINT_DIRECTION = 105;
int SW_FLAG_WAYPOINT_DEACTIVATE = 106;

//new constants for WAYPOINT PAUSING
int SW_FLAG_WAYPOINT_PAUSE_SHORT  = 102;
int SW_FLAG_WAYPOINT_PAUSE_LONG   = 107;
int SW_FLAG_WAYPOINT_PAUSE_RANDOM = 108;
//old constants for WAYPOINT PAUSING. kept for backwards compatibility
int SW_FLAG_WAYPOINT_WALK_STOP        = 102;// DON'T USE ANYMORE
int SW_FLAG_WAYPOINT_WALK_STOP_LONG   = 107;// DON'T USE ANYMORE
int SW_FLAG_WAYPOINT_WALK_STOP_RANDOM = 108;// DON'T USE ANYMORE


//AWD-OEI 06/23/04 adding a local to store the waypoint animation
int SW_FLAG_USE_WAYPOINT_ANIMATION = 109;

//Makes OBJECT_SELF walk way points based on the spawn in conditions set out.
void GN_WalkWayPoints();
//Sets the series number from 01 to 99 on a creature so that the series number and not the creature's tag is used for walkway points
void GN_SetWalkWayPointsSeries(int nSeriesNumber);
//Sets Generic Spawn In Conditions
void GN_SetSpawnInCondition(int nFlag, int nState = TRUE);
//Gets the boolean state of a generic spawn in condition.
int GN_GetSpawnInCondition(int nFlag);
//Moves an object to the last waypoint in a series
void GN_MoveToLastWayPoint(object oToMove);
//Moves an object to a random point in the series
void GN_MoveToRandomWayPoint(object oToMove);
//Moves an object to a sepcific point in the series
void GN_MoveToSpecificWayPoint(object oToMove, int nArrayNumber);
//Determines the correct direction to proceed in a walkway points array.
int GN_GetWayPointDirection(int nEndArray, int nCurrentPosition);
//Should only be called from within SetListendingPatterns
void GN_SetUpWayPoints();
//Play an animation between way points.
void GN_PlayWalkWaysAnimation();
//Inserts a print string into the log file for debugging purposes for the walkways include.
void WK_MyPrintString(string sString);
//Are valid walkway points available
int GN_CheckWalkWays(object oTarget);

//GN_GetNearestWaypoint - RWT-OEI 01/23/04
//Returns an int representing which Nth into the series is the nearest WP.
//If nSeries is 0, then it will pull from the nearest waypoint in the path named after
//oCharacter.
int GN_GetNearestWaypoint(object oCharacter, int nSeriesNumber = 0);

//::///////////////////////////////////////////////
//:: Walk Way Points
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes OBJECT_SELF walk way points based on a
    number of spawn in conditions.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////

void GN_WalkWayPoints()
{
    if(!GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE))
    {
        string sPost = "POST_";
        string sWays = "WP_";
        string sWayNumber;

        int nCurrentTarget = GetLocalNumber(OBJECT_SELF, WALKWAYS_CURRENT_POSITION);
        int nEndArray = GetLocalNumber(OBJECT_SELF, WALKWAYS_END_POINT);
        int nSeriesInt = GetLocalNumber(OBJECT_SELF, WALKWAYS_SERIES_NUMBER);
        //Used where you want the creature to use a numbered series instead of their own tag.

        if(nCurrentTarget < 10 &&  nCurrentTarget > 0)
        {
            sWayNumber = "0" + IntToString(nCurrentTarget);
        }
        else if(nCurrentTarget == 0)
        {
            //August 2, 2002 - Jason Booth - changed to randomize start wp
            if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM))
            {
                nCurrentTarget = Random(nEndArray) + 1;
                if(nCurrentTarget < 10)
                {
                  sWayNumber = "0" + IntToString(nCurrentTarget);
                }
                else
                {
                  sWayNumber = IntToString(nCurrentTarget);
                }
            }
            else if ( GN_GetSpawnInCondition( SW_FLAG_WAYPOINT_START_AT_NEAREST ) )
            {
                int nNearestNumber = GN_GetNearestWaypoint(OBJECT_SELF, nSeriesInt );
                if ( nNearestNumber > 0 && nNearestNumber < 10 )
                {
                    sWayNumber = "0" + IntToString(nNearestNumber);
                }
                else if ( nNearestNumber >= 10 )
                {
                    sWayNumber = IntToString(nNearestNumber);
                }
                else
                {
                    sWayNumber = "01";
                }
                nCurrentTarget = nNearestNumber;
            }
            else
            {
              sWayNumber = "01";
            }
        }
        else if(nCurrentTarget < 10)
        {
            sWayNumber = "0" + IntToString(nCurrentTarget);
        }
        else
        {
            sWayNumber = IntToString(nCurrentTarget);
        }

        string sMoveWay;
        string sTestWay;
        //Test to see if the series waypoints are being used and if so then build sTestWay with the number not tag.
        if(nSeriesInt > 0)
        {
            string sSeriesWay;
            if(nSeriesInt < 10)
            {
                sSeriesWay = "0" + IntToString(nSeriesInt);
            }
            else
            {
                sSeriesWay = IntToString(nSeriesInt);
            }
            sTestWay = sWays + sSeriesWay + "_02";
        }
        //Use object tag if there is no series number
        else
        {
            sTestWay = sWays + GetTag(OBJECT_SELF) + "_02";
        }

        object oTestWay = GetWaypointByTag(sTestWay);
        if(nEndArray == 0 && GetIsObjectValid(oTestWay))
        {
            //GN_PostString("SET LISTENING PATTERNS HAS NOT RUN PLEASE USE IN SPAWN IN SCRIPT");
        }

        if(GetIsObjectValid(oTestWay))
        {
            int nLength = GetStringLength(sTestWay);
            sMoveWay = GetStringLeft(sTestWay, nLength - 2) + sWayNumber;
            //sWays + GetTag(OBJECT_SELF) + "_" + sWayNumber;
        }
        else
        {
            sWays = "UNKNOWN";
            sMoveWay = sPost + GetTag(OBJECT_SELF);
        }

        object oWay = GetWaypointByTag(sMoveWay);
        int nRun = GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RUN);

        //Check if the target waypoint is close enough to warrent moving on to the next waypoint.
        float personalSpace = GetObjectPersonalSpace(OBJECT_SELF);
        personalSpace += 0.1;
        if(GetDistanceToObject2D(oWay) <= personalSpace)
        {
            int nDirection;
            if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM))
            {
                nCurrentTarget = Random(nEndArray) + 1;
            }
            //AWD-OEI else if(nCurrentTarget < nEndArray && !GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM))
            else if(nCurrentTarget < nEndArray)
            {
                nDirection = GN_GetWayPointDirection(nEndArray, nCurrentTarget);
                nCurrentTarget = nCurrentTarget + nDirection;
            }
            else if(nCurrentTarget == nEndArray)
            {
                nDirection = GN_GetWayPointDirection(nEndArray, nCurrentTarget);
                if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_ONCE))
                {
                    GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE);
                }
                else if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_CIRCULAR))
                {
                    nCurrentTarget = 1;
                    GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DIRECTION, FALSE);
                }
                else
                {
                    nCurrentTarget = nCurrentTarget + nDirection;
                }
            }
        }
        if(GetIsObjectValid(GetWaypointByTag(sMoveWay)))
        {
            int nRand;
            if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_SHORT))
            {
                nRand = 3;
            }
            else if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_LONG))
            {
                nRand = d3() + 3;
            }
            else if(GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_RANDOM))
            {
                nRand = d10();
            }
            else
            {
                nRand = 0;
            }
            //Calculate the timeout based on the distance that needs to be traveled.
            float fTimeOut = GetDistanceBetween2D(GetWaypointByTag(sMoveWay), OBJECT_SELF)/1.25;
            if(fTimeOut < 30.0)
            {
                fTimeOut = 30.0;
            }
            ActionForceMoveToObject(oWay, GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RUN), personalSpace, fTimeOut); //ACTION

            if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS))
            {
                ActionDoCommand(GN_PlayWalkWaysAnimation()); //ACTION
            }
            SetLocalNumber(OBJECT_SELF, WALKWAYS_CURRENT_POSITION, nCurrentTarget);
            if(sWays != "UNKNOWN")
            {
                if(nRand > 0)
                {
                    //need to point in direction of waypoint at this juncture
                    object oTempWay = GetWaypointByTag(sMoveWay);
                    float fFacing = GetFacing(oTempWay);
                    ActionDoCommand( SetFacing(fFacing) );
                    if( GN_GetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION) )
                    {
                        ActionPlayAnimation(GetLocalNumber(OBJECT_SELF, 29), 1.0, IntToFloat(nRand));
                        //ActionWait(IntToFloat(nRand)); //ACTION
                    }
                    else
                    {
                        ActionWait(IntToFloat(nRand)); //ACTION
                    }
                }
                ActionDoCommand(GN_WalkWayPoints());   //ACTION
            }
        }
    }
}

void GN_SetWalkWayPointsSeries(int nSeriesNumber)
{
    SetLocalNumber(OBJECT_SELF, WALKWAYS_SERIES_NUMBER, nSeriesNumber);
}

//::///////////////////////////////////////////////
//:: Set Spawn In Condition
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the Generic Spawn In Conditions
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
void GN_SetSpawnInCondition(int nFlag, int nState = TRUE)
{
    //WK_MyPrintString("GENERIC DEBUG *************** Setting Local Number (" + IntToString(nFlag) + ") = " + IntToString(nState));
    SetLocalBoolean(OBJECT_SELF, nFlag, nState);
}

//::///////////////////////////////////////////////
//:: Get Spawn In Condition
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the Generic Spawn In Conditions
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
int GN_GetSpawnInCondition(int nFlag)
{
    int nLocal = GetLocalBoolean(OBJECT_SELF, nFlag);
    if(nLocal > 0)
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Preston Watamaniuk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the passed in object to the last waypoint
    in that NPCs series of waypoints.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 12, 2002
//:://////////////////////////////////////////////

void GN_MoveToLastWayPoint(object oToMove)
{
    int nLastWay = GetLocalNumber(oToMove, WALKWAYS_END_POINT);
    int nSeries = GetLocalNumber(oToMove, WALKWAYS_SERIES_NUMBER);
    string sString;
    if(nSeries > 0)
    {
        string sSeriesWay;
        if(nSeries < 10)
        {
            sSeriesWay = "0" + IntToString(nSeries);
        }
        else
        {
            sSeriesWay = IntToString(nSeries);
        }
        sString = "WP_" + sSeriesWay;
    }
    else
    {
        sString = "WP_" + GetTag(oToMove);
    }
    if(nLastWay < 10)
    {
        sString = sString + "_0" + IntToString(nLastWay);
    }
    else
    {
        sString = sString + "_" + IntToString(nLastWay);
    }

    object oWay = GetWaypointByTag(sString);
    if(GetIsObjectValid(oWay))
    {
        AssignCommand(oToMove, ClearAllActions());
        AssignCommand(oToMove, ActionMoveToObject(oWay, FALSE));
    }
}

//::///////////////////////////////////////////////
//:: Preston Watamaniuk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the passed in object to a random waypoint
    in that NPCs series of waypoints.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 12, 2002
//:://////////////////////////////////////////////

void GN_MoveToRandomWayPoint(object oToMove)
{
    int nLastWay = GetLocalNumber(oToMove, WALKWAYS_END_POINT);
    int nRandom = Random(nLastWay)+1;
    int nSeries = GetLocalNumber(oToMove, WALKWAYS_SERIES_NUMBER);
    string sString;
    if(nSeries > 0)
    {
        string sSeriesWay;
        if(nSeries < 10)
        {
            sSeriesWay = "0" + IntToString(nSeries);
        }
        else
        {
            sSeriesWay = IntToString(nSeries);
        }
        sString = "WP_" + sSeriesWay;
    }
    else
    {
        sString = "WP_" + GetTag(oToMove);
    }
    if(nLastWay < 10)
    {
        sString = sString + "_0" + IntToString(nRandom);
    }
    else
    {
        sString = sString + "_" + IntToString(nRandom);
    }

    object oWay = GetWaypointByTag(sString);
    if(GetIsObjectValid(oWay))
    {
        AssignCommand(oToMove, ClearAllActions());
        AssignCommand(oToMove, ActionMoveToObject(oWay, FALSE));
    }
}

//::///////////////////////////////////////////////
//:: Preston Watamaniuk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the passed in object to a specified waypoint
    in that NPCs series of waypoints.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 12, 2002
//:://////////////////////////////////////////////
void GN_MoveToSpecificWayPoint(object oToMove, int nArrayNumber)
{
    int nLastWay = GetLocalNumber(oToMove, WALKWAYS_END_POINT);
    int nSeries = GetLocalNumber(oToMove, WALKWAYS_SERIES_NUMBER);
    string sString;
    if(nArrayNumber <= nLastWay)
    {
        if(nSeries > 0)
        {
            string sSeriesWay;
            if(nSeries < 10)
            {
                sSeriesWay = "0" + IntToString(nSeries);
            }
            else
            {
                sSeriesWay = IntToString(nSeries);
            }
            sString = "WP_" + sSeriesWay;
        }
        else
        {
            sString = "WP_" + GetTag(oToMove);
        }
        if(nArrayNumber < 10)
        {
            sString = sString + "_0" + IntToString(nArrayNumber);
        }
        else
        {
            sString = sString + "_" + IntToString(nArrayNumber);
        }

        object oWay = GetWaypointByTag(sString);
        if(GetIsObjectValid(oWay))
        {
            AssignCommand(oToMove, ClearAllActions());
            AssignCommand(oToMove, ActionMoveToObject(oWay, FALSE));
        }
    }
}

//::///////////////////////////////////////////////
//:: Get Waypooint Direction
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the direction that a NPC should be
    walking along their waypoints.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jul 20, 2002
//:://////////////////////////////////////////////

int GN_GetWayPointDirection(int nEndArray, int nCurrentPosition)
{
    int nDirection;
    int nFlag = GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_DIRECTION);
    if(nEndArray == nCurrentPosition && nFlag == FALSE)
    {
        nDirection = -1;
        GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DIRECTION, TRUE);
    }
    else if(nCurrentPosition == 1 && nFlag == TRUE)
    {
        nDirection = 1;
        GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DIRECTION, FALSE);
    }
    else if(nFlag == FALSE)
    {
        nDirection = 1;
    }
    else if(nFlag == TRUE)
    {
        nDirection = -1;
    }

    return nDirection;
}

//::///////////////////////////////////////////////
//:: Set Up Way Points
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Used to initialize the NPCs waypoints
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////

void GN_SetUpWayPoints()
{
    string sString;
    int nSeries = GetLocalNumber(OBJECT_SELF, WALKWAYS_SERIES_NUMBER);
    if(nSeries > 0)
    {
        string sSeriesWay;
        if(nSeries < 10)
        {
            sSeriesWay = "0" + IntToString(nSeries);
        }
        else
        {
            sSeriesWay = IntToString(nSeries);
        }
        sString = "WP_" + sSeriesWay;
    }
    else
    {
        sString = "WP_" + GetTag(OBJECT_SELF);
    }

    int nCnt = 1;
    string sTest = sString + "_01";
    object oWay = GetWaypointByTag(sTest);

    while(GetIsObjectValid(oWay))
    {
        nCnt++;
        if(nCnt < 10)
        {
            sTest = sString + "_0" + IntToString(nCnt);
        }
        else
        {
            sTest = sString + "_" + IntToString(nCnt);
        }
        oWay = GetWaypointByTag(sTest);
    }
    nCnt = nCnt - 1;
    if(nCnt > 0)
    {
        SetLocalNumber(OBJECT_SELF, WALKWAYS_END_POINT, nCnt);
    }
}

//::///////////////////////////////////////////////
//:: Play Walk Ways Animations
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Plays an animation between way points
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void GN_PlayWalkWaysAnimation()
{
    int nRoll = d8();
    if(nRoll == 1)
    {
        //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Bored");
        ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED, 1.0);
    }
    else if(nRoll == 2)
    {
        //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Scratch");
        ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0);
    }
    else if(nRoll == 3)
    {
        //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Pause 2");
        ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 3.0);
    }
    else if((nRoll == 4 || nRoll == 5) && GetRacialType(OBJECT_SELF) != RACIAL_TYPE_DROID)
    {
        if(GetGender(OBJECT_SELF) == GENDER_MALE)
        {
            //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Male Pause 3");
            GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 20.4);
            ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
        }
        else if(GetGender(OBJECT_SELF) == GENDER_FEMALE)
        {
            //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Female Pause 3");
            GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 13.3);
            ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
        }
    }
    else if(nRoll == 6 || nRoll == 4 || nRoll == 5)
    {
        //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Head Turn Left");
        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
    }
    else if(nRoll == 7)
    {
        //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Head Turn Right");
        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
    }
    else if(nRoll == 8)
    {
        //WK_MyPrintString("WALKWAYS DEBUG *************** Play Anim: Pause 2");
        GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
        ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 5.0);
        ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
    }
}

//::///////////////////////////////////////////////
//:: Are Walk Ways Available
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Are valid walkway points available for walking
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 22, 2003
//:://////////////////////////////////////////////
int GN_CheckWalkWays(object oTarget)
{
    string sTag = "WP_" + GetTag(oTarget) + "_01";
    string sPost = "POST_" + GetTag(oTarget);
    int nSeriesInt = GetLocalNumber(oTarget, WALKWAYS_SERIES_NUMBER);
    string sSeriesWay;
    if(nSeriesInt < 10)
    {
        sSeriesWay = "0" + IntToString(nSeriesInt);
    }
    else
    {
        sSeriesWay = IntToString(nSeriesInt);
    }
    string sTestWay = "WP_" + sSeriesWay + "_01";

    object oWay = GetWaypointByTag(sTag);
    object oWay2 = GetWaypointByTag(sTestWay);
    object oPost = GetWaypointByTag(sPost);

    WK_MyPrintString("Walk Initiate for " + GetTag(oTarget));
    WK_MyPrintString("TAG WAY FOUND = " + IntToString(GetIsObjectValid(oWay)));
    WK_MyPrintString("WAY POINT NAME = " + GetTag(oWay));
    WK_MyPrintString("SERIES INT = " + IntToString(nSeriesInt));
    WK_MyPrintString("SERIES WAY FOUND = " + IntToString(GetIsObjectValid(oWay2)));
    WK_MyPrintString("SERIES Series Tag = " + sTestWay);
    WK_MyPrintString("");

    if(GetIsObjectValid(oWay) || GetIsObjectValid(oWay2) || GetIsObjectValid(oPost))
    {
        return TRUE;
    }
    return FALSE;
}

void WK_MyPrintString(string sString)
{
    if(!ShipBuild())
    {
        PrintString(sString);
    }
}

//RWT-OEI 01/23/04
//GN_GetNearestWaypoint
//Returns an int representing which Nth into the series is the nearest WP.
//If nSeries is 0, then it will pull from the nearest waypoint in the path named after
//oCharacter.
int GN_GetNearestWaypoint( object oCharacter, int nSeriesNumber = 0 )
{
    string sWPNumber;
    string sSeriesName;
    object oClosestWP = OBJECT_INVALID;
    float  fMinDistance = 0.0f;

    //Need to determine the correct name for the waypoints.
    int nSeries = GetLocalNumber(OBJECT_SELF, WALKWAYS_SERIES_NUMBER);
    if ( nSeries > 0 ) {//We have a series number, so use it
        string sSeriesWay;
        if ( nSeries < 10 ) {
            sSeriesWay = "0" + IntToString(nSeries);
        } else {
            sSeriesWay = IntToString(nSeries);
        }
        sSeriesName = "WP_" + sSeriesWay;
    } else {//No series number, so use the object's tag
        sSeriesName = "WP_" + GetTag(oCharacter);
    }

    //Now we need to iterate through all the WPs in that series and figure out
    //which of them is closest.
    int nCurNumber = 1;
    int nClosestNumber = 0;
    string sCurWPName = sSeriesName + "_01";
    object oCurWP = GetWaypointByTag(sCurWPName);
    float fCurDistance = 0.0f;
    while (GetIsObjectValid(oCurWP)) {//Now iterate over all the WPs in the series
        //Check to see if this is the closest WP so far.
        fCurDistance = GetDistanceBetween( oCharacter, oCurWP );
        if ( fMinDistance == 0.0f ) {
            fMinDistance = fCurDistance;
            oClosestWP = oCurWP;
            nClosestNumber = nCurNumber;
        } else if ( fCurDistance < fMinDistance ) {
            fMinDistance = fCurDistance;
            oClosestWP = oCurWP;
            nClosestNumber = nCurNumber;
        }

        //Get next WP
        ++nCurNumber;
        if ( nCurNumber < 10 ) {
            sCurWPName = sSeriesName + "_0" + IntToString(nCurNumber);
        } else {
            sCurWPName = sSeriesName + "_" + IntToString(nCurNumber);
        }
        oCurWP = GetWaypointByTag(sCurWPName);
    }

    return nClosestNumber;
}
