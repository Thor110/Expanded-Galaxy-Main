//:: k_inc_generic
/*
    v1.5
    Generic Include for KOTOR
    Post Clean Up as of March 3, 2003
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_gensupport"
#include "k_inc_walkways"
#include "k_inc_drop"

struct tLastRound
{
    int nLastAction;
    int nLastActionID;
    int nLastTalentCode;
    object oLastTarget;
    int nTalentSuccessCode;
    int nIsLastTargetDebil;
    int nLastCombo;
    int nLastComboIndex;
    int nCurrentCombo;
    int nBossSwitchCurrent;
};

struct tLastRound tPR;

//LOCAL BOOLEANS RANGE FROM 0 to 96
int AMBIENT_PRESENCE_DAY_ONLY = 1;        //POSSIBLE CUT
int AMBIENT_PRESENCE_NIGHT_ONLY = 2;      //POSSIBLE CUT
int AMBIENT_PRESENCE_ALWAYS_PRESENT = 3;

int SW_FLAG_EVENT_ON_PERCEPTION =   20;
int SW_FLAG_EVENT_ON_ATTACKED   =   21;
int SW_FLAG_EVENT_ON_DAMAGED    =   22;
int SW_FLAG_EVENT_ON_FORCE_AFFECTED = 23;
int SW_FLAG_EVENT_ON_DISTURBED = 24;
int SW_FLAG_EVENT_ON_COMBAT_ROUND_END = 25;
int SW_FLAG_EVENT_ON_DIALOGUE    = 26;
int SW_FLAG_EVENT_ON_DEATH       = 27;
int SW_FLAG_EVENT_ON_HEARTBEAT   = 28;
//int SW_FLAG_AMBIENT_ANIMATIONS = 29;          located in k_inc_walkways

// DJS-OEI 3/31/2004
// Since I misinformed the designers early on about the
// number of local boolean the game was using internally,
// they started using flags 30 thru 64 for plot-related
// stuff. This started causing problems since it was signalling
// the AI to perform incorrect behaviors. I've set aside the
// 30-64 range for designer use and increased the values of
// the remaining flags (as well as the engine's total storage
// capacity) so their current scripts will still work. We need
// to recompile all global and MOD embedded scripts so they use
// the new values.

// 30-64 reserved for designer usage.
/*
//int SW_FLAG_AMBIENT_ANIMATIONS_MOBILE = 30;   located in k_inc_walkways
int SW_FLAG_FAST_BUFF            = 31;   //POSSIBLE CUT
int SW_FLAG_ASC_IS_BUSY          = 32;   //POSSIBLE CUT
int SW_FLAG_ASC_AGGRESSIVE_MODE  = 33;   //POSSIBLE CUT
int SW_FLAG_AMBIENT_DAY_ONLY     = 40;   //POSSIBLE CUT
int SW_FLAG_AMBIENT_NIGHT_ONLY   = 43;   //POSSIBLE CUT
int SW_FLAG_EVENT_ON_SPELL_CAST_AT = 44;
int SW_FLAG_EVENT_ON_BLOCKED     = 45;
int SW_FLAG_ON_DIALOGUE_COMPUTER = 48;
int SW_FLAG_FORMATION_POSITION_0 = 49;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_1 = 50;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_2 = 51;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_3 = 52;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_4 = 53;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_5 = 54;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_6 = 55;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_7 = 56;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_8 = 57;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_9 = 58;   //POSSIBLE CUT
//int SW_FLAG_TARGET_FRIEND      = 59;        Located in k_inc_gensupport
int SW_FLAG_COMMONER_BEHAVIOR    = 60;
int SW_FLAG_SPECTATOR_STATE      = 61;
int SW_FLAG_AI_OFF               = 62;
int SW_CANDEROUS_COMBAT_REGEN    = 63;
int SW_FLAG_BOSS_AI              = 64;
int SW_FLAG_SHIELD_USED          = 65;
int SW_FLAG_EVENT_ON_DIALOGUE_END = 66;
int SW_FLAG_RESISTANCES_APPLIED  = 67;
int SW_FLAG_EVENT_DIALOGUE_END   = 68;   //User defined event
//This flag is set when the creature percieves a hostile for the first time.
//Used to eliminate the delay a creature puts on his perception event when first seeing a hostile.
int SW_FLAG_STATE_AGITATED       = 69;
int SW_FLAG_MALAK_AI_ON          = 70;
int SW_FLAG_DYNAMIC_COMBAT_ZONE  = 71;
int SW_FLAG_EVENT_ON_DIALOGUE_INTERRUPT  = 72;
//int SW_FLAG_WAYPOINT_START_AT_NEAREST = 73;//Located in k_inc_walkways
*/
//int SW_FLAG_AMBIENT_ANIMATIONS_MOBILE = 65;   located in k_inc_walkways
int SW_FLAG_FAST_BUFF            = 66;   //POSSIBLE CUT
int SW_FLAG_ASC_IS_BUSY          = 67;   //POSSIBLE CUT
int SW_FLAG_ASC_AGGRESSIVE_MODE  = 68;   //POSSIBLE CUT
int SW_FLAG_AMBIENT_DAY_ONLY     = 69;   //POSSIBLE CUT
int SW_FLAG_AMBIENT_NIGHT_ONLY   = 70;   //POSSIBLE CUT
int SW_FLAG_EVENT_ON_SPELL_CAST_AT = 71;
int SW_FLAG_EVENT_ON_BLOCKED     = 72;
int SW_FLAG_ON_DIALOGUE_COMPUTER = 73;
int SW_FLAG_FORMATION_POSITION_0 = 74;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_1 = 75;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_2 = 76;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_3 = 77;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_4 = 78;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_5 = 79;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_6 = 80;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_7 = 81;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_8 = 82;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_9 = 83;   //POSSIBLE CUT
//int SW_FLAG_TARGET_FRIEND      = 84;        Located in k_inc_gensupport
int SW_FLAG_COMMONER_BEHAVIOR    = 85;
int SW_FLAG_SPECTATOR_STATE      = 86;
int SW_FLAG_AI_OFF               = 87;
int SW_CANDEROUS_COMBAT_REGEN    = 88;
int SW_FLAG_BOSS_AI              = 89;
int SW_FLAG_SHIELD_USED          = 90;
int SW_FLAG_EVENT_ON_DIALOGUE_END = 91;
int SW_FLAG_RESISTANCES_APPLIED  = 92;
//JAB-OEI 5/21/04
//Commented out the Following line because of conflicts with SW_FLAG_EVENT_ON_DIALOGUE_END
//int SW_FLAG_EVENT_DIALOGUE_END   = 93;   //User defined event
//This flag is set when the creature percieves a hostile for the first time.
//Used to eliminate the delay a creature puts on his perception event when first seeing a hostile.
int SW_FLAG_STATE_AGITATED       = 94;
int SW_FLAG_MALAK_AI_ON          = 95;
int SW_FLAG_DYNAMIC_COMBAT_ZONE  = 96;
int SW_FLAG_EVENT_ON_DIALOGUE_INTERRUPT  = 97;
//int SW_FLAG_WAYPOINT_START_AT_NEAREST = 98;//Located in k_inc_walkways

//TALENT ROUTINES
int GEN_TALENT_SUPRESS_FORCE = 1;
int GEN_TALENT_REMOVE_POISON = 2;
int GEN_TALENT_HEALING       = 3;
int GEN_TALENT_BUFF          = 4;
int GEN_TALENT_REVITALIZE    = 5;//RWT-OEI 09/03/04

//Sets the NPC listening patterns for the purposes of shouts
void GN_SetListeningPatterns();
//Determines what combat actions the character is going to take.
void GN_DetermineCombatRound(object oIntruder = OBJECT_INVALID);
// Function used by the On Dialogue script to determine what to do when a NPC gets shout
void GN_RespondToShout(object oShouter, int nShoutIndex, object oIntruder = OBJECT_INVALID);
//Sets the day night patterns for the creature.  Uses the AMBIENCE_ constants.
void GN_SetDayNightPresence(int nPresenceSetting);
//Sets the attack target depending on whether oTarget or oIntruder is Valid
object GN_DetermineAttackTarget(object oIntruder = OBJECT_INVALID);
//Makes the character flee the center of an explosion
void GN_DodgeGrenade(object oIntruder);
//Resets the formation booleans on a character.
void GN_ResetFormationBooleans();
//Checks which position on a character is free.
void GN_MoveToFormation(object oAnchor, int nFormationType);
//Runs the default AI routine
int GN_RunDefaultAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Aid AI routine
int GN_RunAidAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Grenade Thrower AI
int GN_RunGrenadeAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Jedi Support AI routine
int GN_RunJediSupportAIRoutine(object oIntruder = OBJECT_INVALID);
//RWT-OEI 03/18/04 - This AI only heals, never attacks.
int GN_RunHealerAIRoutine( object oIntruder = OBJECT_INVALID );
//RWT-OEI 03/22/04 - This AI moves between shooting.
//  If called outside of combat, they just move around randomly.
int GN_RunSkirmishAIRoutine( object oIntruder = OBJECT_INVALID );
//RWT-OEI 08/28/04 - This function keeps the party NPCs within
//a certain number of meters from the party leader. Returns FALSE
//if they are already within that range, returns TRUE if it is
//currently moving them into range.
int GN_CheckRangeFromLeader(float fDistanceLimit = 10.0f);
//RWT-OEI 09/08/04 - This function keeps party puppets within
//a certain number of meters from their owner. Returns FALSE
//if they are already within that range, returns TRUE if it is
//currently moving them into range.
int GN_CheckRangeFromOwner(float fDistanceLimit = 5.0f );
//RWT-OEI 08/28/04 - This AI tries to use ranged as much as possible,
//switches to melee if being attacked with melee.
int GN_RunRangedSupportAIRoutine( object oIntruder = OBJECT_INVALID );
//RWT-OEI 08/28/04 - Calling this tries to switch us to a ranged
//weapon config if we can and we are not being attacked by
//melee at the moment or in the last X rounds.
int GN_CheckRangedPreferred();
//RWT-OEI 08/28/04 - This AI stands in one place and uses ranged or
//melee when being attacked by melee.
int GN_RunStationaryAIRoutine( object oIntruder = OBJECT_INVALID );
//RWT-OEI 08/28/04 - This returns TRUE if the object has a Jedi class
int GN_IsJedi(object oObject = OBJECT_SELF);
//RWT-OEI 09/08/04 - Runs the default puppet AI.
int GN_RunDefaultPuppetAIRoutine(object oIntruder = OBJECT_INVALID );
//Runs the Boss AI Routine
int GN_RunBossAIRoutine(object oIntruder = OBJECT_INVALID);
//Run Boss Grenade AI Routine
int GN_RunBossGrenadeAI();
//Run Boss AOE Force Power Routine
int GN_RunBossAOEPowerRoutine();
//Runs special AI just for Darth Malak on the Star Forge
int GN_RunMalakAIRoutine();
//Run Boss Targeted Routine
int GN_RunBossTargetedRoutine();
// JAB-OEI 7/3/04 - Runs special AI for boss Drexl on Onderon
int GN_RunTurtleAIRoutine(object oIntruder = OBJECT_INVALID);
// DJS-OEI 9/27/2004 - Runs AI for monsters that use Special Abilities
int GN_RunMonsterPowersAIRoutine(object oIntruder = OBJECT_INVALID);
//Sets up struct tLastRound to allow for a single point of determination.
void GN_SetLastRoundData();
//Makes the person or droid activate a shield
int GN_ActivateForceField();
//Makes the person activate Resist Elements and Resist Force.
int GN_ActivateResistances();
//Resets a Droid to his deactivated animation
void GN_ResetDroidDeactivationState(object oDroid = OBJECT_SELF);
//Checks the target and the droid utility use to make sure they are compatible
talent GN_CheckDroidUtilityUsage(object oTarget, talent tUse);
//Checks the target and the force power to make sure that a lightsaber is not thrown from close range.
talent GN_CheckThrowLightSaberUsage(object oTarget, talent tUse);
//Checks the target and the force power to make sure that a non-droid force power is used against a droid
talent GN_CheckNonDroidForcePower(object oTarget, talent tUse);
//Performs a series of checks in case the combat portion of DetermineCombatRound falls through.
int GN_DoPostDCRChecks();
//A void version of do post DCR checks for use with action do command.
void GN_ActionDoPostDCRChecks();

//Determine Combat Round Targeting Funtions
//This function returns an object if OBJECT_SELF is poisoned, or if any party member is poisoned.
object GN_CheckIfPoisoned();
//This function returns an object if OBJECT_SELF is below 50% health, or if any party member is injured.
object GN_CheckIfInjured();
//RWT-OEI 09/03/04 - This returns TRUE if any party member is KO'd.
int GN_CheckIfKnockedOut();
//This checks the last hostile target and determines the best attack action based on the last round.
int GN_GetAttackTalentCode(object oTarget);
//Pass in a talent type and a target to have object_self use the talent
int GN_TalentMasterRoutine(int nTalentConstant, object oTarget);
//Determines where in the current combo the character is and what to do next based on AI style, and combat info.
talent GN_GetComboMove(int nBoss = FALSE);
//Plays an Ambient Animation depending on the spawn in condition selected.
void GN_PlayAmbientAnimation();
// This causes peasants to flee when people
int GN_CommonAI();
//Should Commoners run away.  This returns a yes or no based on a set of conditions
int GN_CheckShouldFlee();

//RWT-OEI 04/07/04 - Sets the heal percentage for the calling object.
void GN_SetHealPercentage( int nHeal );
//RWT-OEI 04/13/04 - Sets the threshold at which the Healer AI will heal
void GN_SetHealThreshold( int nPercentage );

//RWT-OEI 07/16/04 - Set the amount of damage the exploding, floating
//mine will do.
void GN_SetFloatingMineDamage( int nDamage );
//RWT-OEI 07/16/04 - Set the Range that the mine will start seeking
void GN_SetFloatingMineSeekRange( int nRange );


