
//:: Script Name
/*
    Desc
*/
//:: Created By:
//:: Copyright (c) 2002 Bioware Corp.
// Modified by JAB-OEI 7/23/04
// Added special scripts for the 711KOR fight with the entire party

#include "k_inc_generic"
#include "k_inc_utility"

void DoSpecialSpawnIn(object pObject);
void DoSpecialUserDefined(object pObject, int pUserEvent);

//Party Member SpawnIns
void DoAttonSpawnIn(object oPartyMember, string sModuleName);
void DoBaoDurSpawnIn(object oPartyMember, string sModuleName);
void DoMandSpawnIn(object oPartyMember, string sModuleName);
void DoDiscipleSpawnIn(object oPartyMember, string sModuleName);
void DoG0T0SpawnIn(object oPartyMember, string sModuleName);
void DoHandmaidenSpawnIn(object oPartyMember, string sModuleName);
void DoHanharrSpawnIn(object oPartyMember, string sModuleName);
void DoHK47SpawnIn(object oPartyMember, string sModuleName);
void DoKreiaSpawnIn(object oPartyMember, string sModuleName);
void DoMiraSpawnIn(object oPartyMember, string sModuleName);
void DoRemoteSpawnIn(object oPartyMember, string sModuleName);
void DoT3M4SpawnIn(object oPartyMember, string sModuleName);
void DoVisasMarrSpawnIn(object oPartyMember, string sModuleName);

//Party Member UserDefs
void DoAttonUserDef(object oPartyMember, int pUserEvent, string sModuleName);
void DoBaoDurUserDef(object oPartyMember, int pUserEvent, string sModuleName);
void DoMandUserDef(object oPartyMember, int pUserEvent, string sModuleName);
void DoDiscipleUserDef(object oPartyMember, int pUserEvent, string sModuleName);
void DoG0T0UserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoHandmaidenUserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoHanharrUserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoHK47UserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoKreiaUserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoMiraUserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoRemoteUserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoT3M4UserDef(object oPartyMember,int pUserEvent, string sModuleName);
void DoVisasMarrUserDef(object oPartyMember,int pUserEvent, string sModuleName);

void DoRemoteDefaultUserDef(object oPartyMember, int pUserEvent);

void Do711UserDef(object oPartyMember,int pUserEvent);

void DoSpecialSpawnIn(object pObject)
{
    AurPostString("DoSpecialSpawnIn" + GetTag(pObject), 18, 18, 3.0);
    if(GetIsObjectValid(pObject))
    {
        string tTag = GetTag(pObject);//should be a party member tag
        string sModuleName = GetModuleName();

        if(tTag == "atton")//Atton Rand
        {
            DoAttonSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "baodur")//Bao-Dur
        {
            DoBaoDurSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "mand")//Canderous
        {
            DoMandSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "disciple")//Disciple
        {
            DoDiscipleSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "g0t0")//G0T0
        {
            DoG0T0SpawnIn(pObject, sModuleName);
        }
        else if(tTag == "handmaiden")//Handmaiden
        {
            DoHandmaidenSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "hanharr")//Hanharr
        {
            DoHanharrSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "hk47")//HK-47
        {
            DoHK47SpawnIn(pObject, sModuleName);
        }
        else if(tTag == "kreia")//Kreia
        {
            DoKreiaSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "mira")//Mira
        {
            DoMiraSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "t3m4")//T3M4
        {
            DoT3M4SpawnIn(pObject, sModuleName);
        }
        else if(tTag == "visasmarr")//Visas Marr
        {
            DoVisasMarrSpawnIn(pObject, sModuleName);
        }
        else if(tTag == "remote")//the Remote is a special case
        {
            DoRemoteSpawnIn(pObject, sModuleName);
        }
        else
        {
            AurPostString("PARTY MEMBER SPAWNIN ERROR!",5,15,20.0);
        }
    }
}

