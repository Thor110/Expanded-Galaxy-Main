//:: k_ai_master
/*
     This is the AI file for the entire
     game.  All the default hen and def
     scripts run through this script.
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"
#include "k_inc_generic"
#include "k_inc_switch"
#include "k_inc_utility"

void main()
{
    int nEvent = GetRunScriptVar();

    //GN_MyPrintString("GENERIC DEBUG *************** Firing k_ai_master for event " + GN_ITS(nEvent) + " on " + GN_ReturnDebugName(OBJECT_SELF));

    switch (nEvent)
    {
        case 3001: //This can replace a determine combat round call without an intruder
        {
            GN_DetermineCombatRound();
        }
        break;
        case 3002: //This can replace a determine combat round call with the GetFirstPC as the intruder
        {
            GN_DetermineCombatRound(GetFirstPC());
        }
        break;
        case 3003: //This can replace a determine combat round call with the Member Index 0 as the intruder
        {
            GN_DetermineCombatRound(GetPartyMemberByIndex(0));
        }
        break;
        /*
        //DEFAULT AI EVENTS
        int KOTOR_DEFAULT_EVENT_ON_HEARTBEAT           = 1001;
        int KOTOR_DEFAULT_EVENT_ON_PERCEPTION          = 1002;
        int KOTOR_DEFAULT_EVENT_ON_COMBAT_ROUND_END    = 1003;
        int KOTOR_DEFAULT_EVENT_ON_ATTACKED= 1005;
        int KOTOR_DEFAULT_EVENT_ON_DAMAGE              = 1006;
        int KOTOR_DEFAULT_EVENT_ON_DEATH               = 1007;
        int KOTOR_DEFAULT_EVENT_ON_DISTURBED           = 1008;
        int KOTOR_DEFAULT_EVENT_ON_BLOCKED             = 1009;
        int KOTOR_DEFAULT_EVENT_ON_FORCE_AFFECTED      = 1010;
        int KOTOR_DEFAULT_EVENT_ON_GLOBAL_DIALOGUE_END = 1011;
        int KOTOR_DEFAULT_EVENT_ON_PATH_BLOCKED        = 1012;
        */
        case 1001: //KOTOR_DEFAULT_EVENT_ON_HEARTBEAT
        {
            object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS) || GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE))
                {
                    string sWay = "WP_" + GetTag(OBJECT_SELF) + "_01";
                    int nSeries = GetLocalNumber(OBJECT_SELF, WALKWAYS_SERIES_NUMBER);
                    if(!GetIsObjectValid(GetObjectByTag(sWay)) && nSeries <= 0)
                    {
                        if(GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT)
                        {
                            if(!GN_GetIsFighting(OBJECT_SELF) && !GetIsObjectValid(oEnemy))
                            {
                                GN_PlayAmbientAnimation();
                            }
                        }
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1001));
            }
        }
        break;
        case 1002: //KOTOR_DEFAULT_EVENT_ON_PERCEPTION
        {
            //GN_MyPrintString("AI MASTER DEBUG *************** PECEPTION EVENT FIRING for " + GN_ReturnDebugName(OBJECT_SELF));
            //GN_MyPrintString("AI MASTER DEBUG *************** Get Last Perceived = " + GN_ReturnDebugName(GetLastPerceived()));

            object oPerceived = GetLastPerceived();
            if(GetCommandable() && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                //Do not bother checking the last target seen if already fighting
                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()))
                {
                    //Check if the last percieved creature was actually seen
                    if(GetLastPerceptionSeen())
                    {
                        if(GetIsEnemy(oPerceived))
                        {
                            float fDelay = GetDistanceBetween(OBJECT_SELF, oPerceived);
                            fDelay = fDelay/10.0;
                            DelayCommand(fDelay/2.0, SetFacingPoint(GetPosition(oPerceived)));

                            //MODIFIED by Preston Watamaniuk on April 10, 2003
                            //Put in the agitation flag so that re-encountered monsters do not delay.
                            if(GN_GetSpawnInCondition(SW_FLAG_STATE_AGITATED) == TRUE)
                            {
                                fDelay = 0.0;
                            }

                            SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                            GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Perception 2");
                            DelayCommand(fDelay, GN_DetermineCombatRound());
                            if(fDelay > 0.0)
                            {
                               GN_SetSpawnInCondition(SW_FLAG_STATE_AGITATED);
                            }
                        }
                    }
                }
                //If the last perception event was hearing based or if someone vanished then go to search mode
                else if ((GetLastPerceptionVanished()) && GetIsEnemy(oPerceived))
                {
                    if(GetAttemptedAttackTarget() == oPerceived ||
                       GetAttemptedSpellTarget() == oPerceived ||
                       GetAttackTarget() == oPerceived)
                    {
                       ClearAllActions();
                       GN_DetermineCombatRound();

                       if(!GetIsObjectValid(GetAttemptedAttackTarget()) &&
                          !GetIsObjectValid(GetAttemptedSpellTarget()) &&
                          !GetIsObjectValid(GetAttackTarget()))
                       {
                           ClearAllActions();
                           ActionMoveToObject(oPerceived, TRUE);
                           ActionAttack(oPerceived);
                       }
                    }
                }
                else if( GetCurrentAction() != ACTION_QUEUEEMPTY )
                {
                    //Check if the last percieved creature was actually seen
                    if(GetLastPerceptionSeen())
                    {
                        if(GetIsEnemy(GetLastPerceived()))
                        {
                            float fDelay = GetDistanceBetween(OBJECT_SELF, oPerceived);
                            fDelay = fDelay/10.0;
                            DelayCommand(fDelay/2.0, SetFacingPoint(GetPosition(oPerceived)));

                            SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                            GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Perception 2");
                            DelayCommand(fDelay, GN_DetermineCombatRound());
                        }
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_PERCEPTION) && GetLastPerceptionSeen())
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1002));
            }
        }
        break;
        case 1003: //KOTOR_DEFAULT_EVENT_ON_COMBAT_ROUND_END
        {
            //This counts the number of combat rounds the creature has seen combat for
            //int nLocal = GetLocalNumber(OBJECT_SELF, SW_NUMBER_LAST_COMBO);
            //nLocal++;
            //SetLocalNumber(OBJECT_SELF, SW_NUMBER_LAST_COMBO, nLocal);
            //GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On End Combat Round");
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetCommandable())
                {
                    SpeakString("GEN_COMBAT_ACTIVE", TALKVOLUME_SILENT_TALK);
                    GN_DetermineCombatRound();
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_COMBAT_ROUND_END))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1003));
            }
        }
        break;
        case 1004: //KOTOR_DEFAULT_EVENT_ON_DIALOGUE
        {
            int nMatch = GetListenPatternNumber();
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_INTERRUPT))
            {
                if( nMatch == -1 )
                {
                    ResetDialogState();
                }
                SignalEvent(OBJECT_SELF, EventUserDefined(1004));
                return;
            }

            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                object oShouter = GetLastSpeaker();
                object oIntruder;
                //AurPostString( "Got Past AI_OFF", 20, 10, 2.0f );
                object oAttacker = GetLastHostileActor(oShouter);
                if(!GetIsObjectValid(oAttacker) || GetIsDead(oAttacker) || !GetObjectSeen(oAttacker, oShouter)
                   || !GetIsEnemy(oAttacker, oShouter))      //RWT-OEI 04/13/04 - Added GetIsEnemy check. IF the guy is neutral to you, then no reason not to have conversation.
                {
                    //AurPostString( "Got Past ObjectValid()" , 10, 15, 2.0f );
                    if(GetCommandable())
                    {
                        //AurPostString( "Got Past Commandable()", 10, 20, 2.0f );
                        if (nMatch == -1)
                        {
                            ClearAllActions();
                            if(GN_GetSpawnInCondition(SW_FLAG_ON_DIALOGUE_COMPUTER))
                            {
                                //AurPostString( "Starting Conversation.", 10, 25, 2.0f );
                                ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_COMPUTER);
                                return;
                            }
                            else
                            {
                                //AurPostString( "Beginning Conversation.", 10, 25, 2.0f );
                                BeginConversation();
                                return;
                            }
                        }
                        else
                        if(nMatch != -1 && GetIsObjectValid(oShouter) && !GetIsPC(oShouter) && GetIsFriend(oShouter))
                        {
                            if (nMatch >= 1)
                            {
                                oIntruder = GetLastHostileActor(oShouter);
                                if(!GetIsObjectValid(oIntruder))
                                {
                                    oIntruder = GetAttemptedAttackTarget();
                                    if(!GetIsObjectValid(oIntruder))
                                    {
                                        oIntruder = GetAttemptedSpellTarget();
                                        if(!GetIsObjectValid(oIntruder))
                                        {
                                            //P.W.(June 3) - More robust perception check on enemies.
                                            oIntruder = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
                                            if(!GetIsObjectValid(oIntruder))
                                            {
                                                GN_MyPrintString("GENERIC DEBUG *************** No Intruder Object For Shout");
                                                oIntruder = OBJECT_INVALID;
                                            }
                                        }
                                    }
                                }
                            }
                            //GN_MyPrintString("GENERIC DEBUG *************** Shout Intruder = " + GN_ReturnDebugName(oIntruder));
                            //GN_MyPrintString("GENERIC DEBUG *************** " + GN_ReturnDebugName(OBJECT_SELF) + " shouted at by: " + GN_ReturnDebugName(oShouter) + " for shout: " + IntToString(nMatch));
                            GN_RespondToShout(oShouter, nMatch, oIntruder);
                        }
                    }
                }
            }
            if( nMatch == -1 )
            {
                //AurPostString( "Got to end. Blah.", 10, 20, 2.0f );
                ResetDialogState();
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1004));
            }
        }
        break;
        case 1005: //KOTOR_DEFAULT_EVENT_ON_ATTACKED
        {
            //Shout that I was attacked
            SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
            //SpeakString("GEN_COMBAT_ACTIVE", TALKVOLUME_SILENT_TALK);
            if(GetCommandable() && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()))
                {
                    GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Attacked");
                    GN_DetermineCombatRound();
                    //Shout that I was attacked
                    SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                    //SpeakString("GEN_COMBAT_ACTIVE", TALKVOLUME_SILENT_TALK);
                }
                else if(GetCurrentAction() == ACTION_QUEUEEMPTY)
                {
                    GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Attacked");
                    GN_DetermineCombatRound();
                    //Shout that I was attacked
                    SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_ATTACKED))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1005));
            }
        }
        break;
        case 1006: //KOTOR_DEFAULT_EVENT_ON_DAMAGE
        {
            if(GetCommandable() && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
                {
                    if(GetIsObjectValid(GetLastDamager()))
                    {
                        //MODIFIED by Preston Watamaniuk on May 9
                        //Put this check in to make sure that people who turn neutral do not get the Determine Combat Round fired
                        if(GetIsEnemy(GetLastDamager()))
                        {
                            if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()))
                            {
                                GN_DetermineCombatRound();
                                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()))
                                {
                                    object oTarget = GetLastDamager();
                                    if(!GetObjectSeen(oTarget) && GetArea(OBJECT_SELF) == GetArea(oTarget))
                                    {
                                        //P.W. (June 8) - Put this check in to try and reduce the instances of NPCs running right up
                                        //to their enemies with blasters.
                                        effect eLink1 = EffectBlind();
                                        RemoveEffect(OBJECT_SELF, eLink1);
                                        if(GetDistanceBetween(OBJECT_SELF, oTarget) < 20.0 && !GetObjectSeen(oTarget))
                                        {
                                            ActionMoveToObject(oTarget, TRUE, 2.0);
                                        }
                                        else
                                        {
                                            if(GN_GetWeaponType(OBJECT_SELF) == 1)
                                            {
                                                ActionMoveToObject(oTarget, TRUE, 4.0);
                                            }
                                            else
                                            {
                                                ActionMoveToObject(oTarget, TRUE, 15.0);
                                            }
                                        }
                                        //ActionMoveToObject(oTarget, TRUE, fRange);
                                        GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Damaged");
                                        ActionDoCommand(GN_DetermineCombatRound());
                                    }
                                }
                            }
                        }
                    }
                }
                else if (!GetIsObjectValid(GetAttemptedSpellTarget()))
                {
                    object oTarget = GetAttackTarget();
                    if(!GetIsObjectValid(oTarget))
                    {
                        oTarget = GetAttemptedAttackTarget();
                    }
                    object oAttacker = GetLastHostileActor();
                    if (GetIsObjectValid(oAttacker) && oTarget != oAttacker && GetIsEnemy(oAttacker) &&
                       (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
                        (GetHitDice(oAttacker) - 2) > GetHitDice(oTarget) ) )
                    {
                        GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Attacked 2");
                        GN_DetermineCombatRound(oAttacker);
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1006));
            }
        }
        break;
        case 1007: //KOTOR_DEFAULT_EVENT_ON_DEATH
        {
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                SpeakString("GEN_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
                //Shout Attack my target, only works with the On Spawn In setup
                SpeakString("GEN_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DEATH))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1007));
            }
        }
        break;
        case 1008: //KOTOR_DEFAULT_EVENT_ON_DISTURBED
        {
            //NOT USED
        }
        break;
        case 1009: //KOTOR_DEFAULT_EVENT_ON_BLOCKED
        {
            object oDoor = GetBlockingDoor();
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetIsObjectValid(oDoor))
                {
                    if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_OPEN))
                    {
                        DoDoorAction(oDoor, DOOR_ACTION_OPEN);
                    }
                    else if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_BASH))
                    {
                        DoDoorAction(oDoor, DOOR_ACTION_BASH);
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_BLOCKED))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1009));
            }
        }
        break;
        case 1010: //KOTOR_DEFAULT_EVENT_ON_FORCE_AFFECTED
        {
            object oCaster = GetLastSpellCaster();
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetLastSpellHarmful())
                {
                    if(!GetIsObjectValid(GetAttackTarget()) &&
                     !GetIsObjectValid(GetAttemptedSpellTarget()) &&
                     !GetIsObjectValid(GetAttemptedAttackTarget()) &&
                     GetIsObjectValid(oCaster) &&
                     //GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)) &&
                     GetCommandable() )
                    {
                        GN_MyPrintString("GENERIC DEBUG *************** Determine Combat Round from On Spell Cast At");
                        GN_DetermineCombatRound(oCaster);
                        //Shout Attack my target, only works with the On Spawn In setup
                        //SpeakString("GEN_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
                        //Shout that I was attacked
                        SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_SPELL_CAST_AT))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1010));
            }
        }
        break;
        case 1011: //KOTOR_DEFAULT_EVENT_ON_GLOBAL_DIALOGUE_END
        {
            GN_MyPrintString("GENERIC DEBUG *************** Starting Post Dialogue Event for " + GN_ReturnDebugName(OBJECT_SELF));
            //Added by Aidan March 27,03
            // this allows fleeing creatures to become active after conversation
            if(GetIsEnemy(GetFirstPC()) &&
               GetCommandable() == FALSE)
            {
                SetCommandable(TRUE);
            }

            //MODIFIED by Preston Watamaniuk on April 25, 2003
            //Put LOS check in for enemies to make a Determine Combat Round is appropriate.

            //If they drop through this function the end result is a GN_WalkWayPoints() call.
            if(GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
            {
                if(!IsObjectPartyMember(OBJECT_SELF))
                {
                    DelayCommand(0.2, GN_DetermineCombatRound());
                }
            }
            //P.W.(May 20, 2003) - Put an AI flag check here to make sure people do not move against their will.
            else if(GN_GetSpawnInCondition(SW_FLAG_AI_OFF) == FALSE)
            {
                if(GN_DoPostDCRChecks())
                {
                    GN_MyPrintString("GENERIC DEBUG *************** End Coversation Successful Fall through");
                }
            }

            //JAB-OEI5/21/04
            //Made this change from SW_FLAG_EVENT_DIALOGUE_END
            //The user defined event was not getting called because of this
            //We didn't want to make the change to all the on spawn scripts
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1011));
            }
        }
        break;
        case 1012: //KOTOR_DEFAULT_EVENT_ON_PATH_BLOCKED
        {
           object oBlocker = GetBlockingCreature();
           object oEnemy = GetFoundEnemyCreature();

           AurPostString(GN_ReturnDebugName(oBlocker),0,15,2.0);
           AurPostString(GN_ReturnDebugName(oEnemy),0,16,2.0);

           if(GetIsObjectValid(oEnemy) && GetCommandable() && oEnemy != GetAttemptedAttackTarget())
           {
              // we have tried moving around a creature and encountered a creature that is hostile.
              if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
                 && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
                 && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
              {
                   GN_MyPrintString("GENERIC DEBUG *************** Combat Blocked " + GN_ReturnDebugName(oEnemy));
                   GN_MyPrintString("GENERIC DEBUG *************** Combat Blocked Clear (PICK an Number preston)");
                   ClearAllActions();
                   GN_DetermineCombatRound(oEnemy);
              }
           }
           if(!GetIsObjectValid(oEnemy) && GetCommandable() )
           {
            // we are blocked and have no way around this creature.
            // what should happen?
           }
        }
        break;
        /*
        //HENCHMEN AI EVENTS
        int KOTOR_HENCH_EVENT_ON_HEARTBEAT           = 2001;
        int KOTOR_HENCH_EVENT_ON_PERCEPTION          = 2002;
        int KOTOR_HENCH_EVENT_ON_COMBAT_ROUND_END    = 2003;
        int KOTOR_HENCH_EVENT_ON_DIALOGUE            = 2004;
        int KOTOR_HENCH_EVENT_ON_ATTACKED            = 2005;
        int KOTOR_HENCH_EVENT_ON_DAMAGE              = 2006;
        int KOTOR_HENCH_EVENT_ON_DEATH               = 2007;
        int KOTOR_HENCH_EVENT_ON_DISTURBED           = 2008;
        int KOTOR_HENCH_EVENT_ON_BLOCKED             = 2009;
        int KOTOR_HENCH_EVENT_ON_FORCE_AFFECTED      = 2010;
        int KOTOR_HENCH_EVENT_ON_GLOBAL_DIALOGUE_END = 2011;
        int KOTOR_HENCH_EVENT_ON_PATH_BLOCKED        = 2012;
        int KOTOR_HENCH_EVENT_ON_ENTER_5m            = 2013;
        int KOTOR_HENCH_EVENT_ON_EXIT_5m             = 2014;
        */
        case 2001: //KOTOR_HENCH_EVENT_ON_HEARTBEAT
        {
            object oEnemy = GetNearestCreature(CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
            //GN_SetSpawnInCondition(SW_FLAG_SHOUTED_AT, FALSE);

            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF) && !GetSoloMode())
            {
                if(GetPartyMemberByIndex(0) != OBJECT_SELF)
                {
                    if(IsObjectPartyMember(OBJECT_SELF) &&  //Note that this check replaces GetIsObjectValid(oMaster)
                       //GetCurrentAction(OBJECT_SELF) != ACTION_FOLLOW &&
                       GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT &&
                       //GetCurrentAction(OBJECT_SELF) != ACTION_WAIT &&
                       GetCurrentAction(OBJECT_SELF) != ACTION_FOLLOWLEADER &&
                       !GetIsConversationActive() &&
                       //GetDistanceBetween(OBJECT_SELF, GetPartyMemberByIndex(0)) > 4.5 &&
                       !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE) &&
                       GetCommandable() &&
                       // DJS-OEI 3/12/2004
                       // Those that are meditating will only start following if the
                       // currently controlled PC moves more than 15 meters away.
                       ( !IsMeditating( OBJECT_SELF ) ||
                         ( IsMeditating( OBJECT_SELF ) && ( GetDistanceBetween( OBJECT_SELF, GetPartyMemberByIndex(0) ) > 15.0 ) ) ) )
                    {
                        //Db_PostString(GetTag(OBJECT_SELF) + " HEARTBEAT CHECK 1 PASS", 4, 10, 2.0);
                        if(!GN_GetIsFighting(OBJECT_SELF) && !GetIsObjectValid(oEnemy))
                        {
                            //Db_PostString(GetTag(OBJECT_SELF) + " HEARTBEAT CHECK 2 PASS", 4, 12, 2.0);
                            //The distance checking is now down in the script fired from AI Action Update - Leave 5m Radius of party leader.
                            ClearAllActions();
                            ActionFollowLeader();
                        }
                    }
                }
            }
            else if(GetSoloMode() && GetCurrentAction(OBJECT_SELF) == ACTION_FOLLOWLEADER)
            {
                ClearAllActions();
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1001));
            }
        }
        break;
        case 2002: //KOTOR_HENCH_EVENT_ON_PERCEPTION
        {
            GN_PostString("Firing Perception", 10,10,4.0);
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetPartyMemberByIndex(0) != OBJECT_SELF && !GetPlayerRestrictMode())
                {
                    //If the last perception event was hearing based or if someone vanished then go to search mode
                    //Db_MyPrintString("GENERIC DEBUG *************** MONKEY CHECKS: " + GN_ReturnDebugName(OBJECT_SELF));
                    //Db_MyPrintString("GENERIC DEBUG *************** Attempted Attack Target " + GN_ReturnDebugName(GetAttemptedAttackTarget()));
                    //Db_MyPrintString("GENERIC DEBUG *************** Attempted Spell Target " + GN_ReturnDebugName(GetAttemptedSpellTarget()));
                    //Db_MyPrintString("GENERIC DEBUG *************** Attack Target " + GN_ReturnDebugName(GetAttackTarget()));

                    if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
                    {
                        object oGone = GetLastPerceived();
                        if((GetAttemptedAttackTarget() == GetLastPerceived() ||
                           GetAttemptedSpellTarget() == GetLastPerceived() ||
                           GetAttackTarget() == GetLastPerceived()) && GetArea(GetLastPerceived()) != GetArea(OBJECT_SELF))
                        {
                           ClearAllActions();
                           GN_DetermineCombatRound();
                        }
                    }
                    //Do not bother checking the last target seen if already fighting

                    else if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()) )
                    {
                        //Check if the last percieved creature was actually seen
                        if(GetLastPerceptionSeen())
                        {
                            if(GetIsEnemy(GetLastPerceived()))
                            {
                                object oLeader = GetPartyMemberByIndex(0);
                                if(GetIsObjectValid(GetAttackTarget(oLeader)))
                                {
                                    GN_PostString("Perception Attack", 10,12,4.0);
                                    //SetFacingPoint(GetPosition(GetLastPerceived()));
                                    //SpeakString("GEN_COMBAT_ACTIVE", TALKVOLUME_SILENT_TALK);
                                    SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);
                                    GN_DetermineCombatRound();
                                }
                            }
                        }
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_PERCEPTION) && GetLastPerceptionSeen())
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1002));
            }
        }
        break;
        case 2003: //KOTOR_HENCH_EVENT_ON_COMBAT_ROUND_END
        {
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                //MODIFIED by Preston Watamaniuk April 14
                //Took out some legacy code for the Endar Spire
                //Changed the shout from Combat Active to I was attacked.

                //P.W. (May 29) - Took out the if below and replaced it with the one check solo mode instead.
                //if(GetPartyMemberByIndex(0) != OBJECT_SELF && !GetPlayerRestrictMode())
                //{
                    Db_MyPrintString("GENERIC DEBUG *************** End of Combat Round: " + GN_ReturnDebugName(OBJECT_SELF));
                    SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                    GN_DetermineCombatRound();
                //}
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_COMBAT_ROUND_END))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1003));
            }
        }
        break;
        case 2004: //KOTOR_HENCH_EVENT_ON_DIALOGUE
        {
            int nMatch = GetListenPatternNumber();
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetCommandable())
                {
                    object oShouter = GetLastSpeaker();
                    object oIntruder;
                    if (nMatch == -1)
                    {
                        ClearAllActions();
                        BeginConversation();
                        return;
                    }
                    else
                    {
                        GN_RespondToShout(oShouter, nMatch, GetLastHostileActor(oShouter));
                    }
                }
            }
            if( nMatch == -1 )
            {
                ResetDialogState();
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1004));
            }
        }
        break;
        case 2005: //KOTOR_HENCH_EVENT_ON_ATTACKED
        {
            //Shout Attack my target, only works with the On Spawn In setup
            //SpeakString("GEN_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
            //Shout that I was attacked
            SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);
            //SpeakString("GEN_COMBAT_ACTIVE", TALKVOLUME_SILENT_TALK);

            //RWT-OEI 08/28/04 - We need to note if we were last attacked
            //by a Melee weapon so we know that we should switch to melee
            //if we can to defend ourselves.
            object oAttacker = GetLastAttacker();
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON,oAttacker);

            int nWeaponType = 0;
            if ( GetIsObjectValid(oWeapon))
            {
                nWeaponType = GN_GetWeaponTypeFromBaseItem(GetBaseItemType(oWeapon));
            }
            if ( nWeaponType == 1 || nWeaponType == 0)
            {
                //Indicate that we are being hit by melee. Use the
                //healer AI local number slots since we don't need
                //them for anything else here
                SetLocalNumber( OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD, 2);
            }

            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetPartyMemberByIndex(0) == OBJECT_SELF)
                {
                    SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                }
                if(GetPartyMemberByIndex(0) != OBJECT_SELF && !GetPlayerRestrictMode())
                {
                    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()) )
                    {
                        if(GetIsObjectValid(GetLastAttacker()))
                        {
                            if(GetArea(GetLastAttacker()) == GetArea(OBJECT_SELF))
                            {
                                if(!GetIsInCombat())
                                {
                                    GN_DetermineCombatRound();
                                }
                            }
                        }
                    }
                }
                else
                {
                    //Shout that I was attacked
                    SpeakString("GEN_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_ATTACKED))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1005));
            }
        }
        break;
        case 2006: //KOTOR_HENCH_EVENT_ON_DAMAGE
        {
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetFirstPC() == OBJECT_SELF &&
                   GetGlobalBoolean("END_BRIDGE_COMBAT") &&
                   GetGlobalBoolean("END_HURT_WARN") == FALSE)
                {
                    SetGlobalBoolean("END_HURT_WARN",TRUE);
                    BarkString(OBJECT_INVALID,10242);
                    PauseGame(TRUE);

                }
                else if(GetPartyMemberByIndex(0) != OBJECT_SELF && !GetPlayerRestrictMode())
                {
                    if(GetCurrentAction() != ACTION_FOLLOWLEADER)
                    {
                        if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
                        {
                            if(GetIsObjectValid(GetLastDamager()))
                            {
                                if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()) )
                                {
                                    GN_DetermineCombatRound();
                                    if(!GN_GetIsFighting(OBJECT_SELF))
                                    {
                                        object oTarget = GetLastDamager();
                                        if(!GetObjectSeen(oTarget) && GetArea(OBJECT_SELF) == GetArea(oTarget))
                                        {
                                            ActionMoveToLocation(GetLocation(oTarget), TRUE);
                                            ActionDoCommand(GN_DetermineCombatRound());
                                        }
                                    }
                                }
                            }
                        }
                        else if (!GetIsObjectValid(GetAttemptedSpellTarget()))
                        {
                            object oTarget = GetAttackTarget();
                            if(!GetIsObjectValid(oTarget))
                            {
                                oTarget = GetAttemptedAttackTarget();
                            }
                            object oAttacker = GetLastHostileActor();
                            if (GetIsObjectValid(oAttacker) && oTarget != oAttacker && GetIsEnemy(oAttacker) &&
                               (GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4) ||
                                (GetHitDice(oAttacker) - 2) > GetHitDice(oTarget) ) )
                            {
                                GN_DetermineCombatRound(oAttacker);
                            }
                        }
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1006));
            }
        }
        break;
        case 2007: //KOTOR_HENCH_EVENT_ON_DEATH
        {

        }
        break;
        case 2008: //KOTOR_HENCH_EVENT_ON_DISTURBED
        {

        }
        break;
        case 2009: //KOTOR_HENCH_EVENT_ON_BLOCKED
        {
            object oDoor = GetBlockingDoor();
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 5)
                {
                    if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_OPEN) && GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 7 )
                    {
                        DoDoorAction(oDoor, DOOR_ACTION_OPEN);
                    }
                    else if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_BASH))
                    {
                        DoDoorAction(oDoor, DOOR_ACTION_BASH);
                    }
                }
            }
            if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_BLOCKED))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1009));
            }
        }
        break;
        case 2013: //KOTOR_HENCH_EVENT_ON_ENTER_5m
        {
            /*
            SetCommandable(TRUE);
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
            {
                if(!GetUserActionsPending())
                {
                    if(GetCurrentAction(GetPartyMemberByIndex(0)) == ACTION_ATTACKOBJECT ||
                       GetCurrentAction(GetPartyMemberByIndex(0)) == ACTION_CASTSPELL)
                    {
                        GN_DetermineCombatRound();
                    }
                }
            }
            */
        }
        break;
        case 2014: //KOTOR_HENCH_EVENT_ON_EXIT_5m
        {
            /*
            if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF) && !GetSoloMode())
            {
                if(GetPartyMemberByIndex(0) != OBJECT_SELF)
                {
                    if(IsObjectPartyMember(OBJECT_SELF) &&  //Note that this check replaces GetIsObjectValid(oMaster)
                       //GetCurrentAction(OBJECT_SELF) != ACTION_FOLLOW &&
                       //GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT &&
                       //GetCurrentAction(OBJECT_SELF) != ACTION_WAIT &&
                       GetCurrentAction(OBJECT_SELF) != ACTION_FOLLOWLEADER &&
                       !GetIsConversationActive() &&
                       GetDistanceBetween(OBJECT_SELF, GetPartyMemberByIndex(0)) > 4.5 &&
                       !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE) &&
                       GetCommandable())
                    {
                        if( //!GetIsInCombat() &&
                            !GetIsObjectValid(GetAttackTarget()) &&
                            !GetIsObjectValid(GetAttemptedAttackTarget()) &&
                            !GetIsObjectValid(GetAttemptedSpellTarget()) )
                        {
                            if(!GetSoloMode())
                            {
                                //The distance checking is now down in the script fired from AI Action Update - Leave 5m Radius of party leader.
                                ClearAllActions();
                                ActionFollowLeader();
                            }
                        }
                    }
                }
            }
            else if(GetSoloMode() && GetCurrentAction(OBJECT_SELF) == ACTION_FOLLOWLEADER)
            {
                ClearAllActions();
            }
            */
        }
        break;
    }
}