void GN_DetermineCombatRound(object oIntruder = OBJECT_INVALID)
{
    GN_MyPrintString("");
    GN_MyPrintString("GENERIC DEBUG *************** START DETERMINE COMBAT ROUND " + GN_ReturnDebugName(OBJECT_SELF));

    //RWT-OEI 10/19/04 - If this is a party member, and this party member already has
    //combat actions queued up, don't do anything to override those.
    //RWT-OEI 10/30/04 - I had to take this out. It was causing your party members to not
    //engage if they were in Ranged Support but had a melee weapon equipped. They'd often just
    //stand there and do nothing.
    //if ( IsObjectPartyMember(OBJECT_SELF) && GetCombatActionsPending(OBJECT_SELF))
    //{
    //    return;
    //}

    GN_SetLastRoundData();
    int nPartyAI = GetPartyAIStyle(); //Determines how the party should react to intruders
    int nNPC_AI = GetNPCAIStyle(OBJECT_SELF); //Determines how the individual should react in combat
    GN_MyPrintString("GENERIC DEBUG *************** AI STYLE = " + GN_ReturnAIStyle());

    if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
    && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
    && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF)
    //MODIFIED by Preston Watamaniuk on March 27
    //Put this back in to cancel Determine Combat when user actions are present.
    && !GetUserActionsPending())
    {
        if(GetPartyMemberByIndex(0) != OBJECT_SELF && !GetPlayerRestrictMode())
        {
            if((IsObjectPartyMember(OBJECT_SELF) && !GetPlayerRestrictMode()) || !IsObjectPartyMember(OBJECT_SELF))
            {
                if(nNPC_AI == NPC_AISTYLE_MELEE_ATTACK)
                {
                    if(GetIsObjectValid(oIntruder))
                    {
                        ClearAllActions();
                        ActionAttack(oIntruder);
                        return;
                    }
                    else
                    {
                        object oDefault = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
                        if(GetIsObjectValid(oDefault))
                        {
                            ClearAllActions();
                            ActionAttack(oDefault);
                            return;
                        }
                    }
                    return;
                }
                //Always try and run a force field at the beginning of combat.
                if(GN_ActivateForceField() == TRUE)
                {
                    GN_MyPrintString("GENERIC DEBUG *************** Terminating AI from Shields");
                    return;
                }
                //Always try to use Force Resistance at the beginning of combat.
                if(GN_ActivateResistances() == TRUE){return;}

                //P.W. (June 9) - Malak AI put into the generics
                if(GN_GetSpawnInCondition(SW_FLAG_MALAK_AI_ON) == TRUE)
                {
                    if(GN_RunMalakAIRoutine() == TRUE){return;}
                }

                //If the boss flag is set then the creature will run the boss AI first.
                if(GN_GetSpawnInCondition(SW_FLAG_BOSS_AI) == TRUE)
                {
                    if(GN_RunBossAIRoutine(oIntruder) == TRUE){return;}
                }

                //RWT-OEI 03/18/04 - This AI just runs around healing others
                if ( nNPC_AI == NPC_AISTYLE_HEALER )
                {
                    GN_RunHealerAIRoutine(oIntruder);
                    //If this AI is active, they get no other options, so
                    //just return after it executes.
                    return;
                }

                //RWT-OEI 03/22/04 - This AI moves randomly between shooting
                if ( nNPC_AI == NPC_AISTYLE_SKIRMISH )
                {
                    //If this AI returns 1, then no other AIs should be
                    //executed. If it returns 0, then other attacks are fine.
                    if ( GN_RunSkirmishAIRoutine(oIntruder) )
                        return;
                }

                //RWT-OEI 03/23/04 - If we get here, we may be in skirmish
                //  mode, but not moving. Therefore just attack like normal.
                if(nNPC_AI == NPC_AISTYLE_DEFAULT_ATTACK ||
                   nNPC_AI == NPC_AISTYLE_SKIRMISH )
                {
                     //ACTIVE
                     if(GN_RunDefaultAIRoutine(oIntruder) == TRUE)
                     {
                        return;
                     }
                }
                else if(nNPC_AI == NPC_AISTYLE_GRENADE_THROWER)
                {
                     //ACTIVE
                     if(GN_RunGrenadeAIRoutine(oIntruder) == TRUE){return;}
                }
                else if(nNPC_AI == NPC_AISTYLE_JEDI_SUPPORT)
                {
                     //ACTIVE
                     if ( GN_CheckRangeFromLeader(10.0f) == TRUE )
                     {
                        return;
                     }
                     if(GN_RunJediSupportAIRoutine(oIntruder) == TRUE){return;}
                }
                //JAB-OEI 7/3/04
                else if(nNPC_AI == NPC_AISTYLE_TURTLE)
                {
                    if(GN_RunTurtleAIRoutine(oIntruder) == TRUE){return;}
                }
                else if(nNPC_AI == NPC_AISTYLE_PARTY_AGGRO)
                {
                    //RWT-OEI 08/28/04 Aggressive just acts like it
                    //did in KotOR1.
                    //AurPostString("Aggro AI", 10, 30, 5.0f);
                    if (GN_RunDefaultAIRoutine(oIntruder) == TRUE)
                    {
                        return;
                    }
                }
                else if(nNPC_AI == NPC_AISTYLE_PARTY_DEFENSE)
                {
                    //RWT-OEI 08/28/04 - Defensive acts just like
                    //default in KotOR1, except never more than
                    //10 meters away from the party leader at any
                    //time.
                    //AurPostString("Defense AI", 10, 30, 5.0f);
                    if(GN_CheckRangeFromLeader(5.0f) == TRUE)
                    {
                        return;
                    }
                    GN_RunDefaultAIRoutine(oIntruder);
                    return;
                }
                else if(nNPC_AI == NPC_AISTYLE_PARTY_RANGED)
                {
                    //RWT-OEI 08/28/04 - Ranged Support will
                    //stand back and use ranged weapons. If
                    //they are attacked by someone with melee
                    //they will switch to their alternate
                    //weapon config if that config has
                    //melee weapons in it. Must stay within
                    //10 meters of party leader at any time.
                    if (GN_CheckRangeFromLeader(10.0f) == TRUE)
                    {
                        return;
                    }
                    //AurPostString("Ranged AI", 20, 20, 5.0f);
                    GN_RunRangedSupportAIRoutine(oIntruder);
                    return;
                }
                else if (nNPC_AI == NPC_AISTYLE_PARTY_STATIONARY)
                {
                    //RWT-OEI 08/28/04 - Just stand in one place and
                    //shoot. Don't move under any circumstances whenever
                    //in combat mode. This mode should probably override
                    //movement outside of combat as well. That would
                    //be handled elsewhere.
                    //AurPostString("Stationary AI", 10, 30, 5.0f);
                    //GN_RunStationaryAIRoutine(oIntruder);
                    GN_RunRangedSupportAIRoutine(oIntruder);
                    return;
                }
                else if (nNPC_AI == NPC_AISTYLE_PARTY_SUPPORT)
                {
                    //RWT-OEI 08/28/04 - If is Jedi, then will run
                    //default Jedi routine from KotOR1. If not,
                    //will run Grenadier routine from KotOR1.
                    if (GN_IsJedi(OBJECT_SELF))
                    {
                        //AurPostString("JediSupport AI", 10, 30, 5.0f);
                        GN_RunJediSupportAIRoutine(oIntruder);
                    }
                    else
                    {
                        //AurPostString("Grenadier AI", 10, 30, 5.0f);
                        GN_RunGrenadeAIRoutine(oIntruder);
                    }
                    return;
                }
                else if ( nNPC_AI == NPC_AISTYLE_PARTY_REMOTE )
                {
                    //RWT-OEI 09/08/04 - First priority is to stay in range
                    //of owner.
                    //If we need to move as a result, don't do anything else.
                    if (GN_CheckRangeFromOwner(2.0f) == TRUE)
                    {
                        return;
                    }
                    //Otherwise, call the default puppet AI
                    GN_RunDefaultPuppetAIRoutine(oIntruder);
                    return;
                }
                else if( nNPC_AI == NPC_AISTYLE_MONSTER_POWERS ) {
                    // DJS-OEI 9/27/2004
                    if( GN_RunMonsterPowersAIRoutine(oIntruder) == TRUE ) {
                        return;
                    }
                    else {
                        GN_RunDefaultAIRoutine(oIntruder);
                    }
                }
                else
                {
                    //Run a default AI no matter what. RWT-OEI 08/20/04
                    if (GN_RunDefaultAIRoutine(oIntruder) == TRUE)
                    {
                        return;
                    }
                }
            }
        }
    }
    if(GN_DoPostDCRChecks())
    {
        GN_MyPrintString("GENERIC DEBUG *************** DETERMINE COMBAT ROUND END");
    }
    GN_MyPrintString("GENERIC DEBUG *************** WARNING DETERMINE COMBAT ROUND FAILURE");
}

//::///////////////////////////////////////////////
//:: Do Post Determine Combat Round Checks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Performs a series of checks in case the combat
    portion of DetermineCombatRound falls through.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 25, 2003
//:://////////////////////////////////////////////
int GN_DoPostDCRChecks()
{
    GN_MyPrintString("GENERIC DEBUG *************** Post DCR Checks for " + GN_ReturnDebugName(OBJECT_SELF));
    if(GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR) && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE))
    {
        //MODIFIED by Preston Watamaniuk on May 29, 2003
        //Changed the commoner subroutine to make sure it walks ways at the end of battles.
        if(GN_CommonAI())
        {
            return TRUE;
        }
    }
    else if(GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Clear 1000");
        ClearAllActions();
        return TRUE;
    }
    //If all combat actions fail, then return to Walkways
    //P.W.(May 22, 2003) - Added check to make sure a waypoint path is set out for the creature. If then do not clear all actions.
    //if(!IsObjectPartyMember(OBJECT_SELF) && GN_CheckWalkWays(OBJECT_SELF) == TRUE)
    if(!IsObjectPartyMember(OBJECT_SELF) && GN_GetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE) == TRUE)//AWD-OEI 10/27/2004 we need to actually check if walk waypoints is ON
    {
        GN_MyPrintString("GENERIC DEBUG *************** Clear 1100");
        ClearAllActions();
        //MODIFIED by Preston Watamaniuk on May15, 2003
        //Put this delay command in so that bark bubble do not disapear so quickly off conversations.
        DelayCommand(1.0, GN_WalkWayPoints());
        return TRUE;
    }
    else if(GetPartyMemberByIndex(0) != OBJECT_SELF &&
            !GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)) &&
            IsObjectPartyMember(OBJECT_SELF))
    {
        object oLeader = GetPartyMemberByIndex(0);
        object oLeaderTarget = GetAttackTarget(oLeader);
        if(!GetSoloMode())
        {
            //RWT-OEI 09/18/04 - Now your party members will stick it out with
            //helping you bash stuff, if they're not otherwise already occupied.
            if ( GetObjectType( oLeaderTarget ) == OBJECT_TYPE_DOOR &&
                 !GetIsOpen( oLeaderTarget ) && !GetSoloMode())
            {
                //Forget it. Party members won't help with bashing anymore.
                //The targets are too small so it looks lame
                ClearAllActions();
                ActionFollowLeader();

            }
            else if ( GetObjectType( oLeaderTarget ) == OBJECT_TYPE_PLACEABLE &&
                      GetCurrentHitPoints(oLeaderTarget) > 0 && !GetSoloMode())
            {
                //AurPostString( GetTag(OBJECT_SELF) + ": Leader picking on something.", 20, 30, 5.0f );
                //RWT-OEI 10/05/04 - No matter what I do this is going to look lame, taking
                //out party bashing help
                ClearAllActions();
                //ActionAttack(oLeaderTarget);
                ActionFollowLeader();
            }
            else
            {
                //AurPostString( GetTag(OBJECT_SELF) + ": Leader not up to anything.", 20, 31, 5.0f );
                GN_PostString("NO TARGET: FOLLOW LEADER");
                CancelCombat(OBJECT_SELF);
                GN_MyPrintString("GENERIC DEBUG *************** Clear 1200");
                ClearAllActions();
                ActionFollowLeader();
            }
        }
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: GN_ActionDoPostDCRChecks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A form of the DCR checks that can be run as
    an actions.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 29, 2003
//:://////////////////////////////////////////////
void GN_ActionDoPostDCRChecks()
{
    int nx = GN_DoPostDCRChecks();
}

//:://////////////////////////////////////////////
//:: Run Default AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Runs the default AI for an NPC. Returns FALSE
    if they cannot do anything.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////
int GN_RunDefaultAIRoutine(object oIntruder)
{
    object oTarget, oClose;
    oClose = OBJECT_INVALID;
    int nTalentCode;
    talent tUse;
    int nMoving = 0;

    oTarget = GN_CheckIfPoisoned();
    if(GetIsObjectValid(oTarget))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_REMOVE_POISON, oTarget)) {return TRUE;}
    }
    oTarget = GN_CheckIfInjured();
    if(GetIsObjectValid(oTarget))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oTarget)) {return TRUE;}
    }

    tUse = GN_GetComboMove();

    int nFriend = GetLocalBoolean(OBJECT_SELF, SW_FLAG_TARGET_FRIEND);
    if(nFriend == TRUE)
    {
        if(GetNPCAIStyle(OBJECT_SELF) == NPC_AISTYLE_JEDI_SUPPORT)
        {
            oTarget = GetPartyMemberByIndex(0);
        }
        else
        {
            oTarget = OBJECT_SELF;
        }
    }
    else
    {
        oTarget = tPR.oLastTarget;
        if ( GetNPCAIStyle(OBJECT_SELF) == NPC_AISTYLE_PARTY_DEFENSE )
        {
            //RWT-OEI 10/04/04 - In Defensive AI mode, we chose our targets
            //differently than other modes
            //First we need to know if we have range or melee equipped.
            object oLeader = GetPartyLeader();
            int nWeaponType = 0;
            object oWeap = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON );
            if ( GetIsObjectValid(oWeap) )
            {
                nWeaponType = GN_GetWeaponTypeFromBaseItem(GetBaseItemType(oWeap));
            }

            //If we have RANGED (2), then we only target whoever the player is
            //attacking currently
            if ( nWeaponType == 2 )
            {   if ( GetIsInCombat(oLeader, TRUE) )
                {
                    oClose = GetAttackTarget(oLeader);
                }
                else
                {
                    //If the leader isn't fighting, then either do we
                    oClose = OBJECT_INVALID;
                }
            }
            else
            {
                //If we have melee equipped, we only attack creatures that are within 5.0 meters of the player character
                oClose = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oLeader,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);

                //So just get the nearest creature and check that they're within 5 meters of the
                //current leader
                //AurPostString( "Distance is: " + FloatToString( GetDistanceToObject(oClose)), 20, 21, 5.0f );
                if ( GetIsObjectValid(oClose) && GetDistanceToObject(oClose) > 5.0f )
                {
                    //Clear oClose as a non-target then
                    oClose = OBJECT_INVALID;
                    oIntruder = OBJECT_INVALID;//Clear this as well
                }
            }
        }
        else
        {
            //RWT-OEI 11/01/04 - Trying to make the bosses more aggressive
            if ( GetNPCAIStyle(OBJECT_SELF) != SW_FLAG_BOSS_AI )
            {
                oClose = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
            }
            else
            {
                oClose = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1);
                oTarget = oClose;
            }

        }

        GN_MyPrintString("GENERIC DEBUG *************** Default AI Debug Start *************************");
        GN_MyPrintString("GENERIC DEBUG *************** Intruder    = " + GN_ReturnDebugName(oIntruder));
        GN_MyPrintString("GENERIC DEBUG *************** Last Target = " + GN_ReturnDebugName(oTarget));
        GN_MyPrintString("GENERIC DEBUG *************** Closest     = " + GN_ReturnDebugName(oClose));

        //GN_MyPrintString("GENERIC DEBUG *************** " + GN_ReturnDebugName(OBJECT_SELF) + "I see an enemy = " + IntToString(GetIsObjectValid(oClose)));

        //MODIFIED by Preston Watamaniuk on June 3, 2003
        //I put this check in to make sure the party members only attack what you want until that things dies or leaves.
        if(IsObjectPartyMember(OBJECT_SELF) && GetIsObjectValid(oTarget) && !GetIsDead(oTarget) && GetObjectSeen(oTarget))
        {
            oTarget = oTarget; //Just put this here to show that the target is being used.
        }
        //MODIFIED by Preston Watamaniuk on May 15, 2003
        //Made it so the intruder object is always used if they can be seen and are valid.
        else if(GetIsObjectValid(oIntruder) && GetObjectSeen(oIntruder) )
        {
            GN_MyPrintString("GENERIC DEBUG *************** Intruder becomes Target");
            oTarget = oIntruder;
        }
        else if(GetIsObjectValid(oClose) && GetObjectSeen(oClose))
        {
            if((!GetIsObjectValid(oTarget) ||
               !GetIsEnemy(oTarget) ||
               GetIsDead(oTarget) ||
               GetCurrentHitPoints(oTarget) < GetCurrentHitPoints(oClose)))
               {
                  GN_MyPrintString("GENERIC DEBUG *************** Closest becomes Target");
                  oTarget = oClose;
               }
        } else  if ( GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID &&
                     !IsObjectPartyMember(OBJECT_SELF)) {

            //RWT-OEI 04/07/04 - I added this support to make it so that
            //  ranged-only users will try to chase down the characters.
            //  But the problem is that the HasLineOfSight function is
            //  returning vectors that don't actually give line of
            //  sight -sometimes-. It works about 60%, but the percentage
            //  goes down the further the player is from the attacker.
            //  I would like to fix this up in the future if I have time
            //  to get back to it.
            /*
            if ( !GetIsObjectValid(oIntruder) )
                AurPostString( "Intruder is invalid", 10, 10, 2.0f );

            if ( GetIsObjectValid(oIntruder) && !GetObjectSeen(oIntruder ) )
                AurPostString( "Intruder not seen, but valid.", 10, 15, 2.0f );

            if ( !GetIsObjectValid( oClose ) )
                AurPostString( "oClose is invalid.", 10, 20, 2.0f );

            if ( GetIsObjectValid( oClose ) && !GetObjectSeen( oClose ) )
                AurPostString( "oClose is valid but not seen.", 10, 25, 2.0f );
            */

            //First we need to determine a valid target to go after.
            if ( !GetIsObjectValid( oClose ) ) {
                //oClose is not valid. Probably out of sight. Now find
                //an oClose without the line of sight check.
                oClose = GetNearestCreature(CREATURE_TYPE_REPUTATION,
                                            REPUTATION_TYPE_ENEMY,
                                            OBJECT_SELF, 1);
            }

            if ( GetIsObjectValid( oClose ) )
            {
                //See if that nearest target is stealthed, if so,
                //don't keep looking for them
                if ( IsStealthed(oClose))
                {
                    oClose = OBJECT_INVALID;
                }
            }

            //Do we have a valid target now?
            if ( GetIsObjectValid( oClose ) ) {
                float fDistance = GetDistanceToObject2D( oClose );
                string sDistance = FloatToString( fDistance );
                //AurPostString( sDistance, 20, 20, 2.0f );

                vector vTargetPos = GetPosition( oClose );
                int nLocal = GetLocalNumber( OBJECT_SELF, 9 );
                string sLocal = IntToString( nLocal );
                //AurPostString( sLocal, 40, 10, 2.0f );
                if ( GetLocalNumber( OBJECT_SELF, 9 ) > 2 ) {
                    int nActionID = GetCurrentAction( OBJECT_SELF ) ;
                    //AurPostString( "Going straight there now.", 20, 20, 2.0f);
                    location newLoc = Location( vTargetPos,
                                                GetFacing(OBJECT_SELF));
                    ActionMoveToLocation( newLoc, TRUE );
                    oClose = OBJECT_INVALID;
                    oTarget = OBJECT_INVALID;
                } else {

                    vector vNewPos = GetRandomDestination( OBJECT_SELF, 10 );
                    int nCount = 0;
                    //float fDistanceToTarget = GetDistanceToObject2D(oClose);

                    while ( nCount < 20 ) {
                        if ( HasLineOfSight( vNewPos, vTargetPos ) ) {
                            //New position has line of sight.
                            break;
                        }
                        //If we didn't have line of sight at that last point,
                        //try another one
                        vNewPos = GetRandomDestination( OBJECT_SELF, 20 );
                        ++nCount;
                    }

                    //If nCount is < 20, we found a good place to move to.
                    //So move.
                    if ( nCount < 20 ) {
                        //if ( HasLineOfSight( vNewPos, vTargetPos ) )
                            //AurPostString( "New loc found.", 20, 25, 2.0f );
                        string sCount = IntToString( nCount );
                        //AurPostString( sCount, 20, 30, 2.0f );
                        int nActionID = GetCurrentAction(OBJECT_SELF);
                        if ( nActionID != ACTION_MOVETOPOINT ) {
                            location newLoc = Location( vNewPos,
                                                       GetFacing(OBJECT_SELF));

                            ActionMoveToLocation( newLoc, TRUE );
                            SetLocalNumber(OBJECT_SELF, 9,
                                           GetLocalNumber(OBJECT_SELF, 9) + 1);
                       }
                    }
                    //Clear objects since we have nothing to attack
                    oClose = OBJECT_INVALID;
                    oTarget = OBJECT_INVALID;
                }
            }

        }

    }

    //RWT-OEI 10/31/04 - If our target is more than 30 meters away,
    //drop out of combat all together
    float fDistance = GetDistanceToObject(oTarget);
    if ( fDistance > 30.0f && GetNPCAIStyle(OBJECT_SELF) != SW_FLAG_BOSS_AI )
    {
        //Okay, target is too far. Just drop out of combat all
        //together.
        oTarget = OBJECT_INVALID;
        CancelCombat(OBJECT_SELF);
    }

    //If we have a valid target, reset the number of times we've looked for
    //a better firing position.
    if ( GetIsObjectValid( oTarget ) ) {
        SetLocalNumber( OBJECT_SELF, 9, 0 );
    }

    //MODIFIED by Preston Watamaniuk on April 22, 2003
    //Put this check in to allow Droids to use their special abilities in a more logical manner. Passes in the talent and the target
    //and double checks that the usage is logical.
    if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
    {
        tUse = GN_CheckDroidUtilityUsage(oTarget, tUse);
    }
    tUse = GN_CheckThrowLightSaberUsage(oTarget, tUse);
    tUse = GN_CheckNonDroidForcePower(oTarget, tUse);

    GN_MyPrintString("GENERIC DEBUG *************** Default AI Debug End ***************************");

    GN_MyPrintString("GENERIC DEBUG *************** Target = " + GN_ReturnDebugName(oTarget) + " is Enemy: " + IntToString(GetIsEnemy(oTarget)));
    if(GetIsObjectValid(oTarget))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Clear 1300");
        ClearAllActions();
        if(GN_EquipAppropriateWeapon())
        {
           GN_MyPrintString("GENERIC DEBUG *************** Switching Weapons");
        }

        if(GetIsTalentValid(tUse) && GetIsEnemy(oTarget))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Using Talent on Target");
            ActionUseTalentOnObject(tUse, oTarget);
            return TRUE;
        }
        else if(GetIsEnemy(oTarget))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Action Attack by Default");
            ActionAttack(oTarget);
            return TRUE;
        }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Default AI has failed to do an action");
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Jedi Aid AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    AI that concentrates on keeping the party healed,
    poison free.  If the party is doing ok then the Jedi
    will attempt to use Force Powers. If they are unable
    to use force powers they will run default AI.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 20, 2003