void DoSpecialUserDefined(object pObject, int pUserEvent)
{
    if(GetIsObjectValid(pObject))
    {
        string tTag = GetTag(pObject);//should be a party member tag
        string sModuleName = GetModuleName();

        if(tTag == "atton")//Atton Rand
        {
            DoAttonUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "baodur")//Bao-Dur
        {
            DoBaoDurUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "mand")//Canderous
        {
            DoMandUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "disciple")//Disciple
        {
            DoDiscipleUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "g0t0")//G0T0
        {
            DoG0T0UserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "handmaiden")//Handmaiden
        {
            DoHandmaidenUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "hanharr")//Hanharr
        {
            DoHanharrUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "hk47")//HK-47
        {
            DoHK47UserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "kreia")//Kreia
        {
            DoKreiaUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "mira")//Mira
        {
            DoMiraUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "t3m4")//T3M4
        {
            DoT3M4UserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "visasmarr")//Visas Marr
        {
            DoVisasMarrUserDef(pObject, pUserEvent, sModuleName);
        }
        else if(tTag == "remote")//the Remote is a special case
        {
            DoRemoteUserDef(pObject, pUserEvent, sModuleName);
        }
    }
}


void DoAttonSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");
    int In101PER = (sModuleName == "101PER"); // DJS-OEI 10/1/2004

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        //AssignCommand(oPartyMember, ClearAllActions());
        AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR_COMP2, 1.0, -1.0));
        //set atton's facing
        vector vFacing = GetPositionFromLocation(GetLocation(GetObjectByTag("WP_atton_facing")));
        AssignCommand( OBJECT_SELF, SetFacingPoint(vFacing));
        SetLockOrientationInDialog(oPartyMember, TRUE);
        SetOrientOnClick(oPartyMember, FALSE);
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else if(In101PER){
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_PERCEPTION));
    }
    else
    {//default spawn in
    }
}

void DoBaoDurSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011

        object oBike = GetObjectByTag("WP_baodur_bike");
        if(GetIsObjectValid(oBike))
        {
            vector vBike = GetPositionFromLocation(GetLocation(oBike));
            AssignCommand(oPartyMember, SetFacingPoint(vBike));
            AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));
        }
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoMandSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoDiscipleSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_RANDOM));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION));
        AssignCommand(oPartyMember, SetLocalNumber(OBJECT_SELF, 29, ANIMATION_LOOPING_USE_COMPUTER));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));//turn waypoints on
        AssignCommand(oPartyMember, GN_WalkWayPoints());
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoG0T0SpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_LONG));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION));
        AssignCommand(oPartyMember, SetLocalNumber(OBJECT_SELF, 29, ANIMATION_LOOPING_USE_COMPUTER));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));//turn waypoints on
        AssignCommand(oPartyMember, GN_WalkWayPoints());
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoHandmaidenSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        // JAB-OEI 9/15/04
        AurPostString("k_oei_hench_inc handmaiden spawnin", 19,19,3.0);
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_COMBAT_ROUND_END));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011

    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoHanharrSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_CIRCULAR));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_SHORT));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION));
        AssignCommand(oPartyMember, SetLocalNumber(OBJECT_SELF, 29, ANIMATION_LOOPING_PAUSE3));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));//turn waypoints on
        AssignCommand(oPartyMember, GN_WalkWayPoints());
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoHK47SpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoKreiaSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, -1.0));
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoMiraSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoRemoteSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");
    //SetMinOneHP(oPartyMember,TRUE);//Remote should never die.
    //Remote has its own faction. RWT-OEI 09/08/04
    ChangeToStandardFaction(oPartyMember, STANDARD_FACTION_PARTYPUPPET);
    //Remote has its own combat AI. RWT-OEI 09/08/04
    SetNPCAIStyle(oPartyMember, NPC_AISTYLE_PARTY_REMOTE);


    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_SHORT));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION));
        AssignCommand(oPartyMember, SetLocalNumber(OBJECT_SELF, 29, ANIMATION_LOOPING_USE_COMPUTER));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT));//OPTIONAL BEHAVIOR - Fire User Defined Event 1001
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));//turn waypoints on
        AssignCommand(oPartyMember, GN_WalkWayPoints());
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        //SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT));//OPTIONAL BEHAVIOR - Fire User Defined Event 1001
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011
    }
}

