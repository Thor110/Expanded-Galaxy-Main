//:: k_inc_utility
/*
    common functions used throughout various scripts

    Modified by Peter T. 17/03/03
    - Added UT_MakeNeutral2(), UT_MakeHostile1(), UT_MakeFriendly1() and UT_MakeFriendly2()
*/
//:: Created By: Jason Booth
//:: Copyright (c) 2002 Bioware Corp.

// Plot Flag Constants.
int SW_PLOT_BOOLEAN_01 = 0;
int SW_PLOT_BOOLEAN_02 = 1;
int SW_PLOT_BOOLEAN_03 = 2;
int SW_PLOT_BOOLEAN_04 = 3;
int SW_PLOT_BOOLEAN_05 = 4;
int SW_PLOT_BOOLEAN_06 = 5;
int SW_PLOT_BOOLEAN_07 = 6;
int SW_PLOT_BOOLEAN_08 = 7;
int SW_PLOT_BOOLEAN_09 = 8;
int SW_PLOT_BOOLEAN_10 = 9;
int SW_PLOT_HAS_TALKED_TO = 10;
int SW_PLOT_COMPUTER_OPEN_DOORS = 11;
int SW_PLOT_COMPUTER_USE_GAS = 12;
int SW_PLOT_COMPUTER_DEACTIVATE_TURRETS = 13;
int SW_PLOT_COMPUTER_DEACTIVATE_DROIDS = 14;
int SW_PLOT_COMPUTER_MODIFY_DROID = 15;
int SW_PLOT_REPAIR_WEAPONS = 16;
int SW_PLOT_REPAIR_TARGETING_COMPUTER = 17;
int SW_PLOT_REPAIR_SHIELDS = 18;
int SW_PLOT_REPAIR_ACTIVATE_PATROL_ROUTE = 19;

// UserDefined events
int HOSTILE_RETREAT = 1100;

//Alignment Adjustment Constants
int SW_CONSTANT_DARK_HIT_HIGH = -6;
int SW_CONSTANT_DARK_HIT_MEDIUM = -5;
int SW_CONSTANT_DARK_HIT_LOW = -4;
int SW_CONSTANT_LIGHT_HIT_LOW = -2;
int SW_CONSTANT_LIGHT_HIT_MEDIUM = -1;
int SW_CONSTANT_LIGHT_HIT_HIGH = 0;

// Returns a pass value based on the object's level and DC rating of 0, 1, or 2 (easy, medium, difficult)
// December 20 2001: Changed so that the difficulty is determined by the
// NPC's Hit Dice
int AutoDC(int DC, int nSkill, object oTarget);
//  checks for high charisma
int IsCharismaHigh();
//  checks for low charisma
int IsCharismaLow();
//  checks for normal charisma
int IsCharismaNormal();
//  checks for high intelligence
int IsIntelligenceHigh();
//  checks for low intelligence
int IsIntelligenceLow();
//  checks for normal intelligence
int IsIntelligenceNormal();
// checks to see if pc is completely dark side
int IsDarkComplete();
//  checks to see if pc is very dark side
int IsDarkHigh();
//  checks to see if pc is just a little dark side
int IsDarkLow();
//  checks to see if pc is dark side
int IsDark();
// checks to see if pc is completely light side
int IsLightComplete();
//  checks to see if pc is very light side
int IsLightHigh();
//  checks to see if pc is slightly light side
int IsLightLow();
//  checks to see if pc is light side
int IsLight();
//  checks to see if pc is neutral
int IsNeutral();
//  pads a string with the given pad character to the specified length
string PadString(string str = "",string pad = " ",int length = 0);
//  causes the given object to initiate conversation with the player
void TalkToPC(object oSpeaker);
//Gets the boolean state of a plot bit field
int UT_GetPlotBooleanFlag(object oTarget, int nIndex);
//Sets the boolean state of plot bit field using the SW_PLOT_BOOLEAN CONSTANTS
void UT_SetPlotBooleanFlag(object oTarget, int nIndex, int nState);
//Determines state of the HAS TALKED TO FLAG on the passed in object.
int UT_GetTalkedToBooleanFlag(object oTarget);
//Sets the Talked To Flag on the specified object.
void UT_SetTalkedToBooleanFlag(object oTarget, int nState = TRUE);
//Get the nearest PC to the specified object
object UT_GetNearestPCToObject(object oTarget = OBJECT_SELF);
//Determine if object is a PC
int UT_IsObjectPC(object oTarget = OBJECT_INVALID);
//does a heavy darkside adjustment on the player
void UT_DarkHigh(object oTarget);
//does a medium darkside adjustment on the player
void UT_DarkMed(object oTarget);
//does a small darkside adjustment on the player
void UT_DarkSml(object oTarget);
//does a heavy lightside adjustment on the player
void UT_LightHigh(object oTarget);
//does a medium lightside adjustment on the player
void UT_LightMed(object oTarget);
//does a small lightside adjustment on the player
void UT_LightSml(object oTarget);
//Resets all of an objects Bit Fields to TRUE or FALSE
void UT_ResetPlotBooleanFlags(object oToChange, int nState);
//make object do an uninterruptible path move
void UT_PlotMovePath(string sWayPointTag,int nFirst, int nLast, int nRun = FALSE);
//make object do an uninterruptible move to an object
void UT_PlotMoveObject(object oTarget,int nRun = FALSE);
//make object do an uninterruptible move to a location
void UT_PlotMoveLocation(location lTarget,int nRun = FALSE);
//perform a skill check
int UT_SkillCheck(int iDC, int iSkill, object oTarget);
//test whether force power is dark side
int UT_IsDarkSidePower(int iSpellID);
//Creates an object at a location without having to pass back an object.  Can be
//used in DelayCommand functions.
void UT_CreateObject(int nObjectType, string sTemplate, location lLocal);
//Command used in the swoop droid triggers to activate the spawning in of messengers.
void UT_SpawnMessenger();
//Makes the NPC flee to an SW_EXIT waypoint and destroy itself
void UT_ExitArea(int nRun = FALSE, int nParam = 0, object oObj = OBJECT_SELF);
//Determines the number of spikes or parts to take away from the PC.
int UT_DeterminesItemCost(int nDC, int nSkill);
//Remove a number of computer spikes.
void UT_RemoveComputerSpikes(int nNumber);
//Remove a number of parts
void UT_RemoveRepairParts(int nNumber);
//Return items amounts for either the Spikes or the Parts
int UT_ReturnSpikePartAmount(int nSkill);
//Searches the area and changes all turrets with the specified tag to the neutral faction
void UT_MakeNeutral(string sObjectTag);
//Searches the area and changes all droids with the specified tag to the insane faction
void UT_MakeInsane(string sObjectTag);
//Searches through the ara and stuns all droids with the given tag permanently
void UT_StunDroids(string sObjectTag);
//Starts a fight
void UT_StartCombat(object oObject);
//Releases gas into the room and kills all biologicals in the specified radius
//The radius should be between 2 - 5m
void UT_GasRoom(string sWayTag, float fDistance, int bIndiscriminant = TRUE);
//Overloads a power conduit and does 10d6 damage to all within the specified radius
//bIndiscriminant: TRUE-affects all creatures; FALSE-affects only enemies
void UT_OverloadConduit(string sObjectTag, float fDistance, int bIndiscriminant = TRUE);
//Returns a creature to the nearest "wp_" waypoint.
//During this time the creature will be uncommanable
void UT_ReturnToBase(string sTag = "wp_homebase");
//NPC initiates a conversation with the player.
void UT_NPC_InitConversation(string sNPCTag,string sDlg = "",object oEntered = OBJECT_INVALID);
//Sets the Journal entry for the starmap automatically.
void UT_SetStarmapJournal();
//Creates number of creatures with a specific template at a specified waypoint tag.
//Total is the number times the loop will run.
//fTimeDelay is the number seconds between iterations.
//nSpawnIncrement is the number of templates spawned in per iteration.
void UT_RunCombatEncounter(string sTemplate, string sTag, int nTotal = 3, float fTimeDelay = 1.5, int nSpawnIncrement = 1);
//Sets the talik to flag on all objects with the specified tag using the PC as a focal point.
void UT_SetTalkToFlagByTag(string sTag);
//Locks any other doors with the same tag.  Makes them plot.
void UT_LockDoorDuplicates(string sTag);
//Check to see if the Party member specified is in the party and within the distance given.
int UT_CheckCanPartyMemberInterject(int nNPC_Constant, float fDistance);
//Reinitializes the Party Planet Initialization Variables
void UT_ReinitializePartyPlanetVariables();
//Teleport a party member
void UT_TeleportPartyMember(object oPartyMember, location lDest);
//Returns true if oTarget is the object of interest of an attacker
int UT_GetUnderAttack(object oTarget);
//Teleport the whole party and face them the direction that the objects they
//are being jumped to are facing.
void UT_TeleportWholeParty(object oWP0, object oWP1, object oWP2);
//Pause and restart a conversation.
void UT_ActionPauseConversation(float fDelay);
//Spawn NPC without return
void UT_SpawnAvailableNPC(int nNPC, location lWay);
//Goes through the current party and heals them.
void UT_HealParty();
//Heals the object passed in.
void UT_HealNPC(object oNPC);
//Heals all of the Party NPCs in Area
void UT_HealAllPartyNPCs();
//This function removes party members. It stores the npc constants of the removed party members.
void UT_StoreParty();
//This function restore party members. It will only restore party members removed via the UT_StoreParty funcion
void UT_RestoreParty();
//Returns the NPC code for the given object if it is a NPC, otherwise it returns -1
int UT_GetNPCCode(object oNPC);
//restores all party mambers to 1 hp if tempoarily dead
void UT_RestorePartyToOneHealth();
//Alter the stack size of a given item
void UT_AlterItemStack(object oItem,int iNum = 1,int bDecrement = TRUE);
//Goes through the party and removes them. This is best used on Module Load when the object are not actually created yet.
void UT_ClearAllPartyMembers();
//Does a DC check just using an ability score
int UT_AbilityCheck(int iDC, int iAbility, object oTarget);
//Validate a jump back to the last location by comparing module names.
int UT_ValidateJump(string sLastModule);
//Make alignment change based on a constant passed in to the function
void UT_AdjustCharacterAlignment(object oTarget, int nScale);

// Added by Peter T. 17/03/03
// Searches the area and changes all instances with the specified tag to the Neutral faction
void UT_MakeNeutral2(string sObjectTag);
// Added by Peter T. 17/03/03
// Searches the area and changes all instances with the specified tag to the Hostile_1 faction
void UT_MakeHostile1(string sObjectTag);
// Added by Peter T. 17/03/03
// Searches the area and changes all instances with the specified tag to the Friendly_1 faction
void UT_MakeFriendly1(string sObjectTag);
// Added by Peter T. 17/03/03
// Searches the area and changes all instances with the specified tag to the Friendly_2 faction
void UT_MakeFriendly2(string sObjectTag);
//performs a standard torture cage effect
void UT_ActivateTortureCage(object oCage, object oTarget,float fDuration);
//Makes the animal face the PC, do its victory and play a sound passed in.
//Should be used in conjunction with the k_def_interact spawn in
void UT_DoAmbientReaction(string sSound);


