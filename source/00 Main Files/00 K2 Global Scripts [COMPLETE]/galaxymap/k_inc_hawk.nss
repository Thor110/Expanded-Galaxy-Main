//:: Script Name
/*
    Desc
*/
//:: Created By:
//:: Copyright (c) 2002 Bioware Corp.
#include "k_inc_glob_party"
#include "k_oei_hench_inc"

void StopCombat()
{
    object oPC = GetFirstPC();
    CancelCombat(oPC);

    int i;
    object oEnemy;

    for(i = 0;i < 20;i++)
    {
        oEnemy = GetObjectByTag("REThug4", i);
        if(GetIsObjectValid(oEnemy))
        {
            ChangeToStandardFaction( oEnemy,STANDARD_FACTION_NEUTRAL );
            CancelCombat(oEnemy);
        }
        oEnemy = GetObjectByTag("REThug5", i);
        if(GetIsObjectValid(oEnemy))
        {
            ChangeToStandardFaction( oEnemy,STANDARD_FACTION_NEUTRAL );
            CancelCombat(oEnemy);
        }
    }
    //take care of the captain
    oEnemy = GetObjectByTag("RECapt");
    if(GetIsObjectValid(oEnemy))
    {
        ChangeToStandardFaction( oEnemy,STANDARD_FACTION_NEUTRAL );
        CancelCombat(oEnemy);
    }
}

void ClearEnemies()
{
    int i;
    object oEnemy;

    for(i = 0;i < 20;i++)
    {
        oEnemy = GetObjectByTag("REThug4", i);
        if(GetIsObjectValid(oEnemy))
            DestroyObject(oEnemy);

        oEnemy = GetObjectByTag("REThug5", i);
        if(GetIsObjectValid(oEnemy))
            DestroyObject(oEnemy);
    }
    //take care of the captain
    oEnemy = GetObjectByTag("RECapt");
    if(GetIsObjectValid(oEnemy))
            DestroyObject(oEnemy);
}

void DestroyVisas()
{
    object oVisasTemp2 = GetObjectByTag("VisasBed");
    if(GetIsObjectValid(oVisasTemp2))
    {
        DestroyObject(oVisasTemp2, 0.0, TRUE);
    }

    object oVisasTemp = GetObjectByTag("VisasCut");
    if (GetIsObjectValid(oVisasTemp))
    {
        DestroyObject(oVisasTemp, 0.0, TRUE);
    }
}

void DoSpecialReset(object oNPC, string sModuleName)
{
    if(GetNPCConstant(GetTag(oNPC)) == NPC_ATTON)
    {
        AurPostString("Resetting Atton 1",15,19,10.0);
        DoAttonSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_BAO_DUR)
    {
        DoBaoDurSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_CANDEROUS)
    {
        DoMandSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_DISCIPLE)
    {
        DoDiscipleSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_G0T0)
    {
        DoG0T0SpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_HANDMAIDEN)
    {
        DoHandmaidenSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_HANHARR)
    {
        DoHanharrSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_HK_47)
    {
        DoHK47SpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_KREIA)
    {
        DoKreiaSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_MIRA)
    {
        DoMiraSpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_T3_M4)
    {
        DoT3M4SpawnIn(oNPC, sModuleName);
    }
    else if(GetNPCConstant(GetTag(oNPC)) == NPC_VISAS)
    {
        DoVisasMarrSpawnIn(oNPC, sModuleName);
    }
    else
    {
        AurPostString("ERROR: Invalid PartyMember",15,15,10.0);
    }
}

void DoSpecialPuppetReset(object oNPC, string sModuleName)
{
    if(GetPuppetConstant(GetTag(oNPC)) == PUP_SENSORBALL)
    {
        DoRemoteSpawnIn(oNPC, sModuleName);
    }
}