void DoT3M4SpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (!GetGlobalBoolean("003_cutscene_mode")) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_WALK_RANDOM));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_START_AT_NEAREST));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_PAUSE_RANDOM));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_USE_WAYPOINT_ANIMATION));
        AssignCommand(oPartyMember, SetLocalNumber(OBJECT_SELF, 29, ANIMATION_LOOPING_WELD));
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));     //OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));//turn waypoints on
        AssignCommand(oPartyMember, GN_WalkWayPoints());
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void DoVisasMarrSpawnIn(object oPartyMember, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DIALOGUE_END));//OPTIONAL BEHAVIOR - Fire User Defined Event 1011
        AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_SIT_AND_MEDITATE, 1.0, -1.0));
    }
    else if(In711KOR)
    {
        GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DAMAGED);
        SetMinOneHP(oPartyMember,TRUE);
    }
    else
    {//default spawn in
    }
}

void AttonBark( int nChoice ) {
    // DJS-OEI 10/22/2004
    // Don't bark if Atton is in party.
    if( IsObjectPartyMember( OBJECT_SELF ) ) {
        return;
    }

    // Don't bark anything if the player is in
    // another dialogue. If the player is using
    // the console at the time, the barks will
    // pop up on top of the interface.
    if( !GetIsConversationActive() ) {
        switch( nChoice ) {
            case 0:
                BarkString( OBJECT_SELF, 50084 );
                break;
            case 1:
                BarkString( OBJECT_SELF, 50083 );
                break;
            case 2:
                BarkString( OBJECT_SELF, 50086 );
                break;
            case 3:
                BarkString( OBJECT_SELF, 50085 );
                break;
            case 4:
                BarkString( OBJECT_SELF, 50082 );
                break;
        }
    }
}