//STAR MAP FUNCTION SET
//Advances K_STAR_MAP, sets the journal and sets the talk to flag.
void UT_StarMap1VariableSet();
//Plays the animations necessary for the current state of the starmap variable
void UT_StarMap2PlayAnimation();
//Returns the appropriate animation loop for the Star Map
int UT_StarMap3GetLoopAnim(int nStarMapVar);
//Runs the entire Starmap sequence as a black box with no extra scripting required.
void UT_StarMap4RunStarMap();

// JAB-OEI 8/5/04
// Stores the facing of the party leader to be preserved during conversation
// Can restore with UT_RestoreLeaderFacing
void UT_StoreLeaderFacing(object oLeader);

// JAB-OEI 8/5/04
// Restores leader facing direction after conversation (call this on the last red node of a conversation)
// should be called in conjunction with UT_StoreLeaderFacing();
void UT_RestoreLeaderFacing(object oLeader);

// Tony Evans 9/14/04
// Counts the number of creatures of the OBJECT_TYPE of a given tag, or objects that contain a given tag
// Returns the number of objects
int UT_ObjectCount(string sTag = "", int iName = 0);


///////////////////////////////////////////////////////////////////////////////
/*
    AutoDC

Relation to Max Persuade   Low Persaude chance   Mid Persuade chance   High Persuade chance

Higher than Max                  100                   100                     100
75% to 100%                      100                   100                     75
50% to 75%                       75                    50                      25
25% to 50%                       50                    25                      0
0% to 25%                        25                    0                       0
*/
///////////////////////////////////////////////////////////////////////////////
//  Returns a pass value based on the object's level and the suggested DC
// December 20 2001: Changed so that the difficulty is determined by the
// NPC's Hit Dice
///////////////////////////////////////////////////////////////////////////////
//  Created By: Preston Watamaniuk
///////////////////////////////////////////////////////////////////////////////
int AutoDC(int DC, int nSkill, object oTarget)
{
    int nSkillLvl = GetSkillRank(nSkill, oTarget);
    int nMax;
    int nRoll = d100();

    nMax = GetHitDice(oTarget) + 5;
    float fMax = IntToFloat(nMax);
    float fSkillLvl = IntToFloat(nSkillLvl);
    float fPercent = fSkillLvl/fMax;

    AurPostString("Skill Percentage Chance = " + FloatToString(fPercent,4,2),5,5,3.0);
    AurPostString("Percentage Die Roll     = " + IntToString(nRoll),5,7,3.0);

    if(fPercent <= 0.25)
    {
        if(DC == 0 && nRoll <= 40){return TRUE;}
    }
    else if(fPercent > 0.25 && fPercent <= 0.5)
    {
        if(DC == 0 && nRoll <= 50){return TRUE;}
        if(DC == 1 && nRoll <= 25){return TRUE;}
    }
    else if(fPercent > 0.5 && fPercent <= 0.75)
    {
        if(DC == 0 && nRoll <= 75){return TRUE;}
        if(DC == 1 && nRoll <= 50){return TRUE;}
        if(DC == 2 && nRoll <= 25){return TRUE;}
    }
    else if(fPercent > 0.75 && fPercent <= 1.0)
    {
        if(DC == 0 && nRoll <= 100){return TRUE;}
        if(DC == 1 && nRoll <= 100){return TRUE;}
        if(DC == 2 && nRoll <= 75){return TRUE;}
    }
    else if(fPercent > 1.0)
    {
        return TRUE;
    }
    return FALSE;


    //LEGACY CODE CHANGED ON FEB 18, 2003
    /*
    Easy = Lvl/4 ...rounded up
    Moderate = 3/Lvl + Lvl ...rounded up
    Difficult = Lvl * 1.5 + 6 ...rounded up

    int nLevel = GetHitDice(OBJECT_SELF);
    if(nLevel <= 0 || nLevel > 20)
    {
        nLevel = GetHitDice(GetPCSpeaker());
    }
    int nTest = 0;
    switch (DC)
    {
    case 0: nTest = nLevel / 4 + 1; break;
        // * minor tweak to lower the values a little
    case 1: nTest = (3 / nLevel + nLevel) - abs( (nLevel/2) -2); break;
    case 2: nTest = FloatToInt(nLevel * 1.5 + 6) - abs( ( FloatToInt(nLevel/1.5) -2));   break;
    }
    //SpeakString(IntToString(nTest));

    // * Roll d20 + skill rank vs. DC + 10
    if (GetSkillRank(nSkill, oTarget) + d20() >= nTest + 10)
    {
       return TRUE;
    }
       return FALSE;
    */
}

//::///////////////////////////////////////////////
//:: IsCharismaHigh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks for high charisma
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsCharismaHigh()
{
  if (GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA) >= 15)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

//::///////////////////////////////////////////////
//:: IsCharismaLow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks for low charisma
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsCharismaLow()
{
  return !IsCharismaNormal();
}

//::///////////////////////////////////////////////
//:: IsCharismaNormal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks for normal charisma
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsCharismaNormal()
{
  if (GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA) >= 10)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

//::///////////////////////////////////////////////
//:: IsIntelligenceHigh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks for high intelligence
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsIntelligenceHigh()
{
  if (GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE) >= 15)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

//::///////////////////////////////////////////////
//:: IsIntelligenceLow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks for low intelligence
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsIntelligenceLow()
{
  return !IsIntelligenceNormal();
}