//:://////////////////////////////////////////////

int GN_RunAidAIRoutine(object oIntruder = OBJECT_INVALID)
{
    object oPoisoned = GN_CheckIfPoisoned();
    if(GetIsObjectValid(oPoisoned))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_REMOVE_POISON, oPoisoned)) {return TRUE;}
    }
    object oInjured = GN_CheckIfInjured();
    if(GetIsObjectValid(oInjured))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oInjured)) {return TRUE;}
    }

    return GN_RunDefaultAIRoutine(oIntruder);
}

//::///////////////////////////////////////////////
//:: Grenade AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trys to use a grenades on targets not surrounded
    by enemies
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////

int GN_RunGrenadeAIRoutine(object oIntruder = OBJECT_INVALID)
{
    if(IsObjectPartyMember(OBJECT_SELF) || d100() > 50)
    {
        int nDroid = FALSE;
        talent tUse;
        object oTarget = GN_FindGrenadeTarget();

        if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
        {
            nDroid = TRUE;
        }

        tUse = GN_GetGrenadeTalent(nDroid);

        if(GetIsObjectValid(oTarget) && GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Clear 1400");
            ClearAllActions();
            ActionUseTalentOnObject(tUse, oTarget);
            return TRUE;
        }
        GN_MyPrintString("GENERIC DEBUG *************** Grenade AI Failure");
        return GN_RunDefaultAIRoutine(oIntruder);
    }
    GN_MyPrintString("GENERIC DEBUG *************** Grenade AI Fall Through");
    return GN_RunDefaultAIRoutine(oIntruder);
}

//::///////////////////////////////////////////////
//:: Jedi Support
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will make the Jedi use Force Powers before
    everything else.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////
int GN_RunJediSupportAIRoutine(object oIntruder = OBJECT_INVALID)
{
    //RWT-OEI 10/19/04 - Don't do ANYTHING if we're in a cutscene...
    if ( GetIsConversationActive() )
    {
        return TRUE;
    }
    object oPoisoned = GN_CheckIfPoisoned();
    talent tUse;
    object oTarget;

    //P.W (May 27, 2003) - Made a change so that Droids can use Jedi Support. Its just defaul AI with an AI check however.
    if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
    {
        return GN_RunDefaultAIRoutine();
    }

    //RWT-OEI 10/11/04 - If the player character is just attacking doors
    //or placeables, then don't bother buffing them...
    object oLeader = GetPartyMemberByIndex(0);
    object oLeaderTarget = GetAttackTarget(oLeader);
    if ( !GetSoloMode() )
    {
        if ( GetObjectType( oLeaderTarget ) == OBJECT_TYPE_DOOR ||
             GetObjectType( oLeaderTarget ) == OBJECT_TYPE_PLACEABLE )
        {
            return FALSE;
        }
    }

    if (GN_CheckSeriesRevitalize() != -1)
    {
        int nDown = GN_CheckIfKnockedOut();
        if ( nDown )
        {
            AurPostString( "Someone is knocked out.", 20, 25, 5.0f );
            if ( GN_TalentMasterRoutine(GEN_TALENT_REVITALIZE, GetFirstPC()) )
            {
                return TRUE;
            }
        }
    }

    if(GetIsObjectValid(oPoisoned))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_REMOVE_POISON, oPoisoned)) {return TRUE;}
    }

    object oInjured = GN_CheckIfInjured();
    if(GetIsObjectValid(oInjured))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oInjured)) {return TRUE;}
    }

    if(GN_TalentMasterRoutine(GEN_TALENT_BUFF, OBJECT_SELF))
    {
        return TRUE;
    }

    oTarget = GN_FindAOETarget();
    GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: AOE Target = " + GN_ITS(GetIsObjectValid(oTarget)));
    if(GetIsObjectValid(oTarget))
    {
        if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
        {
            tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_FORCE_POWER, TRUE);
        }
        else
        {
            tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_FORCE_POWER);
        }
    }
    else
    {
        GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: Inside the Party AI Section");

        oTarget = GN_DetermineAttackTarget();

        GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + GN_ReturnDebugName(oTarget));

        if(GetIsObjectValid(oTarget))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: Valid oTarget Set As = " + GN_ReturnDebugName(oTarget));
            if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
            {
                tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_NPC, TRUE);
            }
            else
            {
                tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_NPC);
            }
        }
    }
    tUse = GN_CheckThrowLightSaberUsage(oTarget, tUse);
    tUse = GN_CheckNonDroidForcePower(oTarget, tUse);
    if(GetIsObjectValid(oTarget) && GetIsTalentValid(tUse))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Clear 1450");
        ClearAllActions();
        ActionUseTalentOnObject(tUse, oTarget);
        return TRUE;
    }
    GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: Fall Through");
    return GN_RunDefaultAIRoutine();
}

//::///////////////////////////////////////////////
//:: Boss AI: Grenade
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Run Boss Grenade AI Routine
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
int GN_RunBossGrenadeAI()
{
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Grenade Function Starting");
    talent tUse;
    object oCheck = GN_FindGrenadeTarget();
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Grenade Target = " + GN_ITS(GetIsObjectValid(oCheck)));
    int nDroid;
    if(GetIsObjectValid(oCheck))
    {
         if(GetRacialType(oCheck) == RACIAL_TYPE_DROID)
         {
            nDroid == TRUE;
         }
         tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_GRENADE, nDroid);
         if(GetIsTalentValid(tUse))
         {
            GN_MyPrintString("GENERIC DEBUG *************** Clear 1460");
            ClearAllActions();
            ActionUseTalentOnObject(tUse, oCheck);
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Success");
            return TRUE;
         }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Failure");
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Boss AI: AOE Power
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Run Boss AOE Force Power Routine
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
int GN_RunBossAOEPowerRoutine()
{
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Function Starting");
    talent tUse;
    object oCheck = GN_FindAOETarget();
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Target = " + GN_ITS(GetIsObjectValid(oCheck)));
    int nDroid;
    if(GetIsObjectValid(oCheck))
    {
         if(GetRacialType(oCheck) == RACIAL_TYPE_DROID)
         {
            nDroid == TRUE;
         }
         tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_FORCE_POWER, nDroid);
         if(GetIsTalentValid(tUse))
         {
            ClearAllActions();
            ActionUseTalentOnObject(tUse, oCheck);
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Success");
            return TRUE;
         }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Failure");
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Boss AI: Targeting
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will make boss monsters use targeted
    super powers.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
int GN_RunBossTargetedRoutine()
{
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Start Targeted Action Routine");
    talent tUse;
    object oTarget;
    int nDroid;
    int nRand = d6();
    int nCnt = 1;
    if(nRand < 4){nRand = 1;}
    if(nRand == 4){nRand = 2;}
    if(nRand == 5){nRand = 3;}
    if(nRand == 6){nRand = 4;}

    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Get the #" + GN_ITS(nRand) + " target");

    object oFind = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + GN_ReturnDebugName(oFind));
    while(GetIsObjectValid(oFind) && nCnt <= nRand)
    {
        GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Valid oFind = " + GN_ReturnDebugName(oFind) + " nCnt = " + GN_ITS(nCnt));
        if(GetIsObjectValid(oFind))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Valid oTarget Set As = " + GN_ReturnDebugName(oFind));
            oTarget = oFind;
        }
        nCnt++;
        oFind = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    }

    //DEBUG STATEMENTS
    int nX = TRUE;
    if(nX == TRUE)
    {
        if(GetIsTalentValid(tUse))
        {
            if(GetTypeFromTalent(tUse) == TALENT_TYPE_FEAT)
            {
                GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Talent Feat = " + GN_ITS(GetIdFromTalent(tUse)));
            }
            else if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
            {
                GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Talent Power = " + GN_ITS(GetIdFromTalent(tUse)));
            }
        }
    }
    if(GetIsObjectValid(oTarget))
    {
        if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
        {
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Get Boss Combat Move AI Droid");
            nDroid = TRUE;
        }
        tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_NPC, nDroid);

        tUse = GN_CheckThrowLightSaberUsage(oTarget, tUse);
        tUse = GN_CheckNonDroidForcePower(oTarget, tUse);

        //MODIFIED by Preston Watamaniuk on April 2, 2003
        //Added this check to make the Droid setting was used for non-specific attacks.
        GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Target = " + GN_ITS(GetIsObjectValid(oTarget)));
        GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Talent = " + GN_ITS(GetIsTalentValid(tUse)));
        if(GetIsTalentValid(tUse) && GetIsObjectValid(oTarget))
        {
            ClearAllActions();
            ActionUseTalentOnObject(tUse, oTarget);
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Targeted Power Success");
            return TRUE;
        }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Targeted Failure");
    return FALSE;
}


//::///////////////////////////////////////////////
//:: Boss AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will make boss monsters buff themselves
    and use more force powers or utility devices
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2003
//:://////////////////////////////////////////////
int GN_RunBossAIRoutine(object oIntruder = OBJECT_INVALID)
{
    GN_MyPrintString("GENERIC DEBUG *************** Boss AI Start");

    object oTarget = GN_CheckIfInjured();
    if(GetIsObjectValid(oTarget))
    {
        if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oTarget)) {return TRUE;}
    }
    if(GN_EquipAppropriateWeapon())
    {
       GN_MyPrintString("GENERIC DEBUG *************** Switching Weapons");
    }

    if(GN_RunBossGrenadeAI() == TRUE) {return TRUE;}
    else if(GN_RunBossAOEPowerRoutine() == TRUE) {return TRUE;}
    else if(GN_RunBossTargetedRoutine() ==  TRUE) {return TRUE;}

    GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Fall Through");
    return GN_RunDefaultAIRoutine();
}


//::///////////////////////////////////////////////
//:: Malak AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This AI is just for Darth Malak on the Star
    Forge. It assumes there is only the PC and
    no one else.

    Malak's Force Powers
        Master Speed
        Force Push
        Throw Lightsaber (15)
        Affliction
        Force Resistance
        Imp. Energy Resist
        Lightning (15)
        Force Breach

    This routine is an add-on for boss ai.  It
    tests certain conditions that could be
    occurring in the Malak fight and reacts to them
    in a more agressive manner.

    1. K_END_JEDI_LEFT - Will track the total number
       of entombed Jedi left in the fight.
    2. K_END_MALAK_JEDI_USED - Will track the number
    of Jedi's Malak has personally used in the fight.

*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 29, 2003
//:://////////////////////////////////////////////
int GN_RunMalakAIRoutine()
{
    GN_MyPrintString("GENERIC DEBUG *************** Malak AI Start");
    //int nJediLeft = GetGlobalNumber("K_END_JEDI_LEFT");
    //int nMalakUsed = GetGlobalNumber("K_END_MALAK_JEDI_USED");
    object oPC = GetFirstPC();
    int bJedi, bDist, bAttack;
    float fDist = GetDistanceBetween(OBJECT_SELF, oPC);

    //Check to see if Malak need to become more aggressive
    //Test the number of Jedi to see if the player has used any
    //if(((8 - nJediLeft) < nMalakUsed))
    //{
    //    bJedi = TRUE;
    //}
    //Check to see if the player is running away
    GN_MyPrintString("GENERIC DEBUG *************** Malak Distance to PC = " + FloatToString(GetDistanceBetween(OBJECT_SELF, oPC),4,4));
    if(fDist > 10.0)
    {
        bDist = TRUE;
    }
    if(bDist == TRUE)
    {
        /*
            AI REACTION 2 - Player is keeping his distance.
            1. Force Breach if the player is using speed
            OR
            2. Use Action Attack to Force Jump
        */
        GN_MyPrintString("GENERIC DEBUG *************** Clear 1480");
        ClearAllActions();
        if(GetHasSpellEffect(FORCE_POWER_SPEED_BURST, oPC) ||
           GetHasSpellEffect(FORCE_POWER_KNIGHT_SPEED, oPC) ||
           GetHasSpellEffect(FORCE_POWER_SPEED_MASTERY, oPC))
        {
            talent tBreach = TalentSpell(FORCE_POWER_FORCE_BREACH);
            if(GetIsTalentValid(tBreach))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Using Breach");
                ActionUseTalentOnObject(tBreach, oPC);
            }
            bAttack = TRUE;
        }
        else
        {
            if(fDist > 10.0)
            {
                int nRoll = d3();
                int nPower = -1;
                if(nRoll == 1)
                {
                    nPower = FORCE_POWER_LIGHTNING;
                }
                else if(nRoll == 2)
                {
                    nPower = FORCE_POWER_LIGHT_SABER_THROW;
                }
                else if(nRoll > 2)
                {
                    bAttack = TRUE;
                }
                if(nPower != -1)
                {
                    talent tPower = TalentSpell(nPower);
                    if(GetIsTalentValid(tPower))
                    {
                        GN_MyPrintString("GENERIC DEBUG *************** Malak Using Force Power");
                        ActionUseTalentOnObject(tPower, oPC);
                        return TRUE;
                    }
                }
            }
            bAttack = TRUE;
        }
    }
    if(bAttack == TRUE)
    {
        GN_MyPrintString("GENERIC DEBUG *************** Malak Attacking");
        ActionAttack(oPC);
        return TRUE;
    }
    GN_MyPrintString("GENERIC DEBUG *************** Malak AI Drop Out");
    return FALSE;
}

//RWT-OEI 04/07/04
// GN_SetHealPercentage
// Determines what percentage the HealerAI does per heal.
// Specific to the calling object
void GN_SetHealPercentage( int nHeal )
{

    SetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_PERCENTAGE, nHeal );

}

//RWT-OEI 04/13/04
// GN_SetHealThreshold
// Sets the threshold at which the HealerAI will try to heal
// Specific to the calling object
void GN_SetHealThreshold( int nPercentage )
{
    SetLocalNumber( OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD, nPercentage );
}