void ResetEbonHawk()
{
    AurPostString("k_inc_hawk: Resetting Ebon Hawk", 15, 18, 10.0);
    int i;

    string sTag;
    object oNPC;
    for(i = 0; i < 12; i++)
    {
        sTag = GetNPCTag( i );
        oNPC = GetObjectByTag(sTag);
        if(GetIsObjectValid(oNPC))
        {
            object oWP = GetObjectByTag("WP_gspawn_" + sTag);
            if(GetIsObjectValid(oWP))
            {
                AssignCommand(oNPC, ClearAllActions());
                AssignCommand(oNPC, ActionJumpToLocation(GetLocation(oWP)));
                DelayCommand(0.2, DoSpecialReset(oNPC, "003EBO"));
            }
            else
            {
                AurPostString("RESET EBONHAWK: invalid waypoint!", 15,15,10.0);
            }
        }
    }

    object oRemote = GetObjectByTag("remote");
    if(GetIsObjectValid(oRemote))
    {
        object oWP = GetObjectByTag("WP_gspawn_" + sTag);
        if(GetIsObjectValid(oWP))
        {
            AssignCommand(oNPC, ClearAllActions());
            AssignCommand(oNPC, ActionJumpToLocation(GetLocation(oWP)));
            DelayCommand(0.2, DoSpecialPuppetReset(oNPC, "003EBO"));
        }
        else
        {
            AurPostString("RESET EBONHAWK: invalid waypoint!", 15,15,10.0);
        }
    }
    //AWD-OEI 10/29/2004
    DestroyVisas();
}

void TurnOffCutsceneMode(object oNPC)
{
    AssignCommand(oNPC, ClearAllActions());
    //waypoints on
    //AssignCommand(oPartyMember, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, FALSE));
    //AssignCommand(oPartyMember, GN_WalkWayPoints());

    //waypoints off
    AssignCommand(oNPC, GN_SetSpawnInCondition(SW_FLAG_WAYPOINT_DEACTIVATE, TRUE));
    AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, -1.0));//clear animations
}

void ClearEbonHawk()
{
    AurPostString("k_inc_hawk: ClearEbonHawk", 15, 21, 10.0);
    int i;
    int bOnXbox = GetIsXBox();

    string sTag;
    object oNPC;
    for(i = 0; i < 12; i++)
    {
        sTag = GetNPCTag( i );
        oNPC = GetObjectByTag(sTag);
        if(GetIsObjectValid(oNPC))
        {
            //SaveNPCByObject(i , oNPC);
            DestroyObject(oNPC, 0.0, bOnXbox);
        }
    }
    object oRemote = GetObjectByTag("remote");
    if(GetIsObjectValid(oRemote))
    {
        //SavePUPByObject(PUP_SENSORBALL, oRemote);
        DestroyObject(oRemote, 0.0, bOnXbox);
    }
}


void SetBackground()
{
    //string sRoom = GetScriptStringParameter();
    string sRoom = "003EBOq";
    int nRoomAnimation = GetGlobalNumber("003EBO_BACKGROUND");

    switch(nRoomAnimation)
    {
        case 0://106PER
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP01;//PERAGUS
        }break;
        case 1://201TEL
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP02;//TELOS
        }break;
        case 2://262TEL
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP19;//ACADEMY
        }break;
        case 3://301NAR
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP04;//NAR SHADDAA
        }break;
        case 4://401DXN
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP05;//DXUN
        }break;
        case 5://601DAN
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP06;//DANTOOINE
        }break;
        case 6://701KOR
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP07;//KORRIBAN
        }break;
        case 7://801DRO
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP08;//M478
        }break;
        case 8://space // new planet 01
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP09;//SPACE
        }break;
        case 9://901MAL // new planet 02
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP10;//MALACHOR
        }break;
        case 10://Hyperspace // new planet 03
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP11;//HYPERSPACE
        }break;
        case 11: //KASHYYYK
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP12;//KASHYYYK
        }break; 
        case 12: //954COR
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP13;//CORUSCANT
        }break; 
        case 13: //YAVIN
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP14;//YAVIN
        }break;  
        case 14: //TATOOINE
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP15;//TATOOINE
        }break;  
        case 15: //MANAAN
        {
            nRoomAnimation = ANIMATION_ROOM_SCRIPTLOOP16;//MANAAN
        }break; 
        default://error
        {
            AurPostString("EBO ERROR: No background sepcified!",15,15,10.0);
        }
    }
    PlayRoomAnimation(sRoom, nRoomAnimation);
}