//::///////////////////////////////////////////////
//:: IsIntelligenceNormal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks for normal intelligence
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsIntelligenceNormal()
{
  if (GetAbilityScore(GetPCSpeaker(),ABILITY_INTELLIGENCE) >= 10)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

//::///////////////////////////////////////////////
//:: IsDarkComplete
//:: Copyright (c) 2004 Obsidian Entertainment
//:://////////////////////////////////////////////
/*
//  checks to see if pc is completely dark side
*/
//:://////////////////////////////////////////////
//:: Created By:  Kevin Saunders
//:: Created On:  June 26, 2004
//:://////////////////////////////////////////////
int IsDarkComplete()
{
    int align = GetGoodEvilValue(GetPCSpeaker());

    if(align == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: IsDarkHigh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is very dark side
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsDarkHigh()
{
    int align = GetGoodEvilValue(GetPCSpeaker());

    if(align >= 0 && align < 20)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: IsDarkLow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is just a little dark side
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsDarkLow()
{
    int align = GetGoodEvilValue(GetPCSpeaker());

    if(align >= 20 && align < 40)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: IsDark
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is dark side
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsDark()
{
    if(IsDarkLow() || IsDarkHigh())
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
//::///////////////////////////////////////////////
//:: IsLightComplete
//:: Copyright (c) 2004 Obsidian Entertainment
//:://////////////////////////////////////////////
/*
//  checks to see if pc is completely light side
*/
//:://////////////////////////////////////////////
//:: Created By:  Kevin Saunders
//:: Created On:  June 26, 2004
//:://////////////////////////////////////////////
int IsLightComplete()
{
    int align = GetGoodEvilValue(GetPCSpeaker());

    if(align == 100)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
//::///////////////////////////////////////////////
//:: IsLightHigh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is very light side
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsLightHigh()
{
    int align = GetGoodEvilValue(GetPCSpeaker());

    if(align >= 81)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: IsLightLow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is slightly light side
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsLightLow()
{
    int align = GetGoodEvilValue(GetPCSpeaker());

    if(align >= 61 && align < 81)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: IsLight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is light side
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsLight()
{
    if(IsLightLow() || IsLightHigh())
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: IsNeutral
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  checks to see if pc is neutral
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 19, 2002
//:://////////////////////////////////////////////
int IsNeutral()
{
    if(!IsDark() && !IsLight())
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: PadString
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  pads a string with the given pad character to the specified length
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  June 20, 2002
//:://////////////////////////////////////////////
string PadString(string str = "",string pad = " ",int length = 0)
{
  while(GetStringLength(str) < length)
  {
    str = pad + str;
  }
  return(str);
}

//::///////////////////////////////////////////////
//:: TalkToPC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//  causes the given object to initiate conversation with the player
*/
//:://////////////////////////////////////////////
//:: Created By:  Jason Booth
//:: Created On:  July 12, 2002
//:://////////////////////////////////////////////
void TalkToPC(object oSpeaker)
{
  AssignCommand(oSpeaker,ClearAllActions());
  AssignCommand(oSpeaker,
  ActionStartConversation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)));
}

//::///////////////////////////////////////////////
//:: Get Boolean Plot Flag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the boolean state of a plot bit field
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
int UT_GetPlotBooleanFlag(object oTarget, int nIndex)
{
    int nPlotBoolean;
    if(nIndex >= 0 && nIndex <= 19 && GetIsObjectValid(oTarget))
    {
        nPlotBoolean = GetLocalBoolean(oTarget, nIndex);
        if(nPlotBoolean > 0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Set Boolean Plot Flag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the boolean state of a plot bit field
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////

void UT_SetPlotBooleanFlag(object oTarget, int nIndex, int nState)
{
    int nLevel = GetHitDice(GetFirstPC());
    if(nState == TRUE)
    {
        if(nIndex == SW_PLOT_COMPUTER_OPEN_DOORS ||
           nIndex == SW_PLOT_REPAIR_WEAPONS ||
           nIndex == SW_PLOT_REPAIR_TARGETING_COMPUTER ||
           nIndex == SW_PLOT_REPAIR_SHIELDS)
        {
            GiveXPToCreature(GetFirstPC(), nLevel * 15);
        }
        else if(nIndex == SW_PLOT_COMPUTER_USE_GAS || nIndex == SW_PLOT_REPAIR_ACTIVATE_PATROL_ROUTE || nIndex == SW_PLOT_COMPUTER_MODIFY_DROID)
        {
            GiveXPToCreature(GetFirstPC(), nLevel * 20);
        }
        else if(nIndex == SW_PLOT_COMPUTER_DEACTIVATE_TURRETS ||
                nIndex == SW_PLOT_COMPUTER_DEACTIVATE_DROIDS)
        {
            GiveXPToCreature(GetFirstPC(), nLevel * 10);
        }
    }
    if(nIndex >= 0 && nIndex <= 19 && GetIsObjectValid(oTarget))
    {
        if(nState == TRUE || nState == FALSE)
        {
            SetLocalBoolean(oTarget, nIndex, nState);
        }
    }
}

//::///////////////////////////////////////////////
//:: Get Talked To Flag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the state of the Talk to Flag
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////

int UT_GetTalkedToBooleanFlag(object oTarget)
{
    int nPlotFlag;
    if(GetIsObjectValid(oTarget))
    {
        nPlotFlag = GetLocalBoolean(oTarget, SW_PLOT_HAS_TALKED_TO);
        if(nPlotFlag > 0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Set Talked To Flag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the talked to flag to the given state.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////

void UT_SetTalkedToBooleanFlag(object oTarget, int nState = TRUE)
{
    if(GetIsObjectValid(oTarget))
    {
        if(nState == TRUE || nState == FALSE)
        {
            SetLocalBoolean(oTarget, SW_PLOT_HAS_TALKED_TO, nState);
        }
    }
}

//::///////////////////////////////////////////////
//:: UT_GetNearestPCToObject
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Get the nearest PC to the specified object
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
object UT_GetNearestPCToObject(object oTarget = OBJECT_SELF)
{
  return(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,oTarget));
}

//::///////////////////////////////////////////////
//:: UT_IsObjectPC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Determine if object is a PC
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 15, 2002
//:://////////////////////////////////////////////
int UT_IsObjectPC(object oTarget = OBJECT_INVALID)
{
  object oPC = GetFirstPC();

  while(oPC != OBJECT_INVALID)
  {
    if(oTarget == oPC)
    {
      return(TRUE);
    }
    oPC = GetNextPC();
  }

  return(FALSE);
}

//::///////////////////////////////////////////////
//:: Adjust Character Alignment
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make alignment change based on a constant
    passed in to the function
    nDarkSide = 1 then do a darkside hit.
    nScale is the size of the hit. -3 to +3

    //Alignment Adjustment Constants

    int SW_CONSTANT_DARK_HIT_HIGH = -6;
    int SW_CONSTANT_DARK_HIT_MEDIUM = -5;
    int SW_CONSTANT_DARK_HIT_LOW = -4;
    int SW_CONSTANT_LIGHT_HIT_LOW = -2;
    int SW_CONSTANT_LIGHT_HIT_MEDIUM = -1;
    int SW_CONSTANT_LIGHT_HIT_HIGH = 0;

                    1       2       3         4      5
                    VLight  Light   Neutral   Dark   VDark
      High Light    2       4       6         8      10
      Mid Light     1       2       4         6      8
      Low Light     1       1       2         4      6
      Low Dark      -6      -4      -2        -1     -1
      Mid Dark      -8      -6      -4        -2     -1
      High Dark     -10     -8      -6        -4     -2
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////
void UT_AdjustCharacterAlignment(object oTarget, int nScale)
{
    //Find out if the target is good or evil
    int nScore = GetGoodEvilValue(oTarget);
    int nAlignType;
    //Set the type of alignment hit to do.
    if(nScale == SW_CONSTANT_DARK_HIT_HIGH ||
       nScale == SW_CONSTANT_DARK_HIT_MEDIUM ||
       nScale == SW_CONSTANT_DARK_HIT_LOW)
    {
        nAlignType = ALIGNMENT_DARK_SIDE;
    }
    else
    {
        nAlignType = ALIGNMENT_LIGHT_SIDE;
    }

    int nHit;
    int nAlignCategory;

    //Set the alignment category which will determine the base from which to calculate the hit.
    if(nScore >= 85)//VERY GOOD
    {
        nAlignCategory = 1;
    }
    else if(nScore < 85 && nScore > 60)//GOOD
    {
        nAlignCategory = 2;
    }
    else if(nScore <= 60 && nScore >= 40)//NEUTRAL
    {
        nAlignCategory = 3;
    }
    else if(nScore < 40 && nScore >= 15)//EVIL
    {
        nAlignCategory = 4;
    }
    else //VERY EVIL
    {
        nAlignCategory = 5;
    }

    //Calculate the hit.
    nHit = (nAlignCategory + nScale) * 2;
    if(nHit < 0)
    {
        nHit = nHit * -1;
    }
    if(nHit == 0)
    {
        nHit = 1;
    }
    //Zero results that do not mathematically fit within the formula.
    if(nAlignCategory == 1 && nScale == SW_CONSTANT_LIGHT_HIT_LOW)
    {
        nHit = 1;
    }
    else if(nAlignCategory == 5 && nScale == SW_CONSTANT_DARK_HIT_LOW)
    {
        nHit = 1;
    }
    AurPostString("Hit = " + IntToString(nHit), 5, 5, 4.0);

    AdjustAlignment(oTarget, nAlignType, nHit);
}

//::///////////////////////////////////////////////
//:: UT_DarkHigh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//does a heavy darkside adjustment on the target
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
void UT_DarkHigh(object oTarget)
{
    UT_AdjustCharacterAlignment(oTarget, SW_CONSTANT_DARK_HIT_HIGH);
    //AdjustAlignment(oTarget,ALIGNMENT_DARK_SIDE,10);
}
//::///////////////////////////////////////////////
//:: UT_DarkMed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//does a medium darkside adjustment on the target
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
void UT_DarkMed(object oTarget)
{
  UT_AdjustCharacterAlignment(oTarget, SW_CONSTANT_DARK_HIT_MEDIUM);
  //AdjustAlignment(oTarget,ALIGNMENT_DARK_SIDE,5);
}
//::///////////////////////////////////////////////
//:: UT_DarkSml
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//does a small darkside adjustment on the target
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
void UT_DarkSml(object oTarget)
{
  UT_AdjustCharacterAlignment(oTarget, SW_CONSTANT_DARK_HIT_LOW);
  //AdjustAlignment(oTarget,ALIGNMENT_DARK_SIDE,1);
}
//::///////////////////////////////////////////////
//:: UT_LightHigh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//does a heavy lightside adjustment on the target
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
void UT_LightHigh(object oTarget)
{
  UT_AdjustCharacterAlignment(oTarget, SW_CONSTANT_LIGHT_HIT_HIGH);
  //AdjustAlignment(oTarget,ALIGNMENT_LIGHT_SIDE,10);
}
//::///////////////////////////////////////////////
//:: UT_LightMed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//does a medium lightside adjustment on the target
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
void UT_LightMed(object oTarget)
{
  UT_AdjustCharacterAlignment(oTarget, SW_CONSTANT_LIGHT_HIT_MEDIUM);
  //AdjustAlignment(oTarget,ALIGNMENT_LIGHT_SIDE,5);
}
//::///////////////////////////////////////////////
//:: UT_LightSml
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//does a small lightside adjustment on the target
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
void UT_LightSml(object oTarget)
{
  UT_AdjustCharacterAlignment(oTarget, SW_CONSTANT_LIGHT_HIT_LOW);
  //AdjustAlignment(oTarget,ALIGNMENT_LIGHT_SIDE,1);
}

//::///////////////////////////////////////////////
//:: Reset Plot Booleans
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through all of the plot bit fields and sets
    them to nState.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 15, 2002
//:://////////////////////////////////////////////

void UT_ResetPlotBooleanFlags(object oToChange, int nState)
{
    int nCnt;
    for(nCnt; nCnt <= 9; nCnt++)
    {
        if(nState == TRUE || nState == FALSE)
        {
            SetLocalBoolean(oToChange, nCnt, nState);
        }
    }
}

//::///////////////////////////////////////////////
//:: Check Manaan Medical State
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the manaan facilities have
    been destroyed.  Global = 4 returns true.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 19, 2002
//:://////////////////////////////////////////////

int UT_GetIsKoltoDestroyed()
{
    return GetGlobalNumber("MAN_PLANET_PLOT") == 4;
}

//::///////////////////////////////////////////////
//:: UT_PlotMovePath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//make object do an uninterruptible path move
//based on code done by Aidan (actually, pretty much a copy)
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: August 16, 2002
//:://////////////////////////////////////////////
void UT_PlotMovePath(string sWayPointTag,int nFirst, int nLast, int nRun = FALSE)
{

    int nInc = 1;
    object oWP;
    int nIdx;
    if(nFirst > nLast)
    {
        nInc = -1;
    }
    for(nIdx = nFirst - nInc; abs(nLast - nIdx) > 0 && abs(nLast - nIdx) <= abs((nLast - nFirst) + 1); nIdx = nIdx + nInc)
    {
        oWP = GetObjectByTag(sWayPointTag + IntToString(nIdx + nInc));
        if(GetIsObjectValid(oWP))
        {
            ActionForceMoveToObject(oWP,nRun);
        }
    }
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}

//::///////////////////////////////////////////////
//:: UT_PlotMoveObject
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//make object do an uninterruptible move to an object
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: August 16, 2002
//:://////////////////////////////////////////////
void UT_PlotMoveObject(object oTarget,int nRun = FALSE)
{
  ActionForceMoveToObject(oTarget,nRun);
  ActionDoCommand(SetCommandable(TRUE));
  SetCommandable(FALSE);
}

//::///////////////////////////////////////////////
//:: UT_PlotMoveLocation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//make object do an uninterruptible move to a location
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: August 16, 2002
//:://////////////////////////////////////////////
void UT_PlotMoveLocation(location lTarget,int nRun = FALSE)
{
  ActionForceMoveToLocation(lTarget,nRun);
  ActionDoCommand(SetCommandable(TRUE));
  SetCommandable(FALSE);
}

//::///////////////////////////////////////////////
//:: UT_SkillCheck
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//perform a skill check using a given DC
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: August 29, 2002
//:://////////////////////////////////////////////
int UT_SkillCheck(int iDC, int iSkill, object oTarget)
{
  if (GetSkillRank(iSkill, oTarget) + d20() >= iDC)
  {
    return TRUE;
  }
  return FALSE;
}

//::///////////////////////////////////////////////
//:: UT_IsDarkSidePower
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//test whether force power is dark side
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: Sept. 11, 2002
//:://////////////////////////////////////////////
int UT_IsDarkSidePower(int iSpellID)
{
  if(iSpellID == FORCE_POWER_AFFLICTION) return(TRUE);
  if(iSpellID == FORCE_POWER_CHOKE) return(TRUE);
  if(iSpellID == FORCE_POWER_DEATH_FIELD) return(TRUE);
  if(iSpellID == FORCE_POWER_DRAIN_LIFE) return(TRUE);
  if(iSpellID == FORCE_POWER_FEAR) return(TRUE);
  if(iSpellID == FORCE_POWER_FORCE_STORM) return(TRUE);
  if(iSpellID == FORCE_POWER_HORROR) return(TRUE);
  if(iSpellID == FORCE_POWER_INSANITY) return(TRUE);
  if(iSpellID == FORCE_POWER_KILL) return(TRUE);
  if(iSpellID == FORCE_POWER_LIGHTNING) return(TRUE);
  if(iSpellID == FORCE_POWER_PLAGUE) return(TRUE);
  if(iSpellID == FORCE_POWER_SHOCK) return(TRUE);
  if(iSpellID == FORCE_POWER_SLOW) return(TRUE);
  if(iSpellID == FORCE_POWER_WOUND) return(TRUE);
  if(iSpellID == FORCE_POWER_CRUSH_OPPOSITION_I) return(TRUE);
  if(iSpellID == FORCE_POWER_CRUSH_OPPOSITION_II) return(TRUE);
  if(iSpellID == FORCE_POWER_CRUSH_OPPOSITION_III) return(TRUE);
  if(iSpellID == FORCE_POWER_CRUSH_OPPOSITION_IV) return(TRUE);
  if(iSpellID == FORCE_POWER_CRUSH_OPPOSITION_V) return(TRUE);
  if(iSpellID == FORCE_POWER_CRUSH_OPPOSITION_VI) return(TRUE);
  if(iSpellID == FORCE_POWER_DRAIN_FORCE) return(TRUE);
  if(iSpellID == FORCE_POWER_IMPROVED_DRAIN_FORCE) return(TRUE);
  if(iSpellID == FORCE_POWER_MASTER_DRAIN_FORCE) return(TRUE);
  if(iSpellID == FORCE_POWER_FORCE_SCREAM) return(TRUE);
  if(iSpellID == FORCE_POWER_IMPROVED_FORCE_SCREAM) return(TRUE);
  if(iSpellID == FORCE_POWER_MASTER_FORCE_SCREAM) return(TRUE);
  if(iSpellID == FORCE_POWER_FURY) return(TRUE);
  if(iSpellID == FORCE_POWER_IMPROVED_FURY) return(TRUE);
  if(iSpellID == FORCE_POWER_MASTER_FURY) return(TRUE);
  if(iSpellID == FORCE_POWER_FORCE_CRUSH) return(TRUE);

  return(FALSE);
}

//::///////////////////////////////////////////////
//:: UT_CreateObject
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create an object without needing a variable
    to pass it into.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept. 21, 2002
//:://////////////////////////////////////////////
void UT_CreateObject(int nObjectType, string sTemplate, location lLocal)
{
    object oCreate = CreateObject(nObjectType, sTemplate, lLocal);
}

//::///////////////////////////////////////////////
//:: UT_JumpPartyToObject
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Move the entire party to the object specified.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: Sept. 24, 2002
//:://////////////////////////////////////////////
void UT_JumpPartyToObject(object oTarget)
{
    UT_RestorePartyToOneHealth();
    object oMember1 = GetPartyMemberByIndex(0);
    object oMember2 = GetPartyMemberByIndex(1);
    object oMember3 = GetPartyMemberByIndex(2);

    if (GetIsObjectValid(oMember1) == TRUE)
    {
        AssignCommand(oMember1, ClearAllActions());
        AssignCommand(oMember1, JumpToObject(oTarget));
    }
    if (GetIsObjectValid(oMember2) == TRUE)
    {
        AssignCommand(oMember2, ClearAllActions());
        AssignCommand(oMember2, JumpToObject(oTarget));
    }
    if (GetIsObjectValid(oMember2) == TRUE)
    {
        AssignCommand(oMember3, ClearAllActions());
        AssignCommand(oMember3, JumpToObject(oTarget));
    }
}

//::///////////////////////////////////////////////
//:: UT_JumpPartyToLocation
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Move the entire party to the location specified.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: Sept. 24, 2002
//:://////////////////////////////////////////////
void UT_JumpPartyToLocation(location lTarget)
{
    object oMember1 = GetPartyMemberByIndex(0);
    object oMember2 = GetPartyMemberByIndex(1);
    object oMember3 = GetPartyMemberByIndex(2);
    UT_RestorePartyToOneHealth();
    if (GetIsObjectValid(oMember1) == TRUE)
    {
        AssignCommand(oMember1, ClearAllActions());
        AssignCommand(oMember1, JumpToLocation(lTarget));
    }
    if (GetIsObjectValid(oMember2) == TRUE)
    {
        AssignCommand(oMember2, ClearAllActions());
        AssignCommand(oMember2, JumpToLocation(lTarget));
    }
    if (GetIsObjectValid(oMember2) == TRUE)
    {
        AssignCommand(oMember3, ClearAllActions());
        AssignCommand(oMember3, JumpToLocation(lTarget));
    }
}

//::///////////////////////////////////////////////
//:: Spawn Messenger
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines which messenger to spawn in for a specific planet.
    Uses the waypoint K_MESSENGER_SPAWN to determine where to place an incoming messenger

    Carth: KOR_DANEL == 1. Messenger = Jordo.
    Bastila: K_SWG_HELENA == 1. Messenger = Malare.
    Mission: Mis_MissionTalk == 5  Messenger = Lena
    Canderous: G_CAND_STATE == 8, G_CAND_PLOT == 0, K_CURRENT_PLANET != 35.  Messenger = Jagi
    Juhani: G_JUHANIH_STATE == 7, G_JUHANI_PLOT == 0. Messenger = Xor

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
//:: Created On: Sept 26, 2002
//:://////////////////////////////////////////////

void UT_SpawnMessenger()
{
/*
    object oPC = GetFirstPC();
    object oWay = GetWaypointByTag("K_MESSENGER_SPAWN");
    object oNPC;
    int nGlobal_1, nGlobal_2;
    location lLocal;
    int bConditional = FALSE;
    int nXor = GetGlobalNumber("K_XOR_AMBUSH");

    //Do not fire any messenger plots on Kashyyyk if Chuundar is dead
    if(GetGlobalNumber("K_CURRENT_PLANET") == 20)
    {
        bConditional = GetGlobalBoolean("kas_ChuundarDead");
    }
    if(bConditional == FALSE)
    {
        if(nXor == 0 || nXor > 2)
        {
            if(GetIsObjectValid(oWay))
            {
                lLocal = GetLocation(oWay);
                //MODIFIED by Preston Watamaniuk on April 11
                //Added the exchange crony Ziagrom to tell the PC about the special store.
                if(GetGlobalNumber("K_KOTOR_MASTER") >= 20 &&
                   GetGlobalNumber("K_Exchange_Store") == 0 &&
                   GetGlobalBoolean("K_MESS_ZIAGROM") == FALSE)
                {
                    SetGlobalBoolean("K_MESS_ZIAGROM", TRUE);
                    oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_Ziagrom", lLocal);
                    NoClicksFor(2.2);
                    DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                    return;
                }
                if(IsNPCPartyMember(NPC_BASTILA) &&
                   GetGlobalBoolean("K_MESS_BASTILA") == FALSE &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 25 &&
                   GetGlobalNumber("K_SWG_HELENA") == 1)
                {
                        SetGlobalBoolean("K_MESSENGER_AVAILABLE", FALSE);
                        SetGlobalBoolean("K_MESS_BASTILA", TRUE);
                        oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_malare", lLocal);
                        NoClicksFor(2.2);
                        DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                        //DelayCommand(2.0, UT_NPC_InitConversation(GetTag(oNPC)));
                        return;
                }
                if(IsNPCPartyMember(NPC_CARTH) &&
                   //MODIFIED by Preston Watamaniuk on May 13, 2003
                   //Added a check to make sure the Sith Acadamy is not closed before spawning in Jordo.
                   GetGlobalBoolean("KOR_END_HOSTILE") == FALSE &&
                   GetGlobalBoolean("K_MESS_CARTH") == FALSE &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 30 &&
                   GetGlobalNumber("KOR_DANEL") == 1)
                {
                        SetGlobalBoolean("K_MESSENGER_AVAILABLE", FALSE);
                        SetGlobalBoolean("K_MESS_CARTH", TRUE);
                        oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_jordo", lLocal);
                        NoClicksFor(2.2);
                        DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                        //DelayCommand(2.0, UT_NPC_InitConversation(GetTag(oNPC)));
                        return;
                }
                if(IsNPCPartyMember(NPC_JOLEE) &&
                   GetGlobalBoolean("K_MESS_JOLEE") == FALSE &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 25 &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 20 &&
                   GetGlobalNumber("MAN_MURDER_PLOT") == 0)
                {
                        SetGlobalBoolean("K_MESSENGER_AVAILABLE", FALSE);
                        SetGlobalBoolean("K_MESS_JOLEE", TRUE);
                        oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_davink", lLocal);
                        NoClicksFor(2.2);
                        DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                        //DelayCommand(2.0, UT_NPC_InitConversation(GetTag(oNPC)));
                        return;
                }
                if(IsNPCPartyMember(NPC_JUHANI) &&
                   GetGlobalBoolean("K_MESS_JUHANI") == FALSE &&
                   (GetGlobalNumber("G_JUHANIH_STATE") > 5 && GetGlobalNumber("G_JUHANIP_STATE") < 10) &&
                   GetGlobalNumber("G_JUHANI_PLOT") == 0 &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 15)
                {
                        //juhanih_state > 5, and juhanip_state < 10
                        SetGlobalBoolean("K_MESSENGER_AVAILABLE", FALSE);
                        SetGlobalBoolean("K_MESS_JUHANI", TRUE);
                        oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_xor", lLocal);
                        NoClicksFor(2.2);
                        DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                        //DelayCommand(2.0, UT_NPC_InitConversation(GetTag(oNPC)));
                        return;
                }
                if(IsNPCPartyMember(NPC_CANDEROUS) &&
                   GetGlobalBoolean("K_MESS_CANDEROUS") == FALSE &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 35 &&
                   GetGlobalNumber("G_CAND_STATE") >= 6 &&
                   GetGlobalBoolean("G_CAND_THING") == TRUE &&
                   GetGlobalNumber("G_CAND_PLOT") == 0)
                {
                        SetGlobalBoolean("K_MESSENGER_AVAILABLE", FALSE);
                        SetGlobalBoolean("K_MESS_CANDEROUS", TRUE);
                        oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_jagi", lLocal);
                        NoClicksFor(2.2);
                        DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                        //DelayCommand(2.0, UT_NPC_InitConversation(GetTag(oNPC)));
                        return;
                }
                if(IsNPCPartyMember(NPC_MISSION) &&
                   GetGlobalBoolean("K_MESS_MISSION") == FALSE &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 35 &&
                   GetGlobalNumber("K_CURRENT_PLANET") != 25 &&
                   GetGlobalNumber("Mis_MissionTalk") == 5)
                {
                        SetGlobalBoolean("K_MESSENGER_AVAILABLE", FALSE);
                        SetGlobalBoolean("K_MESS_MISSION", TRUE);
                        oNPC = CreateObject(OBJECT_TYPE_CREATURE, "g_lena", lLocal);
                        NoClicksFor(2.2);
                        DelayCommand(2.0,  AssignCommand(oNPC, ActionStartConversation(oPC,"",FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
                        //DelayCommand(2.0, UT_NPC_InitConversation(GetTag(oNPC)));
                        return;
                }
            }
        }
    }
*/
}

//::///////////////////////////////////////////////
//:: Exit Area
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The NPC moves to an SW_EXIT waypoint and destroys
    itself.
*/
//:://////////////////////////////////////////////
//:: Created By:  Preston Watamaniuk
//:: Created On:  Sept 27, 2002
//:: Modified By: Ferret Baudoin, Adam Brennecke
//:: Modified On: 3/11/04, 6/28/04
//:://////////////////////////////////////////////
void UT_ExitArea(int nRun = FALSE, int nParam = 0, object oObj = OBJECT_SELF)
{

    object oExit;

    // if P1 = 0, then just go to SW_EXIT
    if ( nParam == 0 )
    {
        oExit = GetWaypointByTag("SW_EXIT");
    }
    else oExit = GetWaypointByTag("SW_EXIT" + IntToString(nParam));

    if ( oObj != OBJECT_SELF )
    {
        AssignCommand( oObj, ActionForceMoveToObject(oExit, nRun));
        AssignCommand( oObj, ActionDoCommand(SetCommandable(TRUE)));
        AssignCommand( oObj, ActionDoCommand(DestroyObject(oObj))); // JAB-OEI 6/28/04
        AssignCommand( oObj, SetCommandable(FALSE) );
    }
    else
    {
        ActionForceMoveToObject(oExit, nRun);
        ActionDoCommand(SetCommandable(TRUE));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
}

//::///////////////////////////////////////////////
//:: UT_GetNumItems
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Counts the number of items with the given tag
    in the party inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 15, 2002
//:://////////////////////////////////////////////
int UT_GetNumItems(object oTarget, string sItemTag)
{
    int nCount = 0;
    object oItem = GetFirstItemInInventory(oTarget);

    while (GetIsObjectValid(oItem) == TRUE)
    {
        if (GetTag(oItem) == sItemTag)
        {
            nCount = nCount + 1;
        }

        oItem = GetNextItemInInventory(oTarget);
    }

    return nCount;
}

//::///////////////////////////////////////////////
//:: Determines Item Cost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a value for how many parts or spikes
    a given dialogue option will cost.  The costs
    are as follows:
    Computer Use
    1.  Open all doors in area (cost: 3 spikes). The player can open all doors on the level.
    2.  Open all containers in area (cost: 3 spikes). The player can open all containers on the level.
    3.  Fill security room with gas (cost: 5 spikes).
    4.  Turn off all gun turrets (cost: 8 spikes).
    5.  Modify droid programming; target everything (cost: 10 spikes).
    6.  Deactivate all droids in area (cost: 8 spikes).

    Repair Use
    1.  Activate droid. Hostile to Sith faction. (cost: 3 repair unit)
    2.  Activate droid. Hostile to Sith faction. Enter patrol route. (cost: 5 repair unit)
    3.  Activate droid. Hostile to Sith faction. Hunter Killer mode. (cost: 7 repair unit)
    4.  Activate droid. Hostile to Sith faction. Follow mode. (cost: 5 repair unit)
*/
//:://////////////////////////////////////////////
//:: Created By: PReston Watamaniuk
//:: Created On: Nov 19, 2002
//:://////////////////////////////////////////////

int UT_DeterminesItemCost(int nDC, int nSkill)
{
        //AurPostString("DC " + IntToString(nDC), 5, 5, 3.0);
    float fModSkill =  IntToFloat(GetSkillRank(nSkill, GetPartyMemberByIndex(0)));
        //AurPostString("Skill Total " + IntToString(GetSkillRank(nSkill, GetPartyMemberByIndex(0))), 5, 6, 3.0);
    int nUse;
    fModSkill = fModSkill/4.0;
    nUse = nDC - FloatToInt(fModSkill);
        //AurPostString("nUse Raw " + IntToString(nUse), 5, 7, 3.0);
    if(nUse < 1)
    {
        //MODIFIED by Preston Watamaniuk, March 19
        //Put in a check so that those PC with a very high skill
        //could have a cost of 0 for doing computer work
        if(nUse <= -3)
        {
            nUse = 0;
        }
        else
        {
            nUse = 1;
        }
    }
        //AurPostString("nUse Final " + IntToString(nUse), 5, 8, 3.0);
    return nUse;
}

//::///////////////////////////////////////////////
//:: Remove X number of Computer Spikes
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove a number of computer spikes
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 19, 2002
//:://////////////////////////////////////////////
void UT_RemoveComputerSpikes(int nNumber)
{
    object oItem = GetItemPossessedBy(GetFirstPC(), "K_COMPUTER_SPIKE");
    if(GetIsObjectValid(oItem))
    {
        int nStackSize = GetItemStackSize(oItem);
        if(nNumber < nStackSize)
        {
            nNumber = nStackSize - nNumber;
            SetItemStackSize(oItem, nNumber);
        }
        else if(nNumber > nStackSize || nNumber == nStackSize)
        {
            DestroyObject(oItem);
        }
    }
}

//::///////////////////////////////////////////////
//:: Remove X number of Repair Parts
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove a number of repair parts
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 19, 2002
//:://////////////////////////////////////////////
void UT_RemoveRepairParts(int nNumber)
{
    object oItem = GetItemPossessedBy(GetFirstPC(), "K_REPAIR_PART");
    if(GetIsObjectValid(oItem))
    {
        int nStackSize = GetItemStackSize(oItem);
        if(nNumber < nStackSize)
        {
            nNumber = nStackSize - nNumber;
            SetItemStackSize(oItem, nNumber);
        }
        else if(nNumber > nStackSize || nNumber == nStackSize)
        {
            DestroyObject(oItem);
        }
    }
}

//::///////////////////////////////////////////////
//:: Return item amount
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Depending on the skill chosen, returns the
    number items relating to that skill
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 19, 2002
//:://////////////////////////////////////////////

int UT_ReturnSpikePartAmount(int nSkill)
{
    string sItem;
    int nCount = 0;
    if(nSkill == SKILL_COMPUTER_USE)
    {
        sItem = "K_COMPUTER_SPIKE";
    }
    else if(nSkill == SKILL_REPAIR)
    {
        sItem = "K_REPAIR_PART";
    }
    object oItem = GetItemPossessedBy(GetFirstPC(), sItem);
    if(GetIsObjectValid(oItem))
    {
        nCount = GetNumStackedItems(oItem);
    }
    return nCount;
}

//::///////////////////////////////////////////////
//:: Make Neutral
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all object with
    the specified tag to the neutral faction
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 20, 2002
//:://////////////////////////////////////////////
void UT_MakeNeutral(string sTag)
{
    // BMA-OEI 8/25/2004 - Old code tried to stun all sObjectTag?
    // Duplicate of UT_MakeNeutral2()?
    int nInstance = 1;
    object oObject = GetObjectByTag(sTag, nInstance);

    while (GetIsObjectValid(oObject))
    {
        ChangeToStandardFaction(oObject, STANDARD_FACTION_NEUTRAL);
        nInstance++;
        oObject = GetObjectByTag(sTag, nInstance);
    }
}

//::///////////////////////////////////////////////
//:: Make Insane
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all objects with
    the specified tag to the insane faction
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 20, 2002
//:://////////////////////////////////////////////
void UT_MakeInsane(string sObjectTag)
{
    int nCount = 1;
    object oDroid = GetNearestObjectByTag(sObjectTag);
    while(GetIsObjectValid(oDroid))
    {
        ChangeToStandardFaction(oDroid, STANDARD_FACTION_INSANE);
        UT_StartCombat(oDroid);

        nCount++;
        oDroid = GetNearestObjectByTag(sObjectTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: Stun Droids
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all objects with
    the specified tag to the insane faction
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 20, 2002
//:://////////////////////////////////////////////
void UT_StunDroids(string sObjectTag)
{
    effect eStun = EffectDroidStun();
    int nCount = 1;
    object oDroid = GetNearestObjectByTag(sObjectTag);
    while(GetIsObjectValid(oDroid))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStun, oDroid);
        nCount++;
        oDroid = GetNearestObjectByTag(sObjectTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: Start a Fight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the nearest enemy that is seen and start combat
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 21, 2002
//:://////////////////////////////////////////////
void UT_StartCombat(object oObject)
{
    AssignCommand(oObject, ActionAttack(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oObject, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)));
}

//::///////////////////////////////////////////////
//:: Gas a Rooom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Releases gas into the room and kills all biologicals in the
    specified radius.  The radius should be between 2 - 5m
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 21, 2002
//:://////////////////////////////////////////////
void UT_GasRoom(string sWayTag, float fDistance, int bIndiscriminant = TRUE)
{
    object oWay = GetWaypointByTag(sWayTag);
    object oPC = GetFirstPC();
    if(GetIsObjectValid(oWay))
    {
        effect eVFX = EffectVisualEffect(3006);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oWay));
        object oTarget = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN, oWay, 1);
        int nCount = 1;
        while(GetIsObjectValid(oTarget) && GetDistanceBetween(oTarget, oWay) <= fDistance)
        {
            float fDelay = 3.0 + (IntToFloat(d10())/10.0);
            float fDelay2 = fDelay + 1.0 + (IntToFloat(d20())/10.0);

            if((GetIsFriend(oTarget, oPC) || GetIsNeutral(oTarget, oPC)) && bIndiscriminant == FALSE)
            {
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectChoke(), oTarget, 3.0));
                DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPoison(POISON_ABILITY_SCORE_VIRULENT),oTarget));
            }
            else if(GetIsEnemy(oTarget, oPC) || bIndiscriminant == TRUE)
            {
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectChoke(), oTarget, 10.0));
                DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget));
            }
            nCount++;
            oTarget = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN, oWay, nCount);
        }
    }
}

//::///////////////////////////////////////////////
//:: Overload Conduit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Overloads a power conduit and does 10d6 damage
    to all within the specified radius
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 21, 2002
//:://////////////////////////////////////////////

void UT_OverloadConduit(string sObjectTag, float fDistance, int bIndiscriminant = TRUE)
{
    object oWay = GetObjectByTag(sObjectTag);
    if(GetIsObjectValid(oWay))
    {
        effect eFNF = EffectVisualEffect(VFX_FNF_GRENADE_ION);
        effect eVFXHit = EffectVisualEffect(1021);
        effect eVFXBeam = EffectBeam(VFX_BEAM_LIGHTNING_DARK_L, oWay, BODY_NODE_CHEST);
        effect eDam;

        object oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oWay, 1);
        int nCount = 1;
        int nDam = 1000;
        float fDelay = 0.3;

        AssignCommand(oWay, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));

        DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFNF, GetLocation(oWay)));
        while(GetIsObjectValid(oTarget) && GetDistanceBetween(oTarget, oWay) <= fDistance)
        {
            if(bIndiscriminant == TRUE || GetIsEnemy(oTarget, GetFirstPC()))
            {
                eDam = EffectDamage(nDam, DAMAGE_TYPE_ELECTRICAL);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFXBeam, oTarget, 1.0));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXHit, oTarget, 1.0));
                fDelay = fDelay + 0.17;
            }
            nCount++;
            oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oWay, nCount);
        }
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_PRO_DROID_KILL), oWay);

    }
}