//::///////////////////////////////////////////////
//:: Healer AI Routine: Do Heal
//:: Copyright (c) 2004 Obsidian Entertainment
//:://////////////////////////////////////////////
/*
    This subfunction is only intended to be called
    from within the GN_RunHealerAIRoutine.
    It is what handles the actual healing after
    all the logic, patient selection, and movement
    has been taken care of.

*/
//:://////////////////////////////////////////////
//:: Created By: R.Taylor
//:: Created On: 03/22/04
//:://////////////////////////////////////////////
void HealerAIDoHeal( object oPatient )
{
    //AurPostString( "Now in healeraidoheal", 10, 10, 10.0f );

    //Make sure we're facing the right way
    SetFacingPoint(GetPosition(oPatient));

    int nMaxHP = GetMaxHitPoints( oPatient );
    int nCurHP = GetCurrentHitPoints( oPatient );

    //Determine the percentage to heal.
    int nHealPercentage = GetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_PERCENTAGE);
    if ( !nHealPercentage ) //It wasn't set, so default to 25%
        nHealPercentage = 25;

    int nHealAmount = ( nMaxHP * nHealPercentage ) / 100;

    //int nHealAmount = nMaxHP / 4;

    //Make sure we can't heal them over 100%
    if ( (nMaxHP - nCurHP ) < nHealAmount )
        nHealAmount = nMaxHP - nCurHP;

    //Create and apply the heal effect
    effect eHeal = EffectHeal( nHealAmount );
    ApplyEffectToObject( DURATION_TYPE_INSTANT, eHeal, oPatient );

    //effect eBeam = EffectVisualEffect( VFX_BEAM_STUN_RAY );
    //ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eBeam, OBJECT_SELF, 1.0 );

    effect eBeam = EffectBeam( VFX_BEAM_STUN_RAY, OBJECT_SELF, BODY_NODE_HAND );
    ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eBeam, oPatient, 1.0f );

    effect eHealField;
    if ( GetRacialType( oPatient ) == RACIAL_TYPE_DROID ) {
        eHealField = EffectVisualEffect( 1048 );
    } else {
        eHealField = EffectVisualEffect( VFX_IMP_HEAL );
    }
    ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eHealField, oPatient, 3.0f );
}

//::///////////////////////////////////////////////
//:: Healer AI Routine
//:: Copyright (c) 2004 Obsidian Entertainment
//:://////////////////////////////////////////////
/*
    Creatures using this AI do NOT FIGHT no matter
    what. Instead, they run around looking for
    anyone that is 'friendly' to their faction and
    healing them as long as combat is going on.
    Outside of combat, they'll keep healing until
    no allies are nearby that need healing.
    They do not heal themselves.
    Currently, they restore 25% of their patient's
        HP.

*/
//:://////////////////////////////////////////////
//:: Created By: R.Taylor
//:: Created On: 03/18/04
//:://////////////////////////////////////////////
int GN_RunHealerAIRoutine( object oIntruder )
{
    //First we need to see if we're already actively
    //trying to find someone to heal.
    object oOldTarget = GetHealTarget( OBJECT_SELF );

    if ( GetIsObjectValid( oOldTarget ) && !(GetIsDead( oOldTarget) ) ) {
        //The old target is still valid, let's see if
        //we're close enough to heal them.
        //AurPostString( "We have a heal target", 10, 10, 10.0f );
        float distance = GetDistanceToObject( oOldTarget );
        if ( distance < 3.5 ) { //We're now close enough to heal
            HealerAIDoHeal( oOldTarget );
            //Clear our old target so we don't heal them again
            SetHealTarget( OBJECT_SELF, OBJECT_INVALID );
            if ( GetIsInCombat() )
                DelayCommand( 3.0, GN_DetermineCombatRound( oIntruder ) );
        } else {
            //See if we're still moving
            //AurPostString( "Check if we are still moving", 10, 10, 10.0f );
            int nActionID = GetCurrentAction(OBJECT_SELF);
            if ( nActionID != ACTION_MOVETOPOINT ) {
                //Requeue a move action to get us moving again
                //AurPostString( "Requeue Moving to New Target", 10, 10, 10.0f );
                ActionMoveToObject( oOldTarget, TRUE, 3.0f );
                if ( GetIsInCombat() )
                    DelayCommand( 3.0, GN_DetermineCombatRound( oIntruder ) );
            }
        }
        return 0;
    } else {
        //AurPostString( "Target is dead or invalid, so clear.", 10, 10, 10.0f);
        SetHealTarget( OBJECT_SELF, OBJECT_INVALID );
    }

    //If we get this far, then we do not have a current heal target to
    //focus on.
    //Search through every creature within a 20m radius
    //If they are friendly to this creature, and
    //have HP less than 50%, move over to them and heal
    //them.
    //AurPostString( "We don't have a target yet", 10, 10, 10.0f );
    object oCurTarget = GetFirstObjectInShape(SHAPE_SPHERE, 20.0f,
        GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );

    while ( GetIsObjectValid(oCurTarget) )
    {
        int bHealCurTarget = TRUE;
        //Make sure we're not healing self
        if ( oCurTarget == OBJECT_SELF ) {
            //AurPostString( "Don't heal self.", 10, 10, 10.0f );
            bHealCurTarget = FALSE;
        }

        //Can't heal the dead ones.
        if ( bHealCurTarget && GetIsDead( oCurTarget ) ) {
            //AurPostString( "Cur Target is already dead.", 10, 10, 10.0f );
            bHealCurTarget = FALSE;
        }

        //Heal those we're friendly to
        if ( bHealCurTarget && !(GetIsFriend( oCurTarget ))  ) {
            //AurPostString( "Not friend or neutral to target.", 10, 10, 10.0f );
            bHealCurTarget = FALSE;
        }

        //RWT-OEI 10/05/04
        //If we're NOT Friendly1, only heal droids.
        if ( GetStandardFaction(OBJECT_SELF) != STANDARD_FACTION_FRIENDLY_1 &&
             GetStandardFaction(OBJECT_SELF) != STANDARD_FACTION_FRIENDLY_2 )
        {
            if ( GetRacialType(oCurTarget) != RACIAL_TYPE_DROID )
            {
                bHealCurTarget = FALSE;
            }
        }

        //RWT-OEI 10/05/04
        //If we're neutral, don't heal anyone
        if ( GetStandardFaction(OBJECT_SELF) == STANDARD_FACTION_NEUTRAL )
        {
            bHealCurTarget = FALSE;
        }

        //We have a target that we might heal now if bHealCurTarget = true
        if ( bHealCurTarget ) {
            //AurPostString( "Target eligible for possible healing.", 10, 10, 5.0f);
            //Determine if cur target has less than 50% HP
            int nCurHP = GetCurrentHitPoints( oCurTarget );
            int nMaxHP = GetMaxHitPoints( oCurTarget );
            int nPercentage = ( nCurHP * 100 ) / nMaxHP;

            int nThreshold = GetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD );
            if ( nThreshold < 1 )
                nThreshold = 50;//RWT-OEI 04/13/04 - Default to 50%

            if ( nPercentage < nThreshold ) {
                //AurPostString( "Need to heal this target.", 10, 10, 5.0f );
                //Need to heal this target
                ClearAllActions();

                //Get within 3.5 meters for visual reasons
                float distance = GetDistanceToObject2D( oCurTarget );

                if ( distance > 3.5 ) {
                    //We need to move closer to the object before healing
                    //AurPostString( "Need move closer new target.", 10, 10, 5.0f);

                    //Make sure to store the ID of our current heal target
                    //so we know not to seek out a new target
                    SetHealTarget( OBJECT_SELF, oCurTarget );
                    ActionMoveToObject( oCurTarget, TRUE, 3.0f );
                    if (GetIsInCombat() )
                        DelayCommand( 3.0, GN_DetermineCombatRound( oIntruder ) );
                    return 0;
                } else {
                    //Close enough to heal new target
                    HealerAIDoHeal( oCurTarget );
                    SetHealTarget( OBJECT_SELF, OBJECT_INVALID );
                    if ( GetIsInCombat() )
                        DelayCommand( 3.0, GN_DetermineCombatRound( oIntruder ));
                    return 0;
                }
            } //if percentage < 50
        } //if bHealCurTarget

        oCurTarget = GetNextObjectInShape(SHAPE_SPHERE, 20.0f,
                       GetLocation(OBJECT_SELF), FALSE,
                       OBJECT_TYPE_CREATURE );
    }// while GetObjectIsValid()
    return 0;
}

//::///////////////////////////////////////////////
//:: Skirmish AI Routine
//:: Copyright (c) 2004 Obsidian Entertainment
//:://////////////////////////////////////////////
/*
    This function handles the Skirmish AI.
    Basically, between shooting, the creature will
    move around randomly. This is designed to give
    the illusion of skirmishing and movement during
    combat, when in effect, all it really does is make
    the creature waste a lot combat rounds by moving
    instead of attacking. As a result, creatures using
    this AI will be easier than the same creature
    using the default AI.
    If it returns 0, that means to continue on
    with alternative AI routines. If it returns 1,
    that means it has handled the creature's action
    for now and no other AI routines should be run.
*/
//:://////////////////////////////////////////////
//:: Created By: R.Taylor
//:: Created On: 03/22/04
//:://////////////////////////////////////////////
int GN_RunSkirmishAIRoutine( object oIntruder )
{
    //Creatures on the Skirmish AI will NOT be allowed
    //to use Waypoints, so we'll just borrow the local
    //Number fields that deal with Waypoints: 0, 1, 2
    //0 = # of times this has been called but done \
    //    nothing.

    //If we're already moving, do nothing.
    if ( GetCurrentAction() == ACTION_MOVETOPOINT ) {
        return 1;
    }

    int nTimes = GetLocalNumber( OBJECT_SELF, 0 );
    int nOdds = (nTimes * 100) / 5;
    int nRand = Random( 100 );

    if ( nRand < nOdds ) {//Okay, move and reset Local:0
        vector vNewPos = GetRandomDestination( OBJECT_SELF, 6 );
        float fFacing  = GetFacing( OBJECT_SELF );
        SetLocalNumber( OBJECT_SELF, 0, 0 );
        location lNewLoc = Location( vNewPos, fFacing );
        ActionMoveToLocation( lNewLoc, TRUE );
        return 1;//We handled the action here
    } else {
        // We're not going to move this time, increment Local:0
        nTimes += 1;
        SetLocalNumber( OBJECT_SELF, 0, nTimes );
        return 0;//We didn't control the action at this time
    }

}

//::///////////////////////////////////////////////
//:: Turtle AI Routine
//:: Copyright (c) 2004 Obsidian Entertainment
//:://////////////////////////////////////////////
/*
    This function handles the Turtle AI.
    We needed a special AI for the Drexl Boss
    on Onderon. Basically what happens is the Drexl
    goes into a defensive turtle mode, where he does
    not attack the PC and the party. He absorbs a
    certain amount of damage, then deals it
    off to the player, and or surrounding NPCs

    The damage is stored in local number 15
    We need to keep a tab on how much damage
    is given in this number
*/
//:://////////////////////////////////////////////
//:: Created By: Adam Brennecke
//:: Created On: 07/03/04
//:://////////////////////////////////////////////
int GN_RunTurtleAIRoutine( object oIntruder )
{
    // check how much damage has been done
    int iDmg = GetLocalNumber(OBJECT_SELF,15);

    // check if we are about to die, if so, then don't do the special attack
    if(GetCurrentHitPoints() < 5)
        return TRUE;

    if(iDmg > 30)
    {
        AurPostString("Turtle Special Attack",5,7,5.0);
        iDmg = iDmg / 3;

        // we need to remove the effects on the object so it can roar
        effect e = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(e))
        {
            if(GetEffectType(e) == EFFECT_TYPE_SLEEP)
            {
                DelayCommand(0.1,RemoveEffect(OBJECT_SELF,e));
            }
            else if(GetEffectType(e) == EFFECT_TYPE_PARALYZE)
            {
                DelayCommand(0.1,RemoveEffect(OBJECT_SELF,e));
            }
            else if(GetEffectType(e) == EFFECT_TYPE_VISUAL)
            {
                DelayCommand(0.1,RemoveEffect(OBJECT_SELF,e));
            }

           e = GetNextEffect(OBJECT_SELF);
        }
        // make it look like we are attacking
        ClearAllActions();
        DelayCommand(0.3,ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT,1.0,1.0));

        // apply damage to the three PCs if they are close enough
        int i;
        for(i = 0; i < 3; i++)
        {
            object oTarg = GetPartyMemberByIndex(i);

            if(GetDistanceBetween(OBJECT_SELF,oTarg) < 10.0)
            {
                // saving throws?
                DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(iDmg),oTarg));

                // play special effect
                //effect eVis = EffectBeam(VFX_BEAM_FLAME_SPRAY,OBJECT_SELF,BODY_NODE_HEAD);
                //DelayCommand(0.5,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oTarg,2.0));
            }
        }
        // reset damage counter
        DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_SCREEN_SHAKE),GetFirstPC(),2.0));
        SetLocalNumber(OBJECT_SELF,15,0);
    }
    else
    {
        AurPostString("Turtle Paralyzed Code.",5,6,4.0);
        ClearAllActions();
        //ActionPlayAnimation(ANIMATION_LOOPING_SLEEP,1.0,-1.0);

        // We should look like we are about to die, and on the defensive
        // check to see if we already have the effects applied, if so, don't do it twice
        // this was causing me to have alot of headaches
        int nApplyEffects = 1;
        effect e = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(e))
        {
            if(GetEffectType(e) == EFFECT_TYPE_SLEEP)
                nApplyEffects = 0;

           e = GetNextEffect(OBJECT_SELF);
        }

        if(nApplyEffects)
        {
            //DelayCommand(3.0,ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_FLAME),OBJECT_SELF,100.0)));
            DelayCommand(3.0,ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectSleep(),OBJECT_SELF,100.0)));
            DelayCommand(3.0,ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectParalyze(),OBJECT_SELF,100.0)));
        }
    }

    return TRUE;
}