void DoAttonUserDef(object oPartyMember, int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");
    int In101PER = (sModuleName == "101PER"); // DJS-OEI 10/1/2004

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if(In101PER) {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            {
                // Perform the wandering at the Comm Blister if appropriate.
                // DJS-OEI 10/22/2004
                // Don't do this if Atton is in party.
                //if(!GetLocalBoolean(OBJECT_SELF,58) && GetLocalBoolean(OBJECT_SELF,57))
                if( !GetLocalBoolean(OBJECT_SELF,58) &&
                    GetLocalBoolean(OBJECT_SELF,57) &&
                    !IsObjectPartyMember( OBJECT_SELF ) )
                {
                    //AurPostString("Atton Heartbeat",15,15,5.0);
                    SetLocalBoolean(OBJECT_SELF,58,TRUE);
                    ClearAllActions();
                    ActionWait(7.0);
                    ActionMoveToObject(GetObjectByTag("WP_ATTON_FUTZ1"));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0, 1.0);
                    ActionWait(5.0);
                    ActionMoveToObject(GetObjectByTag("WP_ATTON_FUTZ2"));
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED,1.0,1.0);
                    //ActionBarkString(50084); // Jedi Stuff
                    ActionDoCommand( AttonBark( 0 ) );
                    ActionWait(4.0);
                    ActionMoveToObject(GetObjectByTag("WP_ATTON_FUTZ1"));
                    ActionWait(4.0);
                    ActionMoveToObject(GetObjectByTag("WP_ATTON_FUTZ3"));
                    ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER,1.0,1.0);
                    ActionWait(1.0);
                    //ActionBarkString(50083); // stupid computer
                    ActionDoCommand( AttonBark( 1 ) );
                    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0, 1.0);
                    ActionWait(3.0);
                    ActionMoveToObject(GetObjectByTag("WP_ADMCON_ATTON"));
                    ActionWait(4.0);
                    //ActionBarkString(50086); // try something else
                    ActionDoCommand( AttonBark( 2 ) );
                    ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER,1.0,1.0);
                    ActionDoCommand(SetLocalBoolean(OBJECT_SELF,58,FALSE));
                }
            }break;
            case 1002://PERCEIVE
            {
                // DJS-OEI 10/22/2004
                // Don't do this if Atton is in party.
                //if(GetLocalBoolean(oPartyMember,57))
                if( GetLocalBoolean(oPartyMember,57) &&
                    !IsObjectPartyMember( OBJECT_SELF ) )
                {
                    object oSeen = GetLastPerceived();
                    if(GetIsPC(oSeen) && GetLastPerceptionSeen())
                    {
                        ClearAllActions();
                        ActionWait(3.0);
                        // check if we have been to the mines
                        if(GetGlobalNumber("103PER_Talk_HK50") > 0)
                        {
                            //ActionBarkString(50085);
                            ActionDoCommand( AttonBark( 3 ) );
                        }
                        else
                        {
                            // do other one
                            //ActionBarkString(50082);
                            ActionDoCommand( AttonBark( 4 ) );
                        }
                    }
                }
            }break;
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            {
                // Set the flag to disable Comm Blister wandering.
                SetLocalBoolean(oPartyMember,58,TRUE);
            }break;
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                // Set the flag to fire Comm Blister wandering.
                SetLocalBoolean(oPartyMember,58,FALSE);
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                //AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR_COMP2, 1.0, -1.0));
                //set atton's facing
                vector vFacing = GetPositionFromLocation(GetLocation(GetObjectByTag("WP_atton_facing")));
                AssignCommand( OBJECT_SELF, SetFacingPoint(vFacing));
                SetLockOrientationInDialog(oPartyMember, TRUE);
                SetOrientOnClick(oPartyMember, FALSE);
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoBaoDurUserDef(object oPartyMember, int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                object oBike = GetObjectByTag("WP_baodur_bike");
                if(GetIsObjectValid(oBike))
                {
                    location lBike = GetLocation(oBike);
                    vector vBike = GetPositionFromLocation(lBike);
                    AssignCommand(oPartyMember, SetFacingPoint(vBike));
                    AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));
                }
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoMandUserDef(object oPartyMember, int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoDiscipleUserDef(object oPartyMember, int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                AssignCommand(oPartyMember, GN_WalkWayPoints());
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoG0T0UserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            {
            }break;
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            {
            }break;
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                AssignCommand(oPartyMember, GN_WalkWayPoints());
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoHandmaidenUserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            {


            } break;
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            {

                // BMA-OEI 9/24/2004
                if ( GetLocalBoolean(oPartyMember, 28) ) // Sparring with PC
                {
                    int nHP = GetCurrentHitPoints(GetFirstPC());
                    AurPostString("k_oei_hench_inc " + IntToString(nHP), 5, 5, 2.0);
                    if ( nHP == 1 ) // PC lost
                    {
                        AurPostString("Player has 1 hp, you lose!", 5, 5, 5.0);
                        SetLocalBoolean(oPartyMember, 28, FALSE);
                        SetLocalBoolean(oPartyMember, 26, TRUE);
                        SurrenderToEnemies();
                        CancelCombat(oPartyMember);
                        CancelCombat(GetFirstPC());
                        NoClicksFor(1.2);
                        ChangeToStandardFaction(oPartyMember, STANDARD_FACTION_NEUTRAL);
                        ExecuteScript("k_inc_handfight", oPartyMember, 1);
                    }
                }
            }break;
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            {
                AurPostString("Hand is hurt!", 7, 7, 1.0);
                if ( GetLocalBoolean(oPartyMember, 28) ) // Sparring with PC
                {
                    int nHP = GetCurrentHitPoints(oPartyMember);
                    AurPostString("k_oei_hench_inc " + IntToString(nHP), 8, 8, 2.0);
                    if ( nHP == 1 ) // Hand lost
                    {
                        AurPostString("Hand has 1 hp, you win!", 5, 5, 5.0);
                        SetLocalBoolean(oPartyMember, 28, FALSE);
                        SetLocalBoolean(oPartyMember, 29, TRUE);
                        SurrenderToEnemies();
                        CancelCombat(oPartyMember);
                        CancelCombat(GetFirstPC());
                        NoClicksFor(1.2);
                        ChangeToStandardFaction(oPartyMember, STANDARD_FACTION_NEUTRAL);
                        ExecuteScript("k_inc_handfight", oPartyMember, 0);
                    }
                }
            }break;
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                if( !GetLocalBoolean(oPartyMember, 29) )
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));
                    AssignCommand(oPartyMember, GN_WalkWayPoints());
                }
                else
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, TRUE));
                }
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoHanharrUserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                if( !GetGlobalBoolean("003EBO_HANHARR_MOVE") )
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));
                    AssignCommand(oPartyMember, GN_WalkWayPoints());
                }
                else
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, TRUE));
                }
                }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoHK47UserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoKreiaUserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, -1.0));
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoMiraUserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoRemoteUserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            {
                if( GetGlobalBoolean("003EBO_REMOTE_MOVE") )
                {
                    object oRemoteCrySound = GetObjectByTag("remote_cry");

                    location lRemote = GetLocation(GetObjectByTag("remote"));
                    vector vRemotePosition = GetPositionFromLocation(lRemote);
                    SoundObjectSetPosition(oRemoteCrySound, vRemotePosition);
                    SoundObjectPlay(oRemoteCrySound);
                }
            }break;
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                if( !GetGlobalBoolean("003EBO_REMOTE_MOVE") )
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));
                    AssignCommand(oPartyMember, GN_WalkWayPoints());
                    object oRemoteCrySound = GetObjectByTag("remote_cry");
                    if(GetIsObjectValid(oRemoteCrySound))
                    {
                        SoundObjectStop(oRemoteCrySound);
                    }
                    AssignCommand(oPartyMember, GN_WalkWayPoints());
                }
                else
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, TRUE));
                }
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else if(GetGlobalBoolean("003_cutscene_mode") == FALSE)
    {//default user def
        DoRemoteDefaultUserDef(oPartyMember, pUserEvent);
    }
}

