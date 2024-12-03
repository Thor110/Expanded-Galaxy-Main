//::///////////////////////////////////////////////
//:: KOTOR Debug Include
//:: k_inc_debug
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This contains the functions for inserting
    debug information into the scripts.
    This include will use Db as its two letter
    function prefix.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//:://////////////////////////////////////////////

//Inserts a print string into the log file for debugging purposes.
void Db_MyPrintString(string sString);
//Makes the object running the script say a speak string.
void Db_MySpeakString(string sString);
//Makes the nearest PC say a speakstring.
void Db_AssignPCDebugString(string sString);
//Basically, a wrapper for AurPostString
void Db_PostString(string sString = "",int x = 5,int y = 5,float fShow = 1.0);

//::///////////////////////////////////////////////
//:: Debug Print String
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Inserts a print string into the log file for
    debugging purposes.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//:://////////////////////////////////////////////

void Db_MyPrintString(string sString)
{
    if(!ShipBuild())
    {
        PrintString(sString);
    }
}

//::///////////////////////////////////////////////
//:: Debug Speak String
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the object running the script say a
    speak string.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//:://////////////////////////////////////////////

void Db_MySpeakString(string sString)
{
    SpeakString(sString);
}

//::///////////////////////////////////////////////
//:: Assign PC Debug String
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Assigns the nearest PC a speakstring for debug
    purposes.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//:://////////////////////////////////////////////

void Db_AssignPCDebugString(string sString)
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetIsObjectValid(oPC))
    {
        AssignCommand(oPC, SpeakString(sString));
    }
}

//::///////////////////////////////////////////////
//:: Db_PostString
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Basically, a wrapper for AurPostString
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
void Db_PostString(string sString = "",int x = 5,int y = 5,float fShow = 1.0)
{
    if(!ShipBuild())
    {
        AurPostString(sString,x,y,fShow);
    }
}