// DJS-OEI 9/27/2004
// AI for creatures that need to occassionally use Special Abilities.
int GN_RunMonsterPowersAIRoutine(object oIntruder) {

    AurPostString( "Monster Powers AI Routine", 5, 4, 3.0 );
    // This just looks for Monster Powers (which all seem to have 0x1304 as
    // their category.
    talent tPower = GetCreatureTalentRandom( 0x1304, OBJECT_SELF, TALENT_TYPE_SPELL );
    // Fire a power 20% of the time.
    if( d100() < 20 ) {
        // Perform it.
        if(GetIsTalentValid(tPower) && GetCreatureHasTalent(tPower)) {

            if(GetIsObjectValid(oIntruder) && GetIsEnemy(oIntruder)) {
                GN_MyPrintString("GENERIC DEBUG *************** Using Talent on Intruder Target");
                ActionUseTalentOnObject(tPower, oIntruder);
                return TRUE;
            }
            else {
                // Get the nearest enemy and use the ability on it.
                object oDefault = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
                if(GetIsObjectValid(oDefault))
                {
                    GN_MyPrintString("GENERIC DEBUG *************** Using Talent on Determined Target");
                    ActionUseTalentOnObject(tPower, oDefault);
                    return TRUE;
                }
            }
        }
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Shield Activation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Organic Shields are 99 to 107
    Droid shields are 110 to 115

    Scans through all of the shield talents to
    see if the target has a shield to use. If the
    shield is used then the person will never use
    another one. Party members will never use this
    function.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2003
//:://////////////////////////////////////////////
int GN_ActivateForceField()
{
    GN_MyPrintString("GENERIC DEBUG *************** Starting Forcefield Search");
    GN_MyPrintString("GENERIC DEBUG *************** Shield Boolean (" + GN_ITS(SW_FLAG_SHIELD_USED) + ") = " + GN_ITS(GN_GetSpawnInCondition(SW_FLAG_SHIELD_USED)));
    if(GN_GetSpawnInCondition(SW_FLAG_SHIELD_USED) == FALSE && !IsObjectPartyMember(OBJECT_SELF))
    {
        int nCnt, nStop;
        int bValid = FALSE;
        talent tShield;
        if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
        {
            nCnt = 110;
            nStop = 115;
        }
        else
        {
            nCnt = 99;
            nStop = 107;
        }

        while(bValid == FALSE && nCnt <= nStop)
        {
            tShield = TalentSpell(nCnt);
            if(GetCreatureHasTalent(tShield))
            {
                bValid = TRUE;
            }
            else
            {
                nCnt++;
            }
        }

        //RWT-OEI 04/22/04 - Since shield powers aren't necessarially
        //incremental in order anymore, we need to catch some special
        //cases here:
        if ( !bValid ) {//One hasn't been found yet, try special cases
            tShield = TalentSpell( 132 ); //This is the Heat Shield
            if ( GetCreatureHasTalent( tShield ) ) {
                bValid = TRUE;
            }
            // JAB-OEI 7/2/04 added another special case
            if(!bValid)
            {
                tShield = TalentSpell( 257 ); // drexl shield
                if ( GetCreatureHasTalent( tShield ) ) {
                    bValid = TRUE;
                }
            }
        }

        if(bValid)
        {
            GN_MyPrintString("GENERIC DEBUG *************** Clear 1700");
            ClearAllActions();
            ActionUseTalentOnObject(tShield, OBJECT_SELF);
            GN_SetSpawnInCondition(SW_FLAG_SHIELD_USED);
            return TRUE;
        }
        else
        {
            GN_MyPrintString("GENERIC DEBUG *************** Forcefield Search Fallthrough");
            GN_SetSpawnInCondition(SW_FLAG_SHIELD_USED);
            return FALSE;
        }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Forcefield Search Fallthrough");
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Resistance Activation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    20 Resist Force
    41 Force Immunity
    Checks to see if the character has resist force
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2003
//:://////////////////////////////////////////////
//Makes the person activate Resist Elements and Resist Force.
int GN_ActivateResistances()
{
    int bValid = FALSE;
    if(GN_GetSpawnInCondition(SW_FLAG_RESISTANCES_APPLIED) == FALSE && !IsObjectPartyMember(OBJECT_SELF))
    {
        if(GetHitDice(GetFirstPC()) >= 15 || GN_GetSpawnInCondition(SW_FLAG_BOSS_AI))
        {
            talent tResist = TalentSpell(FORCE_POWER_RESIST_FORCE);
            talent tImmune = TalentSpell(FORCE_POWER_FORCE_IMMUNITY);
            talent tUse;
            if(GetCreatureHasTalent(tImmune))
            {
                tUse = tImmune;
                bValid = TRUE;
            }
            else if(GetCreatureHasTalent(tResist))
            {
                tUse = tResist;
                bValid = TRUE;
            }

            if(bValid == TRUE)
            {
                GN_MyPrintString("GENERIC DEBUG *************** Clear 1710");
                ClearAllActions();
                ActionUseTalentOnObject(tUse, OBJECT_SELF);
            }
            GN_SetSpawnInCondition(SW_FLAG_RESISTANCES_APPLIED);
        }
    }

    return bValid;
}



//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Respond to Shout                                           ========  =       =   =======   =       =  =========   ========
//:: Copyright (c) 2001 Bioware Corp.                          =          =       =  =       =  =       =      =      =
//:://////////////////////////////////////////////             =          =       =  =       =  =       =      =      =
/*//                                                           =          =       =  =       =  =       =      =      =
    Catches the shouts and determines the best                 =========  =========  =       =  =       =      =      =========
    course of action for them                                          =  =       =  =       =  =       =      =              =
                                                                       =  =       =  =       =  =       =      =              =
    SetListenPattern(OBJECT_SELF, "GEN_I_WAS_ATTACKED", 1);            =  =       =  =       =  =       =      =              =
    SetListenPattern(OBJECT_SELF, "GEN_I_SEE_AN_ENEMY", 15);   ========   =       =   =======     ======       =      ========
*///
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 16, 2002
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void GN_RespondToShout(object oShouter, int nShoutIndex, object oIntruder = OBJECT_INVALID)
{
    GN_MyPrintShoutString("");
    GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Respond to Shout Started for " + GN_ReturnDebugName(OBJECT_SELF));
    GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Intruder Object = " + GN_ReturnDebugName(oIntruder));

    //RWT-OEI 10/08/04 - If we're neutral, we just don't want to respond to these
    //shouts. Ever. Seriously.
    if ( GetStandardFaction(OBJECT_SELF) == STANDARD_FACTION_NEUTRAL )
    {
        return;
    }

    int nFLAG; //This determines whether the object walksway points instead of attacking.
    int nPartyAI = GetPartyAIStyle(); //Determines how the party should react to intruders
    int nNPC_AI = GetNPCAIStyle(OBJECT_SELF); //Determines how the individual should react in combat

    //MODIFIED by Preston Watamaniuk May 9
    //Put this check into disable shouts being heard by people from different combat zones.
    if(GetLocalNumber(oShouter, SW_NUMBER_COMBAT_ZONE) == GetLocalNumber(OBJECT_SELF, SW_NUMBER_LAST_COMBO) ||
       GetLocalNumber(oShouter, SW_NUMBER_COMBAT_ZONE) == 0 ||
       GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBAT_ZONE) == 0 ||
       IsObjectPartyMember(OBJECT_SELF))
    {
        if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
           && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
           && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF)
           && !GetUserActionsPending())
        {
            GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 1 Pass");
            if(nShoutIndex == 1 && GetIsFriend(oShouter) && oShouter != OBJECT_SELF)
            {
                if((IsObjectPartyMember(OBJECT_SELF) && IsObjectPartyMember(oShouter) && GetSoloMode() == FALSE) ||
                    !IsObjectPartyMember(OBJECT_SELF))
                {
                    GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 2 Pass");
                    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()))
                    {
                        GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 3 Pass");
                        if(GetPartyMemberByIndex(0) != OBJECT_SELF && nPartyAI != PARTY_AISTYLE_PASSIVE && !GetPlayerRestrictMode())
                        {
                            GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 3 Pass");
                            if((IsObjectPartyMember(OBJECT_SELF) && !GetPlayerRestrictMode()) || !IsObjectPartyMember(OBJECT_SELF))
                            {
                                GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 5 Pass");

                                GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Intruder = " + GN_ReturnDebugName(oIntruder));
                                if(GetObjectSeen(oIntruder))
                                {
                                    GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Shout: Determine Combat Round");
                                    GN_MyPrintString("GENERIC SHOUT DEBUG *************** Shout Clear 1800");

                                    ClearAllActions();
                                    GN_DetermineCombatRound(oIntruder);
                                }
                                else if(GetIsObjectValid(oIntruder))
                                {
                                    GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Shout: Move To Intruder");
                                    GN_MyPrintString("GENERIC SHOUT DEBUG ***************= Shout Clear 1900");
                                    ClearAllActions();
                                    float fDistance = 5.0;
                                    /*
                                    if(!GetObjectSeen(oIntruder))
                                    {
                                        fDistance = 3.0;
                                    }
                                    */
                                    //P.W. (June 8) - Put this check in to try and reduce the instances of NPCs running right up
                                    //to their enemies with blasters.
                                    if(GetDistanceBetween(OBJECT_SELF, oIntruder) < 20.0 && !GetObjectSeen(oIntruder))
                                    {
                                        ActionMoveToObject(oIntruder, TRUE, 2.0);
                                    }
                                    else
                                    {
                                        if(GN_GetWeaponType(OBJECT_SELF) == 1)
                                        {
                                            ActionMoveToObject(oIntruder, TRUE, 4.0);
                                        }
                                        else
                                        {
                                            ActionMoveToObject(oIntruder, TRUE, 15.0);
                                        }
                                    }
                                }
                                //MODIFIED by Preston Watamaniuk on May 16th
                                //Added this check to make Party Members attack after the PC engages in combat.
                                else if(IsObjectPartyMember(OBJECT_SELF))
                                {
                                    oIntruder = GetAttackTarget(oShouter);
                                    GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Attack Intruder = " + GN_ReturnDebugName(oIntruder));
                                    if(GetIsObjectValid(oIntruder))
                                    {
                                        GN_DetermineCombatRound(oIntruder);
                                    }
                                    else
                                    {
                                        oIntruder = GetSpellTarget(oShouter);
                                        GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Spell Intruder = " + GN_ReturnDebugName(oIntruder));
                                        if(GetIsObjectValid(oIntruder))
                                        {
                                            GN_DetermineCombatRound(oIntruder);
                                        }
                                    }
                                }
                            }
                            //I AM IN COMBAT
                            else if(nShoutIndex == 15 && GetIsFriend(oShouter) && oShouter != OBJECT_SELF)
                            {
                                if(GetCurrentAction(OBJECT_SELF) == ACTION_INVALID)
                                {
                                    if(GetObjectSeen(oIntruder))
                                    {
                                        GN_MyPrintString("GENERIC SHOUT DEBUG *************** Clear 2000");
                                        ClearAllActions();
                                        GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Attack Intruder = " + GN_ReturnDebugName(oIntruder));
                                        GN_DetermineCombatRound(oIntruder);
                                        //GN_SetSpawnInCondition(SW_FLAG_SHOUTED_AT);
                                    }
                                    else if(GetIsObjectValid(oIntruder))
                                    {
                                        GN_MyPrintString("GENERIC SHOUT DEBUG *************** Clear 2100");
                                        ClearAllActions();
                                        ActionMoveToObject(oIntruder, TRUE, 5.0);
                                        //GN_SetSpawnInCondition(SW_FLAG_SHOUTED_AT);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        else if(GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE))
        {
            GN_MyPrintString("GENERIC SHOUT DEBUG *************** Clear 2200");
            ClearAllActions();
            return;
        }
    }
    /*
    if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
       && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
       && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
    {
        if(GetPartyMemberByIndex(0) != OBJECT_SELF && nPartyAI != PARTY_AISTYLE_PASSIVE && !GetPlayerRestrictMode())
        {
            //P.W.(June 5) It looks stupid, but do not take this out.
            if(GetCurrentAction(OBJECT_SELF) == ACTION_QUEUEEMPTY && !GetUserActionsPending() && !IsObjectPartyMember(OBJECT_SELF))
            {
                if((IsObjectPartyMember(OBJECT_SELF) && IsObjectPartyMember(oShouter) && GetSoloMode() == FALSE) ||
                    !IsObjectPartyMember(OBJECT_SELF))
                {
                    GN_MyPrintString("GENERIC SHOUT DEBUG *************** Hail Mary activated by " + GN_ReturnDebugName(OBJECT_SELF));
                    GN_MyPrintString("GENERIC SHOUT DEBUG *************** Hail Mary Shout Clear 2110");
                    GN_DetermineCombatRound();
                }
            }
        }
    }
    */
    GN_MyPrintShoutString("");
}

//::///////////////////////////////////////////////
//:: SetListeningPatterns
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the correct listen checks on the NPC by
    determining what talents they possess or what
    class they use.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 24, 2001
//:://////////////////////////////////////////////

void GN_SetListeningPatterns()
{
    SetListening(OBJECT_SELF, TRUE);
    SetListenPattern(OBJECT_SELF, "GEN_I_WAS_ATTACKED", 1);
    SetListenPattern(OBJECT_SELF, "GEN_I_AM_DEAD", 3);
    SetListenPattern(OBJECT_SELF, "GEN_CALL_TO_ARMS", 6);
    if(GetHasSpell(FORCE_POWER_SUPRESS_FORCE) || GetHasSpell(FORCE_POWER_FORCE_BREACH))
    {
        SetListenPattern(OBJECT_SELF, "GEN_SUPRESS_FORCE", 9);
    }
    SetListenPattern(OBJECT_SELF, "GEN_GRENADE_TOSSED", 12);
    SetListenPattern(OBJECT_SELF, "GEN_I_SEE_AN_ENEMY", 14);
    SetListenPattern(OBJECT_SELF, "GEN_COMBAT_ACTIVE", 15);

    GN_SetUpWayPoints();

    // JAB-OEI 7/21/04
    // removed because we have a new treasure model in K2
    /*string sTag = GetTag(OBJECT_SELF);
    if(sTag != "Carth" &&
       sTag != "Bastila" &&
       sTag != "Cand" &&
       sTag != "HK47" &&
       sTag != "Jolee" &&
       sTag != "Juhani" &&
       sTag != "Mission" &&
       sTag != "T3M4" &&
       sTag != "Zaalbar" &&
       !GetIsPC(OBJECT_SELF))
    {
        DR_SpawnCreatureTreasure(OBJECT_SELF);
    }*/
    // end removal

    //MODIFIED by Preston Watamaniuk on May 8, 2003
    //Added functionality for dynamic or encounter creatures
    //to latch onto a Zone Controller.
    //GN_MyPrintString("ZONE DEBUG *****************" + IntToString(GetIsEncounterCreature()) + " " + GN_ReturnDebugName(OBJECT_SELF));
    if(GN_GetSpawnInCondition(SW_FLAG_DYNAMIC_COMBAT_ZONE) || GetIsEncounterCreature())
    {
        string sController;
        int nCount = 1;
        object oController, oTest;
        float fNear;
        float fClosest = 100.0;

        for(nCount; nCount < 40; nCount++)
        {
            if(nCount < 10)
            {
                sController = "ZoneController" + "0" + IntToString(nCount);
            }
            else
            {
                sController = "ZoneController" + IntToString(nCount);
            }
            oTest = GetObjectByTag(sController);
            if(GetIsObjectValid(oTest))
            {
                fNear = GetDistanceBetween(OBJECT_SELF, oTest);
                //GN_MyPrintString("ZONING DEBUG ***************** Controller Distance = " + GN_ReturnDebugName(oController) + " " + FloatToString(fNear, 4, 2));
                if(fNear < fClosest)
                {
                    fClosest = fNear;
                    oController = oTest;
                }
            }
        }
        if(GetIsObjectValid(oController) && fClosest < 30.0)
        {
            //GN_MyPrintString("ZONING DEBUG ***************** Setup Controller = " + GN_ReturnDebugName(oController));
            int nZone = StringToInt(GetStringRight(GetTag(oController), 2));
            SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBAT_ZONE, nZone);
        }
    }
}

//::///////////////////////////////////////////////
//:: Check for Poison
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if someone in the party is poisoned.
    If the person is a non-party NPC then they
    check if they are poisoned.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////

object GN_CheckIfPoisoned()
{
    GN_MyPrintString("GENERIC DEBUG *************** Starting Poison Check");
    effect ePoison;
    if(IsObjectPartyMember(OBJECT_SELF))
    {
        int nCnt = 0;
        for(nCnt; nCnt > 2; nCnt++)
        {
            ePoison = GetFirstEffect(GetPartyMemberByIndex(nCnt));
            while(GetIsEffectValid(ePoison))
            {
                if(GetEffectType(ePoison) == EFFECT_TYPE_POISON)
                {
                    return GetPartyMemberByIndex(nCnt);
                }
                ePoison = GetNextEffect(GetPartyMemberByIndex(nCnt));
            }
        }
    }
    else
    {
        ePoison = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(ePoison))
        {
            if(GetEffectType(ePoison) == EFFECT_TYPE_POISON)
            {
                return OBJECT_SELF;
            }
            ePoison = GetNextEffect(OBJECT_SELF);
        }
    }
    GN_MyPrintString("GENERIC DEBUG ***************  Returning Invalid Poison Object");
    return OBJECT_INVALID;
}

//::///////////////////////////////////////////////
//:: Check for Injuries
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns member index +1 or false depending on
    whether the object belongs in the PCs party.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////

object GN_CheckIfInjured()
{
    GN_MyPrintString("GENERIC DEBUG ***************  Starting Injury Check Function");
//RWT-OEI 03/03/04 - Took out this check that used the TYPE_DROID racial query. It didn't make
//  a bit of sense. Having it in there made it so that NPC droids are checking Party Characters
//  to determine if they are injured, instead of just looking at their own condition.
//  Removing this check made it so that droids will use Repair Kits on themselves now.
//    if(IsObjectPartyMember(OBJECT_SELF) || GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)

    if(IsObjectPartyMember(OBJECT_SELF))
    {

        object oP0=GetPartyMemberByIndex(0);
        object oP1=GetPartyMemberByIndex(1);
        object oP2=GetPartyMemberByIndex(2);

        float fDown00 = 10.0;
        float fDown01 = 10.0;
        float fDown02 = 10.0;

        if(GetIsObjectValid(oP0) && GetRacialType(oP0) != RACIAL_TYPE_DROID)
        {
            fDown00 = IntToFloat(GetCurrentHitPoints(oP0)) / IntToFloat(GetMaxHitPoints(oP0));
        }
        if(GetIsObjectValid(oP1)&& GetRacialType(oP0) != RACIAL_TYPE_DROID)
        {
            fDown01 = IntToFloat(GetCurrentHitPoints(oP1)) / IntToFloat(GetMaxHitPoints(oP1));
        }
        if(GetIsObjectValid(oP2) && GetRacialType(oP0) != RACIAL_TYPE_DROID)
        {
            fDown02 = IntToFloat(GetCurrentHitPoints(oP2)) / IntToFloat(GetMaxHitPoints(oP2));
        }

        if(GetIsObjectValid(oP0) && !GetIsDead(oP0) && (fDown00 < 0.5 && fDown00 > 0.0))
        {
            GN_MyPrintString("GENERIC DEBUG ***************  Return oP0");
            return oP0;
        }
        else if(GetIsObjectValid(oP1) && !GetIsDead(oP1) && (fDown00 < 0.5 && fDown00 > 0.0))
        {
            GN_MyPrintString("GENERIC DEBUG ***************  Return oP1");
            return oP1;
        }
        else if(GetIsObjectValid(oP2) && !GetIsDead(oP2) && (fDown00 < 0.5 && fDown00 > 0.0))
        {
            GN_MyPrintString("GENERIC DEBUG ***************  Return oP2");
            return oP2;
        }
    }
    else
    {
        float fNPC = IntToFloat(GetCurrentHitPoints(OBJECT_SELF)) / IntToFloat(GetMaxHitPoints(OBJECT_SELF));
        if(fNPC < 0.5)
        {
            return OBJECT_SELF;
        }
    }
    return OBJECT_INVALID;
}

//RWT-OEI 09/03/04
//Returns TRUE if any of the party members are knocked out.
//Only works if OBJECT_SELF is in the party.
int GN_CheckIfKnockedOut()
{

    object oCurPlayer;
    int i = 0;
    for (i = 0; i < 3; ++i )
    {
        oCurPlayer = GetPartyMemberByIndex(i);
        if ( GetIsObjectValid(oCurPlayer) )
        {
            if ( GetCurrentHitPoints(oCurPlayer) < 1 )
            {
                return TRUE;//Someone is knocked out
            }
        }
    }
    return FALSE;//No one is knocked out
}

//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Generic Talent Routines
//:: Copyright (c) 2001 Bioware Corp.
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int GN_TalentMasterRoutine(int nTalentConstant, object oTarget)
{
    if(GetIsObjectValid(oTarget))
    {
        talent tSpe11_01, tSpe11_02, tSpe11_03, tSpe11_04, tSpe11_05, tSpe11_06, tSpe11_07, tUse;
        int nTalent;
        int bValid = FALSE;
        int bHostile = FALSE;
        if(nTalentConstant == GEN_TALENT_SUPRESS_FORCE)
        {
            nTalent = 0xf021; //Any Area, No Harmful, Dispel, Ranged
        }
        else if(nTalentConstant == GEN_TALENT_REMOVE_POISON)
        {
            bValid = FALSE;
            tSpe11_01 = TalentSpell(FORCE_POWER_HEAL);
            tSpe11_02 = TalentSpell(FORCE_POWER_CURE);
            tSpe11_03 = TalentSpell(67); //Remove Poison Item

            // DJS-OEI 12/11/2003
            tSpe11_04 = TalentSpell(FORCE_POWER_MASTER_HEAL);
            if(GetCreatureHasTalent(tSpe11_01) || GetCreatureHasTalent(tSpe11_02) || GetCreatureHasTalent(tSpe11_04) )
            {
                bValid = TRUE;
                if(GetCreatureHasTalent(tSpe11_01))
                {
                    tUse = tSpe11_01;
                }
                else if(GetCreatureHasTalent(tSpe11_02))
                {
                    tUse = tSpe11_02;
                }
                else if(GetCreatureHasTalent(tSpe11_04))
                {
                    tUse = tSpe11_04;
                }
            }
            else if(GetCreatureHasTalent(tSpe11_03) && oTarget == OBJECT_SELF)
            {
                bValid = TRUE;
                tUse = tSpe11_03;
            }
            //nTalent = 0xff4f;
        }
        else if(nTalentConstant == GEN_TALENT_HEALING)
        {
            bValid = FALSE;
            GN_MyPrintString("GENERIC DEBUG *************** Starting Heal Talent Checks " + GN_ReturnDebugName(OBJECT_SELF));
            tSpe11_01 = TalentSpell(FORCE_POWER_HEAL);
            tSpe11_02 = TalentSpell(FORCE_POWER_CURE);

            // DJS-OEI 12/11/2003
            tSpe11_03 = TalentSpell(FORCE_POWER_MASTER_HEAL);

            if(GetRacialType(OBJECT_SELF) != RACIAL_TYPE_DROID)
            {
                tSpe11_05 = GetCreatureTalentBest(0x1408, 20);
            }
            else
            {
                tSpe11_05 = TalentSpell(128);
                if(!GetCreatureHasTalent(tSpe11_05))
                {
                    tSpe11_05 = TalentSpell(127);
                    if(!GetCreatureHasTalent(tSpe11_05))
                    {
                        tSpe11_05 = TalentSpell(84);
                    }
                }
            }

            tSpe11_06 = TalentSpell(FORCE_POWER_DRAIN_LIFE);
            tSpe11_07 = TalentSpell(FORCE_POWER_DEATH_FIELD);
            tUse;
            bValid = FALSE;

            if(GetCreatureHasTalent(tSpe11_01) || GetCreatureHasTalent(tSpe11_02) || GetCreatureHasTalent(tSpe11_03) )
            {
                GN_MyPrintString("GENERIC DEBUG *************** I have Heal, Improved Heal, or Master Heal");
                bValid = TRUE;
                if(GetCreatureHasTalent(tSpe11_03))
                {
                    tUse = tSpe11_03;
                }
                else if(GetCreatureHasTalent(tSpe11_01))
                {
                    tUse = tSpe11_01;
                }
                else if(GetCreatureHasTalent(tSpe11_02))
                {
                    tUse = tSpe11_02;
                }
            }
            //else if(GetIsTalentValid(tSpe11_05) ||
            else if(GetCreatureHasTalent(tSpe11_05) ||
                    GetCreatureHasTalent(tSpe11_06) ||
                    GetCreatureHasTalent(tSpe11_07))
            {
                if(oTarget == OBJECT_SELF)
                {
                    if(GetCreatureHasTalent(tSpe11_07) && !IsObjectPartyMember(OBJECT_SELF))
                    {
                        GN_MyPrintString("GENERIC DEBUG *************** I have Death Field");
                        bValid = TRUE;
                        bHostile = TRUE;
                        tUse = tSpe11_07;
                    }
                    else if(GetCreatureHasTalent(tSpe11_06) && !IsObjectPartyMember(OBJECT_SELF))
                    {
                        GN_MyPrintString("GENERIC DEBUG *************** I have Drain Life");
                        bValid = TRUE;
                        bHostile = TRUE;
                        tUse = tSpe11_06;
                    }
                    else
                    {
                        GN_MyPrintString("GENERIC DEBUG *************** I have a Med Pack");
                        bValid = TRUE;
                        tUse = tSpe11_05;
                    }
                }
            }
        }
        else if (nTalentConstant == GEN_TALENT_REVITALIZE)
        {
            int nID = GN_GetSeriesRevitalize();
            tUse = TalentSpell(nID);
            bValid = TRUE;
            bHostile = FALSE;
            AurPostString( "Setting up to revitalize.", 20, 26, 5.0f );
        }
        else if(nTalentConstant == GEN_TALENT_BUFF)
        {
            bValid = FALSE;
            //RWT-OEI 10/11/04 - Rewriting this lame function all together.
            //Basically we need to try the different buffs, see if the creature
            //has them, then see if they're already applied. In theory.
            //We need to come up with random spells out of all possible
            //ones. First we'll grab a spell category.

            int nSpellTree = 0;
            talent tBuff_01;
            talent tBuff_02;
            talent tBuff_03;
            talent tBuff_04;
            talent tBuff_05;
            talent tBuff_06;

            if ( GetFirstPC() == OBJECT_SELF )
            {
                //If we're the player character, there's 3 spell trees
                //only we can get, so we want a higher random number.
                nSpellTree = Random(10000) % 9;
            }
            else
            {
                nSpellTree = Random(10000) % 6;
            }

            //First get the 3 possible spells.
            //*ALWAYS* set all 3 spells, even if you need to just
            //duplicate one multiple times, we don't want any of the 3
            //being left over from anything else
            //AurPostString( "Going for tree #" + IntToString(nSpellTree), 20, 30, 2.0f );
            if ( nSpellTree == 0 ) //Speed
            {
                tBuff_01 = TalentSpell(8);// Speed Burst
                tBuff_02 = TalentSpell(34);//Knight Speed
                tBuff_03 = TalentSpell(37);//Master Speed
            }
            else if ( nSpellTree == 1 ) //Armor
            {
                tBuff_01 = TalentSpell(18);//Aura
                tBuff_02 = TalentSpell(24);//Shield
                tBuff_03 = TalentSpell(17);//Armor
            }
            else if ( nSpellTree == 2 ) //Valor
            {
                tBuff_01 = TalentSpell(22);//Valor
                tBuff_02 = TalentSpell(33);//Knight Valor
                tBuff_03 = TalentSpell(36);//Master Valor
            }
            else if ( nSpellTree == 3 ) //Energy Resist
            {
                tBuff_01 = TalentSpell(42);//Energy Resist 1
                tBuff_02 = TalentSpell(40);//Energy Resist 2
                tBuff_03 = TalentSpell(133);//Master energy resist
            }
            else if ( nSpellTree == 4 ) //Barrier
            {
                tBuff_01 = TalentSpell(135);//Force Barrier
                tBuff_02 = TalentSpell(136);//Improved Barrier
                tBuff_03 = TalentSpell(137);//Master Force Barrier
            }
            else if ( nSpellTree == 5 ) //Battle Meditation
            {
                tBuff_01 = TalentSpell(138);//Battle Meditation
                tBuff_02 = TalentSpell(139);//Improved Meditation
                tBuff_03 = TalentSpell(140);//Master Meditation
            }
            else if ( nSpellTree == 6 ) // Crush Opposition
            {
                tBuff_01 = TalentSpell(144);//Crush Opposition I
                tBuff_02 = TalentSpell(145);//Crush Opposition II
                tBuff_03 = TalentSpell(146);//Crush Opposition III
                tBuff_04 = TalentSpell(147);//Crush Opposition IV
                tBuff_05 = TalentSpell(148);//Crush Opposition V
                tBuff_06 = TalentSpell(149);//Crush Opposition VI
            }
            else if ( nSpellTree == 7 ) //Inspire Followers
            {
                tBuff_01 = TalentSpell(167);//Inspire I
                tBuff_02 = TalentSpell(168);//Inspire II
                tBuff_03 = TalentSpell(169);//Inspire III
                tBuff_04 = TalentSpell(170);//Inspire IV
                tBuff_05 = TalentSpell(171);//Inspire V
                tBuff_06 = TalentSpell(172);//Inspire VI
            }
            else if ( nSpellTree == 8 ) // Fury
            {
                tBuff_01 = TalentSpell(164);//Fury
                tBuff_02 = TalentSpell(165);//Improved Fury
                tBuff_03 = TalentSpell(166);//Master Fury
            }
            //Now we have set all the tBuff_## to point to the possible
            //spells for this random roll.
            //Next determine if we even have any of them and if so to
            //set the level of the one we're using in tTemp
            talent tTemp;
            if ( GetIsTalentValid(tBuff_06) &&
                 GetCreatureHasTalent(tBuff_06) )
            {
                tTemp = tBuff_06;
            }
            else if ( GetIsTalentValid(tBuff_05) &&
                      GetCreatureHasTalent(tBuff_06) )
            {
                tTemp = tBuff_05;
            }
            else if ( GetIsTalentValid(tBuff_04) &&
                      GetCreatureHasTalent(tBuff_04) )
            {
                tTemp = tBuff_04;
            }
            else if ( GetIsTalentValid(tBuff_03) &&
                      GetCreatureHasTalent(tBuff_03) )
            {
                tTemp = tBuff_03;
            }
            else if ( GetIsTalentValid(tBuff_02) &&
                      GetCreatureHasTalent(tBuff_02) )
            {
                tTemp = tBuff_02;
            }
            else if ( GetIsTalentValid( tBuff_01 ) &&
                      GetCreatureHasTalent(tBuff_01) )
            {
                tTemp = tBuff_01;
            }

            //Once we get to this point, if tTemp is VALID, then we
            //have picked out a potential buff to cast. Now see if its
            //effects are already active on the creature or not.
            //In order to do that we need to loop through the active effects
            //and see if they came from this specific talent.

            if ( GetIsTalentValid( tTemp ))
            {
                int nSpellID = GetIdFromTalent(tTemp);
                effect eCurEffect = GetFirstEffect(OBJECT_SELF);
                int nCounter = 0;
                while ( GetIsEffectValid(eCurEffect) )
                {
                    nCounter++;
                    if ( GetEffectSpellId(eCurEffect) == nSpellID )
                    {
                        //AurPostString( "I already have talent #" + IntToString( nSpellID ), 20, 31,2.0f );
                        tTemp = TalentSpell(-1);//Set tTemp invalid
                        break;
                    }
                    eCurEffect = GetNextEffect(OBJECT_SELF);
                }
            }

            //If we get down to here, and tTemp is STILL valid, then it is
            //the spell we should cast
            if ( GetIsTalentValid( tTemp ) )
            {
                int nCost = GetSpellBaseForcePointCost(GetIdFromTalent(tTemp));
                if ( nCost <= GetCurrentForcePoints())
                {
                    bValid = TRUE;
                    tUse = tTemp;
                }
            }


/*
            tSpe11_01 = TalentSpell(36); //Master Valor
            tSpe11_02 = TalentSpell(33); //Knight Valor
            tSpe11_03 = TalentSpell(22); //Valor
            int bBuff = FALSE;
            if(GetCreatureHasTalent(tSpe11_01))
            {
                bBuff = TRUE;
                tUse = tSpe11_01;
            }
            else if(GetCreatureHasTalent(tSpe11_02))
            {
                bBuff = TRUE;
                tUse = tSpe11_02;
            }
            else if(GetCreatureHasTalent(tSpe11_03))
            {
                bBuff = TRUE;
                tUse = tSpe11_03;
            }
            GN_MyPrintString("GENERIC DEBUG *************** Spell Effect 22" + GN_ITS(GetHasSpellEffect(22)));
            GN_MyPrintString("GENERIC DEBUG *************** Spell Effect 33" + GN_ITS(GetHasSpellEffect(33)));
            GN_MyPrintString("GENERIC DEBUG *************** Spell Effect 36" + GN_ITS(GetHasSpellEffect(36)));
            if(!GetHasSpellEffect(22) &&
               !GetHasSpellEffect(33) &&
               !GetHasSpellEffect(36) &&
               bBuff == TRUE)
            {
                GN_MyPrintString("GENERIC DEBUG *************** I do have VALOR");
                bValid = TRUE;
            }
            else
            {
                GN_MyPrintString("GENERIC DEBUG *************** I do not have VALOR");
                bValid = FALSE;
            }
*/
        }

        if(bValid == TRUE && bHostile == FALSE)
        {
            GN_MyPrintString("GENERIC DEBUG *************** Clear 2300");
            int nSpell = GetIdFromTalent(tUse);
            GN_MyPrintString("GENERIC DEBUG *************** Spells.2DA ID = " + GN_ITS(nSpell));
            ClearAllActions();
            ActionUseTalentOnObject(tUse, OBJECT_SELF);
            return TRUE;
        }
        else if(bValid == TRUE && bHostile == TRUE)
        {
            oTarget = GN_GetActivePartyMember(TRUE);
            if(GetIsObjectValid(oTarget))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Hostile Heal Targeted On: " + GN_ReturnDebugName(oTarget));
                GN_MyPrintString("GENERIC DEBUG *************** Clear 2400");
                ClearAllActions();
                ActionUseTalentOnObject(tUse, oTarget);
                return TRUE;
            }
        }
        talent tUse2 = GetCreatureTalentBest(nTalent, 20);
        if(GetIsTalentValid(tUse) && !GetHasSpellEffect(GetIdFromTalent(tUse)))
        {
            if(GetIsObjectValid(oTarget))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Clear 2500");
                ClearAllActions();
                GN_MyPrintString("GENERIC DEBUG *************** Target = " + GetName(oTarget) + " Talent Code = " + IntToString(nTalent));
                ActionUseTalentOnObject(tUse, OBJECT_SELF);
                return TRUE;
            }
        }
    }
    GN_MyPrintString("GENERIC DEBUG *************** " + GN_ReturnDebugName(OBJECT_SELF) + " VP = " + GN_ITS(GetCurrentHitPoints())+ "/" + GN_ITS(GetMaxHitPoints()) );
    GN_MyPrintString("GENERIC DEBUG *************** Healing Not Used");
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Last Round Setup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the following struct up so that Last Rounds
    information is easier to access.

    int nLastAction;
    int nLastActionID;
    int nLastTalentCode;
    object oLastTarget;
    int nTalentSuccessCode;
    int nIsLastTargetDebil;
    int nLastCombo;
    int nLastComboIndex;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 26, 2002
//:://////////////////////////////////////////////

void GN_SetLastRoundData()
{
     talent tTalent;

     tPR.oLastTarget = GetLastHostileTarget();
     tPR.nIsLastTargetDebil = GetIsDebilitated(tPR.oLastTarget);
     tPR.nLastAction = GetLastAttackAction();
     if(tPR.nLastAction == ACTION_CASTSPELL)
     {
        tPR.nLastActionID = GetLastForcePowerUsed();
        tPR.nTalentSuccessCode = GetWasForcePowerSuccessful();
        tTalent = TalentSpell(tPR.nLastActionID);
        tPR.nLastTalentCode = GetCategoryFromTalent(tTalent);
     }
     else if(tPR.nLastAction == ACTION_ATTACKOBJECT)
     {
        tPR.nLastActionID = GetLastCombatFeatUsed();
        tPR.nTalentSuccessCode = GetLastAttackResult();
        tTalent = TalentFeat(tPR.nLastActionID);
        tPR.nLastTalentCode = GetCategoryFromTalent(tTalent);
     }
     //tPR.nLastCombo = GetLocalNumber(OBJECT_SELF, SW_NUMBER_LAST_COMBO);
     tPR.nLastComboIndex = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX);
     tPR.nCurrentCombo = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE);
}

//::///////////////////////////////////////////////
//:: Combo Sub Routine
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function determines what move to do
    based on the last part of the combo performed.
    int nLastAction;
    int nLastActionID;
    int nLastTalentCode;
    object oLastTarget;
    int nTalentSuccessCode;
    int nIsLastTargetDebil;
    int nLastCombo;
    int nLastComboIndex;
    int nCurrentCombo;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////
talent GN_GetComboMove(int nBoss = FALSE)
{
    int nRand;
    int nCombo;
    talent tUse;
    int nNPC_AI = GetNPCAIStyle(OBJECT_SELF); //Determines how the individual should react in combat
    GN_MyPrintString("GENERIC DEBUG *************** Starting GetComboMove");

    // FAK - OEI 3/4/04
    // enemy droids with utitlies and no blasters, always use them
    object oItem =   GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON);

    if ( (GetLevelByClass(CLASS_TYPE_COMBATDROID) > 0 ||
                    GetLevelByClass(CLASS_TYPE_EXPERTDROID) > 0)
          && !GN_CheckNPCIsInParty(OBJECT_SELF)
          && !GetIsObjectValid(oItem)
        )
    {
        object oItem1 = GetItemInSlot(INVENTORY_SLOT_LEFTARM);
        object oItem2 = GetItemInSlot(INVENTORY_SLOT_RIGHTARM);
        int    bValid = 1;

        int iCooldown = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN);
        int iCooldownThresh = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN_FIRE);
        if (iCooldownThresh <= 0 || iCooldownThresh >= 10)
        {
            iCooldownThresh = 6;
        }
        if (GetIsObjectValid(oItem1))
        {
            nCombo = SW_COMBO_DROID_UTILITIES;
        }
        else if (GetIsObjectValid(oItem2))
        {
            nCombo = SW_COMBO_DROID_UTILITIES_2;
        }
        else
        {
            bValid = 0;
        }
        iCooldown = iCooldown + 1;
        SetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN, iCooldown);
        if (bValid && iCooldown >= iCooldownThresh)
        {
            SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 3);
            SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);
            SetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN, 0);

            return GN_GetNextTalentInCombo(nCombo);
        }
        else
        {
            SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 0);
            SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, SW_COMBO_INVALID);
        }
    }

    //Is the last combo done?
    if(tPR.nLastComboIndex == 4 || tPR.nLastComboIndex == 0)
    {
        //If so then set the local numbers controlling the combo to 0;
        SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 0);
        SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, 0);
        nRand = d6();
        if(nRand > 0)//This nRand check is place here in case we need to limit combo use later
        {
            //If a Jedi use the jedi routines.
            if(GetLevelByClass(CLASS_TYPE_JEDICONSULAR) > 0 ||
               GetLevelByClass(CLASS_TYPE_JEDIGUARDIAN) > 0 ||
               GetLevelByClass(CLASS_TYPE_JEDISENTINEL) > 0 ||
               GetLevelByClass(CLASS_TYPE_JEDIWEAPONMASTER) > 0 ||  // DJS-OEI 8/19/2004
               GetLevelByClass(CLASS_TYPE_JEDIMASTER) > 0 ||
               GetLevelByClass(CLASS_TYPE_JEDIWATCHMAN) > 0 ||
               GetLevelByClass(CLASS_TYPE_SITHMARAUDER) > 0 ||
               GetLevelByClass(CLASS_TYPE_SITHLORD) > 0 ||
               GetLevelByClass(CLASS_TYPE_SITHASSASSIN) > 0 )
            {
                nCombo = GN_GetStandardJediCombo(nBoss);

                GN_MyPrintString("GENERIC DEBUG *************** Starting Jedi Combo " + GN_FetchComboString(nCombo));

                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 1);
                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);

                return GN_GetNextTalentInCombo(nCombo);
            }
            //If a Droid use these routines
            else if(GetLevelByClass(CLASS_TYPE_COMBATDROID) > 0 ||
                    GetLevelByClass(CLASS_TYPE_EXPERTDROID) > 0)
            {
                nCombo = GN_GetStandardDroidCombo(nBoss);
                GN_MyPrintString("GENERIC DEBUG *************** Starting Droid Combo " + GN_FetchComboString(nCombo));
                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 1);
                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);

                return GN_GetNextTalentInCombo(nCombo);
            }
            //All others.
            else
            {
                nCombo = GN_GetStandardNPCCombo(nBoss);
                GN_MyPrintString("GENERIC DEBUG *************** Starting NPC Combo " + GN_FetchComboString(nCombo));
                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 1);
                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);

                return GN_GetNextTalentInCombo(nCombo);
            }
        }
        else//returning an invalid Talent here will mean action attack.
        {
            return tUse;
        }
    }
    else//if(tPR.nTalentSuccessCode > 0)
    {
        //If the PC is already in a combo then continue that combo
        GN_MyPrintString("GENERIC DEBUG *************** Continuing Combo " + GN_FetchComboString(tPR.nCurrentCombo));
        return GN_GetNextTalentInCombo(tPR.nCurrentCombo);
    }
    return tUse;
}