///////////////////////////////////////////////////////////////////////////////
/*
    UT_ReturnToBase
    This function is used in the user defined event of a creature crossing a
    trigger used to pen in hostile creatures. When a creature crosses the
    trigger, it's actions are cleared, it is sent to the homebase waypoint and
    it is set non commanble. Once reaching its destination, it becomes
    commandable again. By defaut the standard tag for the waypoint is given, but
    a different one may be specified

    Created by Aidan Scanlan
    On Dec 2, 2002
*/
///////////////////////////////////////////////////////////////////////////////
void UT_ReturnToBase(string sTag = "wp_homebase")
{
    object oSelf = OBJECT_SELF;
    if(GetCommandable(oSelf))
    {
        ClearAllActions();
        CancelCombat(oSelf);
        ActionMoveToObject(GetNearestObjectByTag("wp_homebase"),TRUE,3.0f);
        ActionDoCommand( SetCommandable(TRUE,oSelf));
        SetCommandable(FALSE);
    }
}

//::///////////////////////////////////////////////
//:: UT_NPC_InitConversation
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The specified NPC will start a conversation
    with the player.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 2, 2002
//:://////////////////////////////////////////////
void UT_NPC_InitConversation(string sNPCTag,string sDlg = "",object oEntered = OBJECT_INVALID)
{
    object oNPC = GetObjectByTag(sNPCTag);
    object oPC = GetFirstPC();
    UT_RestorePartyToOneHealth();
    // The NPC must exist.
    if (GetIsObjectValid(oNPC) == TRUE)
    {
        if (oPC == GetPartyMemberByIndex(0))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oNPC, ClearAllActions());
            CancelCombat(oPC);
            AssignCommand(oNPC, ActionStartConversation(oPC, sDlg, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
        }
        else
        {
            // Fade to black, switch player control to the main character,
            // move the player to the NPC and start conversation.

            SetGlobalFadeOut();
            SetPartyLeader(NPC_PLAYER);

            object oParty1 = GetPartyMemberByIndex(1);
            object oParty2 = GetPartyMemberByIndex(2);

            //P.W. (June 7) - Put this in to terminate any player input during the fade.
            NoClicksFor(0.7);
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oNPC, ClearAllActions());
            CancelCombat(oPC);
            if (GetIsObjectValid(oEntered) == TRUE)
            {
                AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oEntered)));
                AssignCommand(oPC, DelayCommand(0.4, SetFacingPoint(GetPosition(oNPC))));
            }
            else
            {
                AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oNPC)));
            }
            AssignCommand(oParty1, DelayCommand(0.5, JumpToObject(oPC)));
            AssignCommand(oParty2, DelayCommand(0.5, JumpToObject(oPC)));
            AssignCommand(oNPC, ActionDoCommand(SetGlobalFadeIn(0.5, 2.0)));
            AssignCommand(oNPC, ActionStartConversation(oPC, sDlg, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
        }
    }
}