void SetHologramWorld()
{
    string sResRef;
    int nCurrentWorld = GetGlobalNumber("003EBO_BACKGROUND");
    switch(nCurrentWorld)
    {
        case 0://106PER
        {
            sResRef = "holo_per";
        }break;
        case 1://201TEL
        {
            sResRef = "holo_tel";
        }break;
        case 2://262TEL
        {
            sResRef = "holo_tel";
        }break;
        case 3://301NAR
        {
            sResRef = "holo_nar";
        }break;
        case 4://401DXN
        {
            sResRef = "holo_dxn";
        }break;
        case 5://601DAN
        {
            sResRef = "holo_dan";
        }break;
        case 6://701KOR
        {
            sResRef = "holo_kor";
        }break;
        case 7://801DRO
        {
            sResRef = "";
        }break;
        case 8://space // new planet 01
        {
            sResRef = "holo_nar";
        }break;
        case 9://901MAL // new planet 02
        {
            sResRef = "holo_nar";
        }break;
        case 10://Hyperspace // new planet 03
        {
            //sResRef = "holo_nar";//ebon hawk
        }break;
        case 11: //KASHYYK
        {
            sResRef = "holo_kor";
        }break; 
        case 12: //954COR
        {
            sResRef = "holo_nar";
        }break; 
        case 13: //YAVIN
        {
            sResRef = "holo_kor";
        }break; 
        case 14: //TATOOINE
        {
            sResRef = "holo_kor";
        }break; 
        case 15: //MANAAN
        {
            sResRef = "holo_kor";
        }break; 
        default://error
        {
            AurPostString("EBO ERROR: No background sepcified!",15,15,10.0);
        }
    }
    object oHoloWorld = GetObjectByTag("hologram");
    if(GetIsObjectValid(oHoloWorld))
        DestroyObject(oHoloWorld);
    if(sResRef != "")
    {
        object oNewHoloWorld = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, GetLocation(GetObjectByTag("WP_hologram")));
        if(GetIsObjectValid(oNewHoloWorld))
        {
            //AssignCommand ( oNewHoloWorld, ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 1.0, -1.0));
            DelayCommand( 1.0, AssignCommand ( oNewHoloWorld, ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01) ) );
        }
    }
}


// GetCurrentPlanet
// returns a planet constant based on background
// will return -1 if not on a planet
int GetCurrentPlanet()
{
    int nRoomAnimation = GetGlobalNumber("003EBO_BACKGROUND");

    switch(nRoomAnimation)
    {
        case 0://106PER
        {
            return PLANET_PERAGUS;
            //return PLANET_EBON_HAWK;
        }break;
        case 1://201TEL
        {
            return 10; // citadel station
        }break;
        case 2://262TEL
        {
            return PLANET_TELOS;// EXTRA YAVIN WORKS - LEHON
        }break;
        case 3://301NAR
        {
            return PLANET_NAR_SHADDAA;
        }break;
        case 4://401DXN
        {
            return PLANET_DXUN;
        }break;
        case 5://601DAN
        {
            return PLANET_DANTOOINE;
        }break;
        case 6://701KOR
        {
            return PLANET_KORRIBAN;
        }break;
        case 7://801DRO
        {
            return PLANET_M4_78;
        }break;
        case 8://space // new planet 01
        {
            return PLANET_EBON_HAWK; // EXTRA MANAAN WORKS - SLEHEYRON
        }break;
        case 9://901MAL // new planet 02
        {
            return PLANET_MALACHOR_V; // EXTRA TATOOINE WORKS
        }break;
        case 10://Hyperspace // new planet 03
        {
            //return PLANET_EBON_HAWK; // kashyyyk extra test
            return PLANET_HARBINGER; // kashyyyk extra test
        }break;
        case 11: //KASHYYK
        {
            return PLANET_LIVE_01;
        }break;
        case 12: //954COR
        {
            return PLANET_LIVE_02;
        }break;
        case 13: //YAVIN
        {
            return PLANET_LIVE_03;
        }break;
        case 14: //TATOOINE
        {
            return PLANET_LIVE_04;
        }break;
        case 15: //MANAAN
        {
            return PLANET_LIVE_05;
        }break;
        default://error
        {
            return PLANET_EBON_HAWK;
        }
    }
    return PLANET_EBON_HAWK;
}