//::///////////////////////////////////////////////
//:: Check Droid Utility Usage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the target and the droid utility use
    to make sure they are compatible
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 22, 2003
//:://////////////////////////////////////////////
talent GN_CheckDroidUtilityUsage(object oTarget, talent tUse)
{
    int bSwitch;
    GN_MyPrintString("GENERIC DEBUG *************** Starting Droid Talent Double Check");
    if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
    {
        GN_MyPrintString("GENERIC DEBUG *************** Droid Talent is a Spell");
        if(GetIdFromTalent(tUse) == 116 || GetIdFromTalent(tUse) == 117) //STUN RAY
        {
            if(GetRacialType(oTarget) == RACIAL_TYPE_HUMAN)
            {
                return tUse;
            }
            else
            {
                bSwitch = TRUE;
            }
        }
        if(GetIdFromTalent(tUse) == 118 || GetIdFromTalent(tUse) == 119) //SHIELD DISRUPTOR
        {
            if(GetHasSpellEffect(99, oTarget) || GetHasSpellEffect(100, oTarget) || GetHasSpellEffect(101, oTarget) ||
               GetHasSpellEffect(102, oTarget) || GetHasSpellEffect(103, oTarget) || GetHasSpellEffect(104, oTarget) ||
               GetHasSpellEffect(105, oTarget) || GetHasSpellEffect(106, oTarget) || GetHasSpellEffect(107, oTarget) ||
               GetHasSpellEffect(110, oTarget) || GetHasSpellEffect(111, oTarget) || GetHasSpellEffect(112, oTarget) ||
               GetHasSpellEffect(113, oTarget) || GetHasSpellEffect(114, oTarget) || GetHasSpellEffect(115, oTarget))
            {
                return tUse;
            }
            else
            {
                bSwitch = TRUE;
            }
        }
    }
    if(bSwitch == TRUE)
    {
        // DJS-OEI 4/26/2004
        // All of the Ranged combat Feats are 0x1111, not
        // 0x1181. This was causing droids, for instance,
        // to never use their Ranged Feats.
        //talent tFeat = GetCreatureTalentBest(0x1181, 20);
        talent tFeat = GetCreatureTalentBest(0x1111, 20);
        if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
        {
            return tFeat;
        }
        else
        {
            talent Invalid;
            return Invalid;
        }
    }
    return tUse;
}