void DoT3M4UserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (!GetGlobalBoolean("003_cutscene_mode")) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                if( !GetGlobalBoolean("003EBO_T3M4_MOVE") )
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));
                    AssignCommand(oPartyMember, GN_WalkWayPoints());
                }
                else
                {
                    AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, TRUE));
                }
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
}


void DoVisasMarrUserDef(object oPartyMember,int pUserEvent, string sModuleName)
{
    int In003EBO = (sModuleName == "003EBO");
    int In711KOR = (sModuleName == "711KOR");

    if(In711KOR)
    {
        Do711UserDef(oPartyMember, pUserEvent);
        return;
    }
    else if( In003EBO && (GetGlobalBoolean("003_cutscene_mode") == FALSE) )
    {
        switch(pUserEvent)
        {
            case 1001://HEARTBEAT
            case 1002://PERCEIVE
            case 1003://END OF COMBAT
            case 1004://ON DIALOGUE
            case 1005://ATTACKED
            case 1006://DAMAGED
            case 1007://DEATH
            case 1008://DISTURBED
            case 1009://BLOCKED
            case 1010://SPELL CAST AT
            {
            }break;
            case 1011://DIALOGUE END
            {
                AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_LOOPING_SIT_AND_MEDITATE, 1.0, -1.0));
            }break;
            case 1100://HOSTILE RETREAT
            {
                AssignCommand(oPartyMember, UT_ReturnToBase());
            }break;
            default:
            {
            }break;
        }
    }
    else
    {//default user def
    }
}