//::///////////////////////////////////////////////
//:: Set Starmap Journal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the Journal entry for the starmap
    automatically.

    Korriban - entry 10
    Tatooine - entry 20
    Kashyyyk - entry 30
    Manaan   - entry 40
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamanmiuk
//:: Created On: Dec 17, 2002
//:://////////////////////////////////////////////

void UT_SetStarmapJournal()
{
    string sModule = GetModuleFileName();
    if(sModule == "manm28ad") //Manaan
    {
        SetGlobalBoolean("K_STAR_MAP_MANAAN", TRUE);
        AddJournalQuestEntry("k_starforge", 40, TRUE);
    }
    else if(sModule == "korr_m39aa") //Korriban
    {
        SetGlobalBoolean("K_STAR_MAP_KORRIBAN", TRUE);
        AddJournalQuestEntry("k_starforge", 10, TRUE);
    }
    else if(sModule == "Kas_m25aa") //Kashyyyk
    {
        SetGlobalBoolean("K_STAR_MAP_KASHYYYK", TRUE);
        AddJournalQuestEntry("k_starforge", 30, TRUE);
    }
    else if(sModule == "Tat_m18ac") //Tatooine
    {
        SetGlobalBoolean("K_STAR_MAP_TATOOINE", TRUE);
        AddJournalQuestEntry("k_starforge", 20, TRUE);
    }
    if(GetGlobalNumber("K_STAR_MAP") == 50)
    {
        AddJournalQuestEntry("k_starforge", 50, TRUE);
    }
}