//::///////////////////////////////////////////////
//:: Throw Lightsaber Check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the target and the force power to make
    sure that a lightsaber is not thrown from close
    range.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 24, 2003
//:://////////////////////////////////////////////
talent GN_CheckThrowLightSaberUsage(object oTarget, talent tUse)
{
    int bSwitch = FALSE;
    if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
    {
        if(GetIdFromTalent(tUse) == FORCE_POWER_LIGHT_SABER_THROW || GetIdFromTalent(tUse) == FORCE_POWER_LIGHT_SABER_THROW_ADVANCED)
        {
            GN_MyPrintString("GENERIC DEBUG *************** Lightsaber Throw Check = " + FloatToString(GetDistanceBetween(OBJECT_SELF, oTarget),4,2));
            if(GetDistanceBetween(OBJECT_SELF, oTarget) < 10.0)
            {
                bSwitch = TRUE;
            }
        }
    }
    if(bSwitch == TRUE)
    {
        talent tFeat = GetCreatureTalentBest(0x1104, 20);
        if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
        {
            return tFeat;
        }
        else
        {
            talent Invalid;
            return Invalid;
        }
    }
    return tUse;
}

//::///////////////////////////////////////////////
//:: Check Droid Force Power Usage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the force power and makes sure it can
    be used on a droid.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On:May 12, 2003
//:://////////////////////////////////////////////
talent GN_CheckNonDroidForcePower(object oTarget, talent tUse)
{
    int bSwitch = FALSE;
    if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
    {
        if(GetIdFromTalent(tUse) == FORCE_POWER_HOLD ||
           GetIdFromTalent(tUse) == FORCE_POWER_HORROR ||
           GetIdFromTalent(tUse) == FORCE_POWER_INSANITY ||
           GetIdFromTalent(tUse) == FORCE_POWER_KILL ||
           GetIdFromTalent(tUse) == FORCE_POWER_PLAGUE ||
           GetIdFromTalent(tUse) == FORCE_POWER_SLEEP ||
           GetIdFromTalent(tUse) == FORCE_POWER_SLOW ||
           GetIdFromTalent(tUse) == FORCE_POWER_STUN ||
           GetIdFromTalent(tUse) == FORCE_POWER_WOUND ||
           GetIdFromTalent(tUse) == FORCE_POWER_AFFLICTION ||
           GetIdFromTalent(tUse) == FORCE_POWER_CHOKE ||
           GetIdFromTalent(tUse) == FORCE_POWER_DEATH_FIELD ||
           GetIdFromTalent(tUse) == FORCE_POWER_DRAIN_LIFE ||
           GetIdFromTalent(tUse) == FORCE_POWER_FEAR ||
           GetIdFromTalent(tUse) == FORCE_POWER_FORCE_SCREAM || // DJS-OEI 8/19/2004
           GetIdFromTalent(tUse) == FORCE_POWER_IMPROVED_FORCE_SCREAM || // DJS-OEI 8/19/2004
           GetIdFromTalent(tUse) == FORCE_POWER_MASTER_FORCE_SCREAM // DJS-OEI 8/19/2004
           )
        {
            if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
            {
                bSwitch = TRUE;
            }
        }
    }
    if(bSwitch == TRUE)
    {
        talent tFeat = GetCreatureTalentBest(0x1104, 20);
        if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
        {
            return tFeat;
        }
        else
        {
            talent Invalid;
            return Invalid;
        }
    }
    return tUse;
}

//::///////////////////////////////////////////////
//:: Play Ambient Animations
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Play the correct animations based on the
    spawn in condition selected.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 4, 2002
//:://////////////////////////////////////////////

void GN_PlayAmbientAnimation()
{
    if(!GetIsInConversation(OBJECT_SELF))
    {
        location lLocal;
        vector vFrnd;
        int nRoll = d2();
        object oFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nRoll, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        if(!GetIsObjectValid(oFriend))
        {
            oFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nRoll, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        }
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        int nHDMe = GetHitDice(OBJECT_SELF);
        int nHDOther = GetHitDice(oFriend);

        if(!GN_CheckShouldFlee() || !GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR))
        {
            if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS))
            {
                vFrnd = GetPosition(oFriend);
                nRoll = d6();
                if(GetIsObjectValid(oFriend) && GetDistanceBetween(oFriend, OBJECT_SELF) < 5.0 && !IsObjectPartyMember(oFriend))
                {
                    SetFacingPoint(vFrnd);
                    GN_MyPrintString("GENERIC DEBUG *************** Clear 2600");
                    ClearAllActions();
                    if(nRoll == 1 || nRoll == 2)
                    {
                        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 3.0);
                    }
                    else if(nRoll == 3)
                    {
                        ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 3.0);
                    }
                    else if(nRoll == 4)
                    {
                        ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0);
                    }
                    else if(nRoll == 5)
                    {
                        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
                    }
                    else if(nRoll == 6)
                    {
                        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
                    }
                }
                else
                {
                    nRoll = d8();
                    if(nRoll == 1)
                    {
                        ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED, 1.0);
                    }
                    else if(nRoll == 2)
                    {
                        ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0);
                    }
                    else if(nRoll == 3)
                    {
                        ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 3.0);
                    }
                    else if(nRoll == 4 || nRoll == 5)
                    {
                        if(GetGender(OBJECT_SELF) == GENDER_MALE)
                        {
                            GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
                            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 20.4);
                            ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
                        }
                        else if(GetGender(OBJECT_SELF) == GENDER_FEMALE)
                        {
                            GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
                            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 13.3);
                            ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
                        }
                    }
                    else if(nRoll == 6)
                    {
                        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
                    }
                    else if(nRoll == 7)
                    {
                        ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
                    }
                    else if(nRoll == 8)
                    {
                        GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
                        ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 5.0);
                        ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
                    }
                }
            }
            else if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE))
            {
                nRoll = d8();
                GN_MyPrintString("GENERIC DEBUG *************** Clear 2700");
                ClearAllActions();
                if(nRoll == 1)
                {
                    ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 2.0);
                }
                else if(nRoll == 2)
                {
                    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0);
                }
                else if(nRoll == 3)
                {
                    //ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 0.75);
                    //ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 0.75);
                }
                else if(nRoll == 4)
                {
                    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0);
                }
                else if(nRoll >= 5)
                {
                    ActionRandomWalk();
                }
            }
        }
        else if(GN_CheckShouldFlee() && GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR))
        {
            GN_CommonAI();
        }
    }
}
//::///////////////////////////////////////////////
//:: Commoner AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If ever engaged in combat they will flee.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 18, 2002
//:://////////////////////////////////////////////
int GN_CommonAI()
{
    GN_MyPrintString("GENERIC DEBUG *************** Start Commoner AI");
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    object oFlee;
    int bValid = TRUE;
    int nIdx = 1;

    object oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL);
    while(GetIsObjectValid(oNeutral) && bValid == TRUE)
    {
        if(GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_1 ||
            GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_2 ||
            GetStandardFaction(oNeutral) == STANDARD_FACTION_INSANE)
        {
            if(GetDistanceBetween(OBJECT_SELF, oNeutral) <= 20.0)
            {
                oFlee = oNeutral;
                bValid = FALSE;
            }
            nIdx++;
            oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nIdx);
        }
        else
        {
            nIdx++;
            oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nIdx);
        }
    }

    if(GetIsObjectValid(oEnemy))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Clear 2710");
        ClearAllActions();
        ActionMoveAwayFromObject(oEnemy, TRUE, 20.0);
        DelayCommand(0.2, ActionDoCommand(GN_ActionDoPostDCRChecks()));
        return TRUE;
    }
    else if(GetIsObjectValid(oFlee))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Object Flee = " + GN_ReturnDebugName(oFlee));
        GN_MyPrintString("GENERIC DEBUG *************** Clear 2720");
        ClearAllActions();
        ActionMoveAwayFromObject(oFlee, TRUE, 20.0);
        DelayCommand(0.2, ActionDoCommand(GN_ActionDoPostDCRChecks()));
        return TRUE;
    }
    return FALSE;
}
//::///////////////////////////////////////////////
//:: Should Commoner Flee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks a number of conditions for a commoner
    to flee.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 20, 2002
//:://////////////////////////////////////////////

int GN_CheckShouldFlee()
{
    int nIdx = 1;
    object oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    object oHostile = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    while(GetIsObjectValid(oNeutral) || GetIsObjectValid(oHostile))
    {
        if(GetIsObjectValid(oHostile))
        {
            return TRUE;
        }
        if(GetIsObjectValid(oNeutral))
        {
            if(GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_1 ||
                GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_2 ||
                GetStandardFaction(oNeutral) == STANDARD_FACTION_INSANE)
            {
                return TRUE;
            }
        }
        nIdx++;
        oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nIdx, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Reset Deactivated Droid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Resets a Droid to his deactivated animation
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 25, 2003
//:://////////////////////////////////////////////

void GN_ResetDroidDeactivationState(object oDroid = OBJECT_SELF)
{
    /*
    GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, FALSE);
    ClearAllActions();
    ActionPlayAnimation(ANIMATION_LOOPING_DEACTIVATE, 1.0, 900.0);
    ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, TRUE));
    */
    ClearAllActions();
    ActionPlayAnimation(ANIMATION_LOOPING_DEACTIVATE, 1.0, -1.0);
    GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, FALSE);
}

//::///////////////////////////////////////////////
//:: Determine Attack Target
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the nearest seen target and oIntruder
    for a valid attack target.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 7, 2002
//:://////////////////////////////////////////////
object GN_DetermineAttackTarget(object oIntruder = OBJECT_INVALID)
{
    GN_MyPrintString("GENERIC DEBUG *************** Starting: Determine Attack Target");

    int nPartyAI = GetPartyAIStyle();
    int nNPC_AI = GetNPCAIStyle(OBJECT_SELF);
    object oTarget;
    object oLastTarget = GetLastHostileTarget();

    GN_MyPrintString("GENERIC DEBUG *************** Intruder = " + IntToString(GetIsObjectValid(oIntruder)) + " Last Target = " + IntToString(GetIsObjectValid(oLastTarget)));

    if(GetIsObjectValid(oIntruder) && !GetIsDead(oIntruder) && !GetIsDebilitated(oIntruder))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Intruder Target Returned = " + ObjectToString(oIntruder));
        return oIntruder;
    }
    else if(GetIsObjectValid(oLastTarget) && !GetIsDead(oLastTarget) && !GetIsDebilitated(oLastTarget))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Last Target Returned = " + ObjectToString(oIntruder));
        return oLastTarget;
    }
    else
    {
        if(nPartyAI == PARTY_AISTYLE_AGGRESSIVE)
        {
            int nCnt = 1;
            GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 249");
            object oATarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
            oTarget = oATarget;
            while(!GetIsDebilitated(oTarget) && GetIsObjectValid(oTarget))
            {
                nCnt++;
                oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
            }
            if(!GetIsObjectValid(oTarget) && GetIsObjectValid(oATarget))
            {
                oTarget = oATarget;
            }
        }
        else if(nPartyAI == PARTY_AISTYLE_DEFENSIVE)
        {
            int nCnt = 0;
            object oHostile;
            while(!GetIsObjectValid(oHostile) && nCnt < 3)
            {
                oHostile = GetLastHostileActor(GetPartyMemberByIndex(nCnt));
                nCnt++;
            }
            if(GetIsObjectValid(oHostile))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 262");
                oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
            }
            else
            {
                oHostile = GetLastHostileTarget(GetPartyMemberByIndex(0));
                if(GetIsObjectValid(oHostile))
                {
                    GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 269");
                    oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
                }
            }
        }
        else if(nPartyAI != PARTY_AISTYLE_PASSIVE)
        {
            GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 275");
            oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        }
        else
        {
            GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 279");
            oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        }
    }
    if(GetIsObjectValid(oTarget))
    {
        GN_MyPrintString("GENERIC DEBUG *************** Attack Target From Determine Attack Target = " + GN_ReturnDebugName(oTarget));
        return oTarget;
    }
    GN_MyPrintString("GENERIC DEBUG *************** No Attack Targets Found");
    return OBJECT_INVALID;
}