void DoRemoteDefaultUserDef(object oPartyMember,int pUserEvent)
{
    switch(pUserEvent)
    {
        case 1001://HEARTBEAT
        {
         //Note that I'm using SW_NUMBER_COOLDOWN to store the counter for the number of heartbeats the puppet
         //has been more than 10 meters from their owner. If we decide to give this thing an healerAI, we'll
         //need to make new LocalNumbers available as to not overwrite the healerAI parameters.
            float fHeartBeatRate = 2.0f;//Rate at which we requeue heartbeats
            if ( !GetIsPuppet() )
            {//If it is not a party puppet, do nothing
                //AurPostString( "I am not a puppet.", 10, 15, 5.0f );
                return;//This is not an error condition.
            }
            //The first priority is to be within 5 meters of our owner. So check to see that that is the case first.
            object oOwner = GetPUPOwner();
            if ( !GetIsObjectValid(oOwner ))
            {   //It IS a critical error for a party puppet to not have an owner
                AurPostString( "oei_hench::DoRemoteDefaultUserDef - Puppet has no owner. Major error.", 10, 25, 30.0f);
                return;
            }

            int nThreshold = 0;
            if ( GetLocalNumber(OBJECT_SELF, SW_NUMBER_HEALERAI_THRESHOLD ) )
            {
                nThreshold = 90;
            }
            object oHealDroid = OBJECT_INVALID;
            //Before the distance check, look for damaged party droids
            //We don't want to heal if we're in combat, since then healing is
            //being handled by our Combat AI.
            //Don't run the healing AI if owner is unconcious.
            if ( nThreshold > 0  && !GetIsInCombat(oOwner) && (GetCurrentHitPoints(oOwner) > 0))
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
                                //AurPostString( "Found wounded droid in party:" + IntToString(nPercentage) + "/" + IntToString( nThreshold ), 20, 21, 4.0f );
                                //Make sure they're within 10 meters.
                                //TODO: Enable this check once we're confident in the rest.

        //                        if ( GetDistanceToObject2D(oMember) <= 10.0f )
        //                        {
                                    //AurPostString( "Setting ohealdroid to:" + GetTag(oMember),20,24,4.0f );
                                    oHealDroid = oMember;
                                    //break;
        //                        }
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
                    return;
                }
            }

            float fDistance = GetDistanceBetween2D( OBJECT_SELF, oOwner );
            //If we are more than 10.0 meters away for 10 heartbeats, we may need to just give up and teleport ourself
            if ( fDistance >= 10.0f )
            {
                int nCounter = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN);
                if ( nCounter >= 7 )
                {//We have been more than 10 meters away for 7 heartbeats, just teleport to the owner.
                    AurPostString( "Attempting to teleport.", 10, 16, 1.5f );
                    ClearAllActions();
                    ActionJumpToLocation(GetLocation(oOwner));

                    SetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN, 0);
                    DelayCommand( fHeartBeatRate, ForceHeartbeat(OBJECT_SELF) );
                    return;
                }
                else
                {//Otherwise we have been more than 10 meters away for less than 10 HBs. So just increase the counter
                    //AurPostString( "Increasing counter.", 10, 17, 1.5f );
                    ++nCounter;
                    SetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN, nCounter);
                }
            }
            else
            {//Make sure to reset the counter
                SetLocalNumber(OBJECT_SELF, SW_NUMBER_COOLDOWN, 0);
            }
            //If we get here, we're between 2 and 10 meters, or over 10 meters
            //but not for more than 10 heartbeat updates. Try to move normally to owner.
            if ( fDistance > 2.0f  )
            {
                //AurPostString( "I need to move closer.", 10, 18, 1.5f );
                //We are more than 5 meters apart. We need to move closer
                int nActionID = GetCurrentAction(OBJECT_SELF);
                if ( (nActionID != ACTION_MOVETOPOINT) &&   (nActionID != ACTION_FOLLOWOWNER) )
                {//If we're already moving, finish moving. This may end up being a problem. We'll see.
                    //AurPostString( "Queueing new move action.", 10, 19, 5.0f );
                    ClearAllActions();
                    ActionFollowOwner(2.0);
                    DelayCommand(fHeartBeatRate, ForceHeartbeat(OBJECT_SELF));
                    return;
                }
            }
        }break;
        case 1002://PERCEIVE
        case 1003://END OF COMBAT
        case 1004://ON DIALOGUE
        case 1005://ATTACKED
        case 1006://DAMAGED
        case 1007://DEATH
        case 1008://DISTURBED
        case 1009://BLOCKED
        case 1010://SPELL CAST AT
        {
        }break;
        case 1011://DIALOGUE END
        {
        }break;
        case 1100://HOSTILE RETREAT
        {
            AssignCommand(oPartyMember, UT_ReturnToBase());
        }break;
        default:
        {
        }break;
    }
}

// we need to check if we take damage, and if we do, we need to delete ourselves
void Do711UserDef(object oPartyMember,int pUserEvent)
{
    switch(pUserEvent)
    {
        case 1006://DAMAGED
        {
            // update global variable keeping track of stuff
            int nDead = GetGlobalNumber("711KOR_Party_Dead");
            AurPostString("k_oei_hench_inc: Party Hit: "+IntToString(nDead),10,15,10.0);
            nDead++;
            AurPostString("k_oei_hench_inc: Num Dead: "+IntToString(nDead),10,16,10.0);
            SetGlobalNumber("711KOR_Party_Dead",nDead);

            SetMinOneHP(oPartyMember,FALSE);
            if(nDead >= GetGlobalNumber("711KOR_Party_Count"))
            {
                // we need to clean up this fight
                AurPostString("k_oei_hench_inc: Clean Up",10,10,10.0);
                SignalEvent(GetArea(GetFirstPC()),EventUserDefined(1));
            }
            //DelayCommand(1.0,DestroyObject(oPartyMember));
            DestroyObject(oPartyMember);
        }break;
        default:
        {
            AurPostString("k_oei_hench_inc: ERROR",10,18,20.0);
        }break;
    }
}