//::///////////////////////////////////////////////
//:: Spawn Creatures
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates number of creatures with a specific template at a specified waypoint tag.
    Total is the number times the loop will run.
    fTimeDelay is the number seconds between iterations.
    nSpawnIncrement is the number of templates spawned in per iteration.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamanmiuk
//:: Created On: Dec 17, 2002
//:://////////////////////////////////////////////
void UT_RunCombatEncounter(string sTemplate, string sTag, int nTotal = 3, float fTimeDelay = 1.5, int nSpawnIncrement = 1)
{
    if(fTimeDelay < 1.5)
    {
       fTimeDelay = 1.5;
    }
    object oWay = GetWaypointByTag(sTag);
    object oCreate;
    if(GetIsObjectValid(oWay))
    {
        int nCount = nSpawnIncrement;
        for(nCount; nCount != 0; nCount--)
        {
            oCreate = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, GetLocation(oWay));
        }
        nTotal--;
        if(nTotal > 0)
        {
            DelayCommand(fTimeDelay, UT_RunCombatEncounter(sTemplate, sTag, nTotal, fTimeDelay, nSpawnIncrement));
        }
        fTimeDelay += fTimeDelay;
    }
}

//::///////////////////////////////////////////////
//:: Set Talk To Flag by Tag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Loops through all object with a certain tag
    and sets their Talk To Flag to TRUE.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamanmiuk
//:: Created On: Dec 17, 2002
//:://////////////////////////////////////////////
void UT_SetTalkToFlagByTag(string sTag)
{
    int nCnt = 1;
    object oTrigger = GetNearestObjectByTag(sTag, GetFirstPC(), nCnt);
    while(GetIsObjectValid(oTrigger))
    {
        SetLocalBoolean(oTrigger, SW_PLOT_HAS_TALKED_TO, TRUE);
        nCnt++;
        oTrigger = GetNearestObjectByTag(sTag, GetFirstPC(), nCnt);
    }
}

//::///////////////////////////////////////////////
//:: Lock / Plot Twin Doors
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Loops through all doors with a certain tag
    and closes, locks and plots them.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamanmiuk
//:: Created On: Dec 17, 2002
//:://////////////////////////////////////////////
void UT_LockDoorDuplicates(string sTag)
{
    int nCount;
    object oDoor = GetNearestObjectByTag(sTag);
    while(GetIsObjectValid(oDoor) && GetObjectType(oDoor) == OBJECT_TYPE_DOOR)
    {
        if(oDoor != OBJECT_SELF)
        {
            AssignCommand(oDoor, ActionCloseDoor(oDoor));
            AssignCommand(oDoor, ActionLockObject(oDoor));
            AssignCommand(oDoor, SetPlotFlag(oDoor, TRUE));
        }
        nCount++;
        oDoor = GetNearestObjectByTag(sTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: Can Party Member Interject
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the Party member specified is
    in the party and within the distance given.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 10, 2003
//:://////////////////////////////////////////////

int UT_CheckCanPartyMemberInterject(int nNPC_Constant, float fDistance)
{
/*
    object oParty;

    if(IsNPCPartyMember(nNPC_Constant))
    {
        //MODIFIED by Preston Watamaniuk on April 24, 2003
        //Put this in so that NPCs who you turn down on a planet will not reinitiate on that planet again.
        int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
        string sConstant = "NPC_INIT_PLANET_";
        sConstant = "NPC_INIT_PLANET_" + IntToString(nNPC_Constant);
        int nConstant = GetGlobalNumber(sConstant);

        if(nNPC_Constant == NPC_BASTILA)
        {
            oParty = GetObjectByTag("Bastila");
        }
        else if(nNPC_Constant == NPC_CANDEROUS)
        {
            oParty = GetObjectByTag("Cand");
        }
        else if(nNPC_Constant == NPC_CARTH)
        {
            oParty = GetObjectByTag("Carth");
        }
        else if(nNPC_Constant == NPC_HK_47)
        {
            oParty = GetObjectByTag("HK47");
        }
        else if(nNPC_Constant == NPC_JOLEE)
        {
            oParty = GetObjectByTag("Jolee");
        }
        else if(nNPC_Constant == NPC_JUHANI)
        {
            oParty = GetObjectByTag("Juhani");
        }
        else if(nNPC_Constant == NPC_MISSION)
        {
            oParty = GetObjectByTag("Mission");
        }
        else if(nNPC_Constant == NPC_T3_M4)
        {
            oParty = GetObjectByTag("T3M4");
        }
        else if(nNPC_Constant == NPC_ZAALBAR)
        {
            oParty = GetObjectByTag("Zaalbar");
        }
        if(GetIsObjectValid(oParty) &&
           GetDistanceBetween(oParty, GetFirstPC()) <= fDistance &&
           nPlanet != nConstant)
        {
            return TRUE;
        }
    }
*/
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Reinitialize NPC Planet Constants
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This resets the variables for each party member
    that controls whether they will init on a
    particular planet.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 24, 2003
//:://////////////////////////////////////////////
void UT_ReinitializePartyPlanetVariables()
{
    string sConstant = "NPC_INIT_PLANET_";
    int nCnt = 0;

    for(nCnt; nCnt <= 8; nCnt++)
    {
        sConstant = "NPC_INIT_PLANET_" + IntToString(nCnt);
        SetGlobalNumber(sConstant, 0);
    }
}

//teleport party member
void UT_TeleportPartyMember(object oPartyMember, location lDest)
{

  if(!GetIsObjectValid(oPartyMember))
  {
    return;
  }
  if(GetCurrentHitPoints(oPartyMember) < 1)
  {
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPartyMember);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(1),oPartyMember);
  }
  SetCommandable(TRUE,oPartyMember);
  AssignCommand(oPartyMember,ClearAllActions());
  AssignCommand(oPartyMember,ActionJumpToLocation(lDest));
}

//Returns true if oTarget is the object of interest of an attacker
int UT_GetUnderAttack(object oTarget)
{
  if(!GetIsObjectValid(oTarget))
  {
    return(FALSE);
  }

  object oAttacker = GetLastHostileActor(oTarget);
  return(GetIsObjectValid(oAttacker) || !GetIsDead(oAttacker) || GetObjectSeen(oAttacker, oTarget));
}

//:://////////////////////////////////////////////
/*
     This include handles jumping the party to the
     specified locations, good for controlling
     positions at the start of a cutscene.

     They will also be faced in the direction of
     the waypoints or objects they are being
     jumped to.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 23, 2003
//:://////////////////////////////////////////////
void UT_TeleportWholeParty(object oWP0, object oWP1, object oWP2)
{
   // The member the PC is in control of.
   object oMember0 = GetPartyMemberByIndex(0);
   // The second party member.
   object oMember1 = GetPartyMemberByIndex(1);
   // The third member.
   object oMember2 = GetPartyMemberByIndex(2);
   UT_RestorePartyToOneHealth();
   if(GetIsObjectValid(oMember0)) {
      UT_TeleportPartyMember(oMember0, GetLocation(oWP0));
      AssignCommand(oMember0, SetFacing(GetFacing(oWP0)));
   }
   if(GetIsObjectValid(oMember1)) {
      UT_TeleportPartyMember(oMember1, GetLocation(oWP1));
      DelayCommand(0.3, AssignCommand(oMember1, SetFacing(GetFacing(oWP1))));
   }
   if(GetIsObjectValid(oMember2)) {
      UT_TeleportPartyMember(oMember2, GetLocation(oWP2));
      DelayCommand(0.3, AssignCommand(oMember2, SetFacing(GetFacing(oWP2))));
   }
}

//::///////////////////////////////////////////////
//:: Action Pause Converation
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will stop and start a conversation in 1
     step. Just pass the length of the pause.

     Be sure your commands will get carried out
     in the specified time and that the "pauser"
     is not killed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 23, 2003
//:://////////////////////////////////////////////
void UT_ActionPauseConversation(float fDelay)
{
   ActionPauseConversation();
   DelayCommand(fDelay, ActionResumeConversation());
}

//::///////////////////////////////////////////////
//:: Spawn Available NPC
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Allows the uses to delay command on the creation
    of an NPC.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2003
//:://////////////////////////////////////////////

void UT_SpawnAvailableNPC(int nNPC, location lWay)
{
    object oNPC = SpawnAvailableNPC(nNPC, lWay);
}

//::///////////////////////////////////////////////
//:: Set Starmap Variables
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Advances K_STAR_MAP, sets the journal and
    sets the talk to flag.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2003
//:://////////////////////////////////////////////

void UT_StarMap1VariableSet()
{
    int nStar = GetGlobalNumber("K_STAR_MAP");
    int nBast = GetGlobalNumber("K_SWG_BASTILA");
    int nBool = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);

    if(nBool == FALSE)
    {
        //REMOVE THIS BEFORE SHIP
        AurPostString("v3.0 - K_STAR_MAP Before = " + IntToString(nStar), 5, 5, 5.0);

        nStar = nStar + 10;
        SetGlobalNumber("K_STAR_MAP",nStar);

        //REMOVE THIS BEFORE SHIP
        AurPostString("K_STAR_MAP After = " + IntToString(nStar), 5, 7, 5.0);

        if(nStar == 30)
        {
            if(nBast < 3)
            {
                SetGlobalNumber("K_SWG_BASTILA", 99);
            }
        }
        else if(nStar == 40)
        {
            //The player should now be captured by the Leviathan
            SetGlobalNumber("K_CAPTURED_LEV", 5);
            if(nBast < 5)
            {
                SetGlobalNumber("K_SWG_BASTILA", 99);
            }
        }
        else if(nStar == 50)
        {
            //The player should now have access to the unknown world.
            SetGlobalNumber("K_KOTOR_MASTER", 30);
        }
        SetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
        UT_SetStarmapJournal();
        AurPostString("Manaan Starmap = " + IntToString(GetGlobalBoolean("K_STAR_MAP_MANAAN")), 5, 9, 4.0);
        AurPostString("Kashyyyk Starmap = " + IntToString(GetGlobalBoolean("K_STAR_MAP_KASHYYYK")), 5, 11, 4.0);
        AurPostString("Korriban Starmap = " + IntToString(GetGlobalBoolean("K_STAR_MAP_KORRIBAN")), 5, 13, 4.0);
        AurPostString("Tatooine Starmap = " + IntToString(GetGlobalBoolean("K_STAR_MAP_TATOOINE")), 5, 15, 4.0);
    }
}

//::///////////////////////////////////////////////
//:: Play Starmap Animations
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Plays the animations necessary for the current
    state of the starmap variable
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2003
//:://////////////////////////////////////////////
void UT_StarMap2PlayAnimation()
{
    int nStar = GetGlobalNumber("K_STAR_MAP");
    int nBool = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);
    float fDelay = 30.0;
    if(nBool == FALSE)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        ActionPlayAnimation(UT_StarMap3GetLoopAnim(nStar));
        if(nStar == 40)//This variable is the pre-activation value.  It is going from 40 to 50
        {
            fDelay = 60.0;
        }
        DelayCommand(fDelay, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
    }
}

//::///////////////////////////////////////////////
//:: Returns the Appropriate Starmap Anim Loop
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the appropriate animation loop for the
    Star Map based on the value used before the
    new variable is set.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2003
//:://////////////////////////////////////////////
int UT_StarMap3GetLoopAnim(int nStarMapVar)
{
    if(nStarMapVar == 0)
    {
        return ANIMATION_PLACEABLE_ANIMLOOP01;
    }
    else if(nStarMapVar == 10)
    {
        return ANIMATION_PLACEABLE_ANIMLOOP02;
    }
    else if(nStarMapVar == 20)
    {
        return ANIMATION_PLACEABLE_ANIMLOOP03;
    }
    else if(nStarMapVar == 30)
    {
        return ANIMATION_PLACEABLE_ANIMLOOP04;
    }
    else if(nStarMapVar == 40)
    {
        return ANIMATION_PLACEABLE_ANIMLOOP06;
    }

    return -1;
}

//::///////////////////////////////////////////////
//:: Generic Starmap Handler
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Runs the entire Starmap sequence as a black
    box with no extra scripting required.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 19, 2003
//:://////////////////////////////////////////////
void UT_StarMap4RunStarMap()
{
    UT_StarMap2PlayAnimation();
    UT_StarMap1VariableSet();
}

//////////////////////////////////////////////////////////////////////
/*    This function removes party members. It stores the npc constants
    of the removed party members.

    Aidan-Feb 20,03
*/
//////////////////////////////////////////////////////////////////////
void UT_StoreParty()
{
    if(GetPartyMemberByIndex(0) != GetFirstPC())
    {
        SetPartyLeader(NPC_PLAYER);
    }
    object oNPC1 = GetPartyMemberByIndex(1);
    object oNPC2 = GetPartyMemberByIndex(2);


    int nIdx, bFound1, bFound2, bRemove;
    for (nIdx = NPC_ATTON; nIdx <= NPC_VISAS && !bFound2; nIdx++)
    {
        bRemove = IsNPCPartyMember(nIdx);
        if(bRemove)
        {
            if(bFound1 == FALSE)
            {
                RemovePartyMember(nIdx);
                SetGlobalNumber("K_PARTY_STORE1",nIdx);
                bFound1 = TRUE;
                SetGlobalBoolean("K_PARTY_STORED",TRUE);
            }
            else
            {
                RemovePartyMember(nIdx);
                SetGlobalNumber("K_PARTY_STORE2",nIdx);
                bFound2 = TRUE;
                SetGlobalBoolean("K_PARTY_STORED",TRUE);
            }
        }


        bRemove = FALSE;
    }
    if(GetIsObjectValid(oNPC1))
    {
        DestroyObject(oNPC1);
    }
    if(GetIsObjectValid(oNPC2))
    {
        DestroyObject(oNPC2);
    }

}

//::///////////////////////////////////////////////
//:: Restore NPC
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function restore party members. It will only
    restore party members removed via the
    UT_StoreParty function
*/
//:://////////////////////////////////////////////
//:: Created By: Aidan Scanlan
//:: Created On: Feb 20, 2003
//:://////////////////////////////////////////////
void UT_RestoreParty()
{
    int nNPC1 = GetGlobalNumber("K_PARTY_STORE1");
    int nNPC2 = GetGlobalNumber("K_PARTY_STORE2");
    object oNPC;
    if(GetGlobalBoolean("K_PARTY_STORED"))
    {
        if(nNPC1 >= NPC_ATTON && nNPC1 <= NPC_VISAS)
        {
            if(GetIsObjectValid(GetPartyMemberByIndex(1)) == FALSE)
            {
                oNPC = SpawnAvailableNPC(nNPC1,GetLocation(GetFirstPC()));
                if(GetIsObjectValid(oNPC))
                {
                    AddPartyMember(nNPC1,oNPC);
                }
            }
        }
        if(nNPC2 >= NPC_ATTON && nNPC2 <= NPC_VISAS)
        {
            if(GetIsObjectValid(GetPartyMemberByIndex(2)) == FALSE)
            {
                oNPC = SpawnAvailableNPC(nNPC2,GetLocation(GetFirstPC()));
                if(GetIsObjectValid(oNPC))
                {
                    AddPartyMember(nNPC2,oNPC);
                }
            }

        }
    }
    SetGlobalNumber("K_PARTY_STORE2",-2);
    SetGlobalNumber("K_PARTY_STORE1",-2);
    SetGlobalBoolean("K_PARTY_STORED",FALSE);
}

//::///////////////////////////////////////////////
//:: Return NPC Integer
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the NPC code for the given object if
    it is a NPC, otherwise it returns -1
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: Feb 26, 2003
//:://////////////////////////////////////////////

int UT_GetNPCCode(object oNPC)
{
  string sTag = GetTag(oNPC);

  if(!GetIsObjectValid(oNPC))
  {
    return(-1);
  }

  if(sTag == "atton")
  {
    return(NPC_ATTON);
  }

  if(sTag == "bao")
  {
    return(NPC_BAO_DUR);
  }

  if(sTag == "cand")
  {
    return(NPC_CANDEROUS);
  }

  if(sTag == "g0t0")
  {
    return(NPC_G0T0);
  }

  if(sTag == "handmaiden")
  {
    return(NPC_HANDMAIDEN);
  }

  if(sTag == "hk47")
  {
    return(NPC_HK_47);
  }

  if(sTag == "kreia")
  {
    return(NPC_KREIA);
  }

  if(sTag == "t3m4")
  {
    return(NPC_T3_M4);
  }

  if(sTag == "visas")
  {
    return(NPC_VISAS);
  }

  if(sTag == "mira")
  {
    return(NPC_MIRA);
  }

  return(-1);
}

//::///////////////////////////////////////////////
//:: Restore Party Member to 1 Vitality
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Restores all party mambers to 1 hp if
    tempoarily dead
*/
//:://////////////////////////////////////////////
//:: Created By: Aidan Scanlan
//:: Created On: March 1, 2003
//:://////////////////////////////////////////////

void UT_RestorePartyToOneHealth()
{
    int nIdx = 0;
    object oParty = GetPartyMemberByIndex(nIdx);
    while (GetIsObjectValid(oParty))
    {
        if(GetCurrentHitPoints(oParty) < 1)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oParty);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(1),oParty);
        }
        nIdx++;
        oParty = GetPartyMemberByIndex(nIdx);
    }
}

//::///////////////////////////////////////////////
//:: Heal Party
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cycles throught the entire party and heals
    them.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 28, 2003
//:://////////////////////////////////////////////

void UT_HealParty()
{
    object oParty;
    int nCnt = 0;
    for(nCnt; nCnt < 3; nCnt++)
    {
        oParty = GetPartyMemberByIndex(nCnt);
        if(GetIsObjectValid(oParty))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oParty);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHealForcePoints(500), oParty);
        }
    }
}

//::///////////////////////////////////////////////
//:: Heal Party Member
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Heals a single target to full.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 28, 2003
//:://////////////////////////////////////////////
void UT_HealNPC(object oNPC)
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oNPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHealForcePoints(500), oNPC);
}

//::///////////////////////////////////////////////
//:: Alter Stack
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alters the stack of a given object by the
    specified amount. If the stack is only 1 then
    the object is destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: March 3, 2003
//:://////////////////////////////////////////////
void UT_AlterItemStack(object oItem,int iNum = 1,int bDecrement = TRUE)
{
    int iStackSize;

    if(!GetIsObjectValid(oItem) || iNum == 0)
    {
        return;
    }

    if(bDecrement)
    {
        iNum = -iNum;
    }

    iStackSize = GetItemStackSize(oItem);
    if(iNum > 0)
    {
        SetItemStackSize(oItem,iStackSize+iNum);
    }
    else
    {
        if(iStackSize+iNum <= 0)
        {
          //MODIFIED by Preston Watamaniuk on May 13, 2003
          //Added the command below to set the stack to 1 before destroying it.
          SetItemStackSize(oItem,1);
          DestroyObject(oItem,0.0,TRUE);
        }
        else
        {
          SetItemStackSize(oItem,iStackSize+iNum);
        }
    }
}

//::///////////////////////////////////////////////
//:: Heal All Party NPCs
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches through the area and heals all of the
    party members who are there. Used on the Ebon
    Hawk and the Taris Apartment.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 5, 2003
//:://////////////////////////////////////////////

void UT_HealAllPartyNPCs()
{
    object oNPC1 = GetObjectByTag("atton");
    object oNPC2 =  GetObjectByTag("baodur");
    object oNPC3 = GetObjectByTag("mand");
    object oNPC4 = GetObjectByTag("g0t0");
    object oNPC5 = GetObjectByTag("handmaiden");
    object oNPC6 = GetObjectByTag("hk47");
    object oNPC7 = GetObjectByTag("kreia");
    object oNPC8 = GetObjectByTag( "mira" );
    object oNPC9 = GetObjectByTag("t3m4");
    object oNPC10 = GetObjectByTag("visasmarr");
    object oNPC11 = GetObjectByTag("disciple");
    object oCurrent;

    int nCnt = 1;
    while(nCnt <= 11)
    {
        if(nCnt == 1){oCurrent = oNPC1;}
        if(nCnt == 2){oCurrent = oNPC2;}
        if(nCnt == 3){oCurrent = oNPC3;}
        if(nCnt == 4){oCurrent = oNPC4;}
        if(nCnt == 5){oCurrent = oNPC5;}
        if(nCnt == 6){oCurrent = oNPC6;}
        if(nCnt == 7){oCurrent = oNPC7;}
        if(nCnt == 8){oCurrent = oNPC8;}
        if(nCnt == 9){oCurrent = oNPC9;}
        if(nCnt == 10){oCurrent = oNPC10;}
        if(nCnt == 11){oCurrent = oNPC11;}

        if(GetIsObjectValid(oCurrent))
        {
            UT_HealNPC(oCurrent);
        }
        nCnt++;
    }
    UT_HealNPC(GetFirstPC());
}