//::///////////////////////////////////////////////
//:: Return Talent Code
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function determines the state of the selected
    attack target and what should be done to them.
    If the target is last rounds target then they
    will try not to use failed attack types.

    NOTE: The functionality for area attacks and
    specialized talent use will be coded here.
    For the time being, I will just try to get
    the appropriate cascade of talents being used.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetAttackTalentCode(object oTarget)
{
    GN_MyPrintString("GENERIC DEBUG *************** Starting: Getting Talent Attack Code");

    int nPreviousTalentCode;
    //GN_MyPrintString("GENERIC DEBUG *************** Cooked Return Code  0x0100");

    GN_MyPrintString("GENERIC DEBUG *************** Debilitated = " + IntToString(GetIsDebilitated(oTarget)));

    if(!GetIsDead(oTarget) && GetIsObjectValid(oTarget) && !GetIsDebilitated(oTarget) && GetLastHostileTarget() == oTarget)
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Talent Code: Before GetPreviousTalent");
        nPreviousTalentCode = GN_GetPreviousTalentCode();
        //GN_MyPrintString("GENERIC DEBUG *************** Talent Code: Before If Compare");
        if(GN_CompareTalents(nPreviousTalentCode, 0xf2ff))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Talent Code: 0xff1f");
            if(GN_GetHasViableTalent(0xff1f))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Return Code 0xff1f");
                return 0xff1f;
            }
            if(GN_GetHasViableTalent(0x0100))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
                return 0xf1ff;
            }
        }
        else if(GN_CompareTalents(nPreviousTalentCode, 0xff1f))
        {
            if(GN_GetHasViableTalent(0xf1f0))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
                return 0xf1ff;
            }
        }
    }
    else if(!GetIsDead(oTarget) && GetIsObjectValid(oTarget) && !GetIsDebilitated(oTarget) && GetLastHostileTarget() != oTarget)
    {
        if(GN_GetHasViableTalent(0xf3ff))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf3ff");
            return 0xf3ff;
        }
        if(GN_GetHasViableTalent(0xf2ff))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf2ff");
            return 0xf2ff;
        }
        if(GN_GetHasViableTalent(0xff1f))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xff1f");
            return 0xff1f;
        }
        if(GN_GetHasViableTalent(0xf1ff))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
            return 0xf1ff;
        }
    }
    else if(!GetIsDead(oTarget) && GetIsObjectValid(oTarget) && GetIsDebilitated(oTarget))
    {
        if(GN_GetHasViableTalent(0xf1ff))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
            return 0xf1ff;
        }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xffff");
    return 0xffff;
}

//this function was cut from the generics but is needed
//here to keep scripts from breaking.
void GN_SetDayNightPresence(int nPresenceSetting)
{

}

//RWT-OEI 07/16/04 - Set the amount of damage the exploding, floating
//mine will do.
void GN_SetFloatingMineDamage( int nDamage )
{
    SetLocalNumber( OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD, nDamage );
}

//RWT-OEI 07/16/04 - Set the Range that the mine will start seeking
void GN_SetFloatingMineSeekRange( int nRange )
{
    SetLocalNumber( OBJECT_SELF, SW_NUMBER_HEALERAI_PERCENTAGE, nRange );
}

//RWT-OEI 08/28/04 - GN_CheckRangeFromLeader()
//Keeps the party members within a certain number of meters
//from the party leader when they are in combat.
int GN_CheckRangeFromLeader(float fDistanceLimit)
{
    //This only works on party NPCs.
    if (!IsObjectPartyMember(OBJECT_SELF))
    {
        return 0;
    }

    object oLeader = GetPartyLeader();

    //Make sure we're not the party leader, though
    //this should never happen anyway
    if (OBJECT_SELF == oLeader)
    {
        return 0;
    }

    //Make sure we're not dead.
    if ( GetCurrentHitPoints(OBJECT_SELF) < 1 )
    {
        return 0;
    }

    //Compare distance
    float fCurDistance = GetDistanceToObject2D(oLeader);

    if ( fCurDistance <= fDistanceLimit )
    {
        //AurPostString( "Close enough.", 10,31,5.0f );
        return 0;//We're close enough.
    }

    //If we get here, we're too far from the party leader.
    //See if we are actively moving. If so, leave alone.
    //If not, make us move to leader.

    int nActionID = GetCurrentAction(OBJECT_SELF);

    if ( nActionID == ACTION_MOVETOPOINT )
    {
        //AurPostString( "Actively trying to move to leader.", 10, 34, 2.0f );
        //Leave alone
        return 1;
    }

    //If we get here, we're too far away and are not
    //actively moving, so need a new moveto action
    //AurPostString( "Moving to leader.", 10, 32, 2.0f );
    ClearAllActions();
    ActionMoveToObject(oLeader, TRUE, fDistanceLimit / 2.0f);

    return 1;
}

//RWT_OEI 09/08/04 - GN_CheckRangeFromOwner()
//Keeps party puppets within a certain number of meters from their
//owner when they are in combat.
int GN_CheckRangeFromOwner(float fDistanceLimit)
{

    //Only works on party puppets
    if ( !GetIsPuppet(OBJECT_SELF) )
    {
        return 0;
    }

    object oOwner = GetPUPOwner(OBJECT_SELF);

    if ( !GetIsObjectValid(oOwner) )
    {
        AurPostString( "PUPAI - Unable to find owner. Major error",20, 30, 5.0f );
        return 0;
    }

    //Puppets can never die, so we don't need to bother checking if we're dead.
    //So now move on to comparing distances.
    float fCurDistance = GetDistanceToObject2D(oOwner);

    if ( fCurDistance <= fDistanceLimit )
    {
        //Close enough.
        return FALSE;
    }

    //If we get here, we're too far from the owner.
    //See if we are actively moving. If so, leave alone.
    //If not, make us follow the owner.

    int nActionID = GetCurrentAction(OBJECT_SELF);

    if ( nActionID == ACTION_MOVETOPOINT ||
         nActionID == ACTION_FOLLOWOWNER )
    {
        return TRUE;
    }

    //If we get here, we're too far away and are not
    //actively moving, so need a new followowner action.
    ClearAllActions();
    ActionFollowOwner(2.0f);

    return TRUE;
}

//RWT-OEI 08/28/04 - GN_RangedSupport
//Tries to use ranged weapons, but will switch to melee
//weapons if the 2nd config has melee and they are being
//attacked by someone using melee.
int GN_RunRangedSupportAIRoutine(object oIntruder)
{
    //This only works on party NPCs.
    if (!IsObjectPartyMember(OBJECT_SELF))
    {
        return 0;
    }

    object oLeader = GetPartyLeader();

    //Make sure we're not the party leader, though
    //this should never happen anyway
    if (OBJECT_SELF == oLeader)
    {
        return 0;
    }

    //Make sure we're not dead.
    if ( GetCurrentHitPoints(OBJECT_SELF) < 1 )
    {
        return 0;
    }

    //If this returns TRUE, then it is handling a weapon
    //swapping action this round and we shouldn't do
    //anything else.
    //RWT-OEI 11/01/04 - Only check this if we're in Ranged
    //Suport Mode
    int nCurAI = GetNPCAIStyle(OBJECT_SELF);
    if ( nCurAI == NPC_AISTYLE_PARTY_RANGED )
    {
        if ( GN_CheckRangedPreferred() )
        {
            return 0;
        }
    }

    //If we get here, we need to just go ahead with our normal
    //attack behaviors.
    GN_RunDefaultAIRoutine(oIntruder);

    return 0;
}

//RWT-OEI 08/28/04
//For Party NPCs, will determine if they should switch
//to a Melee configuration or ranged configuration if
//the options are available to them.
//Return 1 if we weren't using the right weapon but were
//able to queue an action to correct it.
//Return 0 if we are using the right weapon or were unable
//to find a better configuration.
int GN_CheckRangedPreferred()
{

    //The main point of this AI function is to
    //try and use ranged as much as possible.
    //So... if we haven't been attacked by
    //melee for X rounds, switch to ranged if we have it
    //If we have been attacked by melee in the last
    //X rounds, switch to melee if we have it.
    //I'm using the LocalNumbers I added for HealerAI
    //since we're not on healer AI if we're here, obviously.
    //int SW_NUMBER_HEALERAI_THRESHOLD = 8;
    //int SW_NUMBER_HEALERAI_PERCENTAGE = 9;
    //1 = Melee
    //2 = Ranged
    int nHitByMelee = GetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD);
    if ( nHitByMelee > 0 )
    {
        //AurPostString( "We have been hit by melee.", 20,21,2.0f);
        nHitByMelee--;
        SetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD, nHitByMelee);

        //Make sure we are using melee weapons right now
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON);
        int nType = 0;

        if ( GetIsObjectValid(oWeapon))
        {
            nType = GN_GetWeaponTypeFromBaseItem(GetBaseItemType(oWeapon));
        }
        //AurPostString( IntToString(nType),20,22,2.0f);
        if ( nType == 2 )
        {
            //We are using ranged but getting hit by melee. See if we
            //should switch to the second config
            object oWeapon2 = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON2);
            int nType2 = 0;
            if ( GetIsObjectValid(oWeapon2) )
            {
                nType2 = GN_GetWeaponTypeFromBaseItem(GetBaseItemType(oWeapon2));
            }
            //AurPostString( IntToString(nType2),20,23,2.0f);
            if ( nType2 != 2 )
            {
                //Our second config is NOT ranged, switch to it
                //AurPostString( "Ranged ----> Melee",20,24,2.0f);
                ClearAllActions();
                ActionSwitchWeapons();
                return 1;
            }
            //Otherwise the other slot is no better, can't do anything.
        }//Otherwise we're not using ranged right now, so stick with what
         //we're using.
     }
     else
     {  //If we haven't been hit by Melee in the last X number of rounds
        //(see KOTOR_HENCH_EVENT_ON_ATTACKED in k_ai_master for the exact
        //number of rounds) then make sure we're using a ranged configuration
        //if we have one
        //AurPostString( "We have not been hit by melee recently", 20, 25, 2.0f);
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON);
        int nType = 0;
        if ( GetIsObjectValid(oWeapon))
        {
            nType = GN_GetWeaponTypeFromBaseItem(GetBaseItemType(oWeapon));
        }

        //AurPostString(IntToString(nType),20,26,2.0f);
        if ( nType != 2 )
        {
            //We're not using a ranged weapon right now, so see if we have
            //ranged in our other config
            object oWeapon2 = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON2);
            int nType2 = 0;
            if ( GetIsObjectValid(oWeapon2) )
            {
                nType2 = GN_GetWeaponTypeFromBaseItem(GetBaseItemType(oWeapon2));
            }
            //AurPostString(IntToString(nType2),20,27,2.0f);
            if ( nType2 == 2 )
            {
                //2nd slot has ranged, so switch to it.
                //AurPostString( "Melee ----> Ranged",20,28,2.0f);
                ClearAllActions();
                ActionSwitchWeapons();
                return 1;
            }
        }//Otherwise our other slot doesn't have ranged either
    }//Otherwise we're already using ranged
    //AurPostString( "Couldn't improve any",20,29,2.0f);
    //If we get here, there was nothing we could do here or
    //everything was already ideal, so just return 0.
    return 0;
}

//RWT-OEI 08/28/04 - GN_IsJedi
//Returns true if the object passed in has one
//of the many Jedi classes.
int GN_IsJedi(object oObject )
{
    if ( GetLevelByClass(CLASS_TYPE_JEDICONSULAR) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_JEDIGUARDIAN) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_JEDISENTINEL) > 0)
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_JEDIWEAPONMASTER) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_JEDIMASTER) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_JEDIWATCHMAN) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_SITHMARAUDER) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_SITHLORD) > 0 )
        return 1;

    if ( GetLevelByClass(CLASS_TYPE_SITHASSASSIN) > 0 )
        return 1;

    return 0;//Not a Jedi.
}

//RWT-OEI 09/08/04
//GN_RuNDefaultPuppetAIRoutine()
//This function decides and executes all
//functions that are not related to staying close
//to the owner.
//In otherwords, the AI should never get to this
//function unless they are already safely within
//range of their owner
int GN_RunDefaultPuppetAIRoutine(object oIntruder)
{
    //AurPostString( "Default Puppet AI", 20, 20, 2.0f );
    //If we're not a party puppet, just run default AI routines
    if ( !GetIsPuppet(OBJECT_SELF) )
    {
        GN_RunDefaultAIRoutine(oIntruder);
        return 0;
    }

    //If the owner is disabled, don't do anything
    object oOwner = GetPUPOwner(OBJECT_SELF);

    if ( !GetIsObjectValid(oOwner) )
    {
        return 0;//This is a major error
    }

    if ( GetCurrentHitPoints(oOwner) < 1 )
    {
        //Owner is disabled, so shut down
        //AurPostString( "Owner is down.", 20, 22, 2.0f );
        ClearAllActions();
        return 0;
    }
    else
    {
        //AurPostString( "Owner has HP: " + IntToString(GetCurrentHitPoints(oOwner)), 20, 21, 2.0f);
    }

    //First priority is to heal any droids in the party that are in need
    //of healing.
    //This var is used to determine which droid
    //in the party to heal, if any.
    object oHealDroid = OBJECT_INVALID;

    int nThreshold = GetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD);
    int nRand = Random(200) % 2;
    if ( nThreshold > 0  && nRand == 1)
    {
        //Check to see if any of the party member droids are damaged.
        //AurPostString( "Checking need to heal.", 20, 20, 4.0f );
        int i = 0;
        for (i = 0; i < 3; ++i )
        {
            object oMember = GetPartyMemberByIndex(i);
            if ( GetIsObjectValid(oMember) )
            {
                if ( GetRacialType(oMember) == RACIAL_TYPE_DROID )
                {
                    int nCurrentHP = GetCurrentHitPoints(oMember);
                    int nMaxHP = GetMaxHitPoints(oMember);

                    int nPercentage = (nCurrentHP * 100) / nMaxHP;

                    if ( nPercentage < nThreshold && nCurrentHP > 0 )
                    {
                        AurPostString( "Found wounded droid in party:" + IntToString(nPercentage) + "/" + IntToString( nThreshold ), 20, 21, 4.0f );
                        //Make sure they're within 10 meters.
                        //TODO: Enable this check once we're confident in the rest.

                        if ( GetDistanceToObject2D(oMember) <= 10.0f )
                        {
                           // AurPostString( "Setting ohealdroid to:" + GetTag(oMember),20,24,4.0f );
                            oHealDroid = oMember;
                            //break;
                        }
                    }
                }
            }
        }

        //AurPostString( "Damaged droid is: " + GetTag(oHealDroid), 20, 25, 4.0f );
        if ( GetIsObjectValid(oHealDroid) )
        {
            ClearAllActions();
            //AurPostString( "Attempting to heal.", 20, 22, 4.0f );
            //If we get here, then we have a valid droid in the party that
            //is in need of healing. Go ahead and take care of it.
            int nHealAmount = GetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_PERCENTAGE);
            if ( nHealAmount < 1 )
            {
                nHealAmount = 10;
            }

            //Face the right direction
            SetFacingPoint(GetPosition(oHealDroid));

            int nCurrentHP = GetCurrentHitPoints(oHealDroid);
            int nMaxHP = GetMaxHitPoints(oHealDroid);

            //Don't heal over 100% health.
            if ( (nMaxHP - nCurrentHP ) < nHealAmount )
            {
                nHealAmount = nMaxHP - nCurrentHP;
            }

            effect eHeal = EffectHeal( nHealAmount );
            ApplyEffectToObject( DURATION_TYPE_INSTANT, eHeal, oHealDroid);

            effect eBeam = EffectBeam( VFX_BEAM_STUN_RAY, OBJECT_SELF, BODY_NODE_HAND);

            ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eBeam, oHealDroid, 1.0f );

            effect eHealField = EffectVisualEffect( 1048 );

            ApplyEffectToObject( DURATION_TYPE_TEMPORARY, eHealField, oHealDroid, 3.0f );

            //Jump out now as this was our action for this round.
            return 0;
        }
    }

    //If owner is in combat, attack his target by default
    if ( !GetIsInCombat(oOwner) )
    {
        return 0;//Don't do any attacks if the owner isn't in combat.
    }

    object oTarget = GetLastHostileTarget(oOwner);

    if ( GetIsObjectValid( oTarget ) && GetObjectSeen(oTarget,OBJECT_SELF))
    {
        //AurPostString( "Ordering an attack.", 20, 23, 2.0f );
        //We have a valid target. Go ahead and attack it too.
        ActionAttack(oTarget);
    }

    return 0;
}