//::///////////////////////////////////////////////
//:: Clear Party Members
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through the party and removes them.
    This is best used on Module Load when the
    object are not actually created yet.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 6, 2003
//:://////////////////////////////////////////////
void UT_ClearAllPartyMembers()
{
    int nCnt;
    for(nCnt; nCnt <= 8; nCnt++)
    {
        if(IsNPCPartyMember(nCnt))
        {
            RemovePartyMember(nCnt);
        }
    }
}

//::///////////////////////////////////////////////
//:: DC check using an ability score only
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a DC check just using an ability score
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////
int UT_AbilityCheck(int iDC, int iAbility, object oTarget)
{
    if(!GetIsObjectValid(oTarget))
    {
        return(FALSE);
    }

    if(GetAbilityScore(oTarget,iAbility) + (Random(20)+1) >= iDC)
    {
        return(TRUE);
    }
    else
    {
        return(FALSE);
    }
}

//::///////////////////////////////////////////////
//:: Make Neutral2
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all objects with
    the specified tag to the neutral faction
*/
//:://////////////////////////////////////////////
//:: Created By: Peter T.
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////
void UT_MakeNeutral2(string sObjectTag)
{
    int nCount = 1;

    // get first object
    object oObject = GetNearestObjectByTag(sObjectTag);

    while(GetIsObjectValid(oObject))
    {
        // set to Neutral
        ChangeToStandardFaction(oObject, STANDARD_FACTION_NEUTRAL);

        // get next object
        nCount++;
        oObject = GetNearestObjectByTag(sObjectTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: Make Hostile1
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all objects with
    the specified tag to the Hostile_1 faction
*/
//:://////////////////////////////////////////////
//:: Created By: Peter T.
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////
void UT_MakeHostile1(string sObjectTag)
{
    int nCount = 1;

    // get first object
    object oObject = GetNearestObjectByTag(sObjectTag);

    while(GetIsObjectValid(oObject))
    {
        // set to Hostile_1
        ChangeToStandardFaction(oObject, STANDARD_FACTION_HOSTILE_1);

        // get next object
        nCount++;
        oObject = GetNearestObjectByTag(sObjectTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: Make Friendly1
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all objects with
    the specified tag to the Friendly_1 faction
*/
//:://////////////////////////////////////////////
//:: Created By: Peter T.
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////
void UT_MakeFriendly1(string sObjectTag)
{
    int nCount = 1;

    // get first object
    object oObject = GetNearestObjectByTag(sObjectTag);

    while(GetIsObjectValid(oObject))
    {
        // set to Friendly_1
        ChangeToStandardFaction(oObject, STANDARD_FACTION_FRIENDLY_1);

        // get next object
        nCount++;
        oObject = GetNearestObjectByTag(sObjectTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: Make Friendly2
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and changes all objects with
    the specified tag to the Friendly_2 faction
*/
//:://////////////////////////////////////////////
//:: Created By: Peter T.
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////
void UT_MakeFriendly2(string sObjectTag)
{
    int nCount = 1;

    // get first object
    object oObject = GetNearestObjectByTag(sObjectTag);

    while(GetIsObjectValid(oObject))
    {
        // set to Friendly_2
        ChangeToStandardFaction(oObject, STANDARD_FACTION_FRIENDLY_2);

        // get next object
        nCount++;
        oObject = GetNearestObjectByTag(sObjectTag, OBJECT_SELF, nCount);
    }
}

//::///////////////////////////////////////////////
//:: UT_ActivateTortureCage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    performs a standard torture cage effect
*/
//:://////////////////////////////////////////////
//:: Created By: Jason Booth
//:: Created On: April 1, 2003
//:://////////////////////////////////////////////
void DoTortureAnims(float fDuration)
{
    ActionPlayAnimation(ANIMATION_LOOPING_SPASM,1.0,fDuration/3.0);
    ActionPlayAnimation(ANIMATION_LOOPING_HORROR,1.0,fDuration/3.0);
    ActionPlayAnimation(ANIMATION_LOOPING_SPASM,1.0,fDuration/3.0);
}
void UT_ActivateTortureCage(object oCage, object oTarget,float fDuration)
{
    //AssignCommand(oCage,
    //ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    //ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectHorrified(),oTarget,fDuration);
    AssignCommand(oTarget,DoTortureAnims(fDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectBeam(VFX_BEAM_LIGHTNING_DARK_S, oCage, BODY_NODE_HEAD),oTarget,fDuration);
    //DelayCommand(fDuration,AssignCommand(oCage,ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
}

//::///////////////////////////////////////////////
//:: Validate Jump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the first three letters of the last module
    do not match the first three letters of the
    space port then function will return false.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 15, 2003
//:://////////////////////////////////////////////
int UT_ValidateJump(string sLastModule)
{
    int nJump = FALSE;

    string sCurrentModule = GetModuleFileName();
    PrintString("JUMP VALIDATION: CURRENT = " + sCurrentModule + " LAST = " + sLastModule);
    PrintString("JUMP VALIDATION: SUBSTRING: " + GetSubString(sCurrentModule, 0,3) + " = " + GetSubString(sLastModule, 0,3));
    if(GetSubString(sCurrentModule, 0,3) == GetSubString(sLastModule, 0,3))
    {
        nJump = TRUE;
    }
    else if(sCurrentModule != "ebo_m12aa")
    {
        SetGlobalString("K_LAST_MODULE", "NO_MODULE");
    }
    return nJump;
}

//::///////////////////////////////////////////////
//:: Play On Click Reaction
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the animal face the PC, do its victory
    and play a sound passed in. Should be used
    in conjunction with the k_def_interact spawn in
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 31, 2003
//:://////////////////////////////////////////////

void UT_DoAmbientReaction(string sSound)
{
    //ActionDoCommand(SetLocalBoolean(OBJECT_SELF, 72, FALSE));
    PlaySound(sSound);
    SetFacingPoint(GetPosition(GetPCSpeaker()));
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
    //DelayCommand(2.0, ActionDoCommand(SetLocalBoolean(OBJECT_SELF, 72, TRUE)));
}

// DJS-OEI 1/19/2004
//::///////////////////////////////////////////////
//:: Set Planet Global
//:://////////////////////////////////////////////
/*
    VARIABLE = K_CURRENT_PLANET

    Planet/Location         ID
    --------------------------
    Dantooine               5
    Dxun                    10
    Ebon Hawk               15
    Korriban                20
    M4-78                   25
    Malachor V              30
    Nar Shaddaa             35
    Onderon                 40
    Peragus                 45
    Telos                   50
    Harbinger               55
    Live 1                  60
    Live 2                  65
    Live 3                  70
    Live 4                  75
    Live 5                  80
    Live 6                  85
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Spitzley
//:: Created On: January 19, 2004
//:://////////////////////////////////////////////

void UT_SetPlanetaryGlobal(int nPlanetConstant)
{
    if(nPlanetConstant == PLANET_DANTOOINE)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 5);
    }
    else if(nPlanetConstant == PLANET_DXUN)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 10);
    }
    else if(nPlanetConstant == PLANET_EBON_HAWK)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 15);
    }
    else if(nPlanetConstant == PLANET_KORRIBAN)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 20);
    }
    else if(nPlanetConstant == PLANET_M4_78)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 25);
    }
    else if(nPlanetConstant == PLANET_MALACHOR_V)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 30);
    }
    else if(nPlanetConstant == PLANET_NAR_SHADDAA)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 35);
    }
    else if(nPlanetConstant == PLANET_ONDERON)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 40);
    }
    else if(nPlanetConstant == PLANET_PERAGUS)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 45);
    }
    else if(nPlanetConstant == PLANET_TELOS)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 50);
    }
    else if(nPlanetConstant == PLANET_HARBINGER)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 55);
    }
    else if(nPlanetConstant == PLANET_LIVE_01)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 60);
    }
    else if(nPlanetConstant == PLANET_LIVE_02)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 65);
    }
    else if(nPlanetConstant == PLANET_LIVE_03)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 70);
    }
    else if(nPlanetConstant == PLANET_LIVE_04)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 75);
    }
    else if(nPlanetConstant == PLANET_LIVE_05)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 80);
    }
    else if(nPlanetConstant == PLANET_LIVE_06)
    {
        SetGlobalNumber("K_CURRENT_PLANET", 85);
    }
}

// JAB-OEI 8/5/04
// Stores the facing of the party leader to be preserved during conversation
// Can restore with UT_RestoreLeaderFacing
void UT_StoreLeaderFacing(object oLeader)
{
    SetLocalNumber(oLeader,8,1); // this is used by the headler AI routine (safe to use here)
    SetLocalNumber(oLeader,9,FloatToInt(GetFacing(oLeader)/10.0f + 0.5f));
}

// JAB-OEI 8/5/04
// Restores leader facing direction after conversation (call this on the last red node of a conversation)
// should be called in conjunction with UT_StoreLeaderFacing();
void UT_RestoreLeaderFacing(object oLeader)
{
    object oPC = GetPartyLeader();
    if(GetLocalNumber(oLeader,8) == 1)
    {
        float fFacing = IntToFloat(GetLocalNumber(oLeader,9)*10);
        SetLocalNumber(oLeader,8,0);
        DelayCommand(0.1,AssignCommand(oLeader,ActionDoCommand(SetFacing(fFacing))));
    }
}

// Tony Evans 9/14/04
// Counts the number of creatures of the OBJECT_TYPE of a given tag, or objects that contain a given tag
// Returns the number of objects
int UT_ObjectCount(string sTag, int iName)
{
    // This variable will contain the number of objects
    int iCount;

    object oObject;

    if (sTag == "") oObject = OBJECT_SELF;

    else oObject = GetObjectByTag(sTag);

    if (!GetIsObjectValid(oObject)) oObject = OBJECT_SELF;

    // Get OBJECT_TYPE of Object (This variable is not used unless iNum == 0)
    int iObjType = GetObjectType (oObject);

    object oTemp = GetFirstObjectInArea();

    if (iName == 1)
    {
        while(GetIsObjectValid(oTemp))
        {
            // If the beginning (left side) of the string contains sTag, increment iCount
            if(GetStringLeft(GetTag(oTemp),GetStringLength(sTag)) == sTag) iCount++;
            oTemp = GetNextObjectInArea();
        }
    }

    else if (iName == 2)
    {
        while(GetIsObjectValid(oTemp))
        {
            // If the end (right side) of the string contains sTag, increment iCount
            if(GetStringRight(GetTag(oTemp),GetStringLength(sTag)) == sTag) iCount++;
            oTemp = GetNextObjectInArea();
        }
    }

    else if (iName == 3)
    {
        while(GetIsObjectValid(oTemp))
        {
            // If sTag is anywhere within the string, increment iCount
            if(FindSubString(GetTag(oTemp),sTag) >= 0) iCount++;
            oTemp = GetNextObjectInArea();
        }
    }

    // assuming iName == 0
    else
    {
        while(GetIsObjectValid(oTemp))
        {
            if (GetObjectType(oTemp) == iObjType) iCount++;
            oTemp = GetNextObjectInArea();
        }
    }

    if (iName == 0) AurPostString("Number of object type " + IntToString(iObjType) + " = " + IntToString(iCount),5,9,5.0);

    else AurPostString("Number of " + sTag + " = " + IntToString(iCount),5,9,5.0);

    return iCount;
}
