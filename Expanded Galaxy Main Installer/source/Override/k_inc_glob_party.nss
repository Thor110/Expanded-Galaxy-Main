
//:: k_inc_glob_party
/*
These global scripts are to be used to spawn actual party member objects with thier correct equipment, stats, levels, etc.
Use this to place party members for required scripts and cutscenes.
*/
#include "k_inc_debug"


// FUNCTION DECLARATIONS
string  GetNPCTag( int nNPC );
int     GetNPCConstant( string sTag );
void    ClearPlayerParty();
void    SetPlayerParty(int aNPC_CONSTANT_1, int aNPC_CONSTANT_2);
object  SpawnIndividualPartyMember(int aNPC_CONSTANT, string sWP = "WP_gspawn_");
void    SpawnAllAvailablePartyMembers();

object  SpawnIndividualPuppet(int aNPC_CONSTANT, string sWP = "WP_gspawn_");
string  GetPuppetTag( int nNPC );
int     GetPuppetConstant( string sTag );


// FUNCTION DEFINITIONS:

// Sets the Player created character to be the party leader
// and returns all other party members to the 'party base'.
void ClearPlayerParty()
{
    SetPartyLeader(NPC_PLAYER);

    int i;
    for(i = 0; i < 12; i++)
    {
        if(IsNPCPartyMember( i ))
            RemoveNPCFromPartyToBase( i );
    }
}

// sets the Player created character to be the party leader and then fills the party
// with the passed in constants PROVIDED that they have been previously add to the
// 'party base'
void SetPlayerParty(int aNPC_CONSTANT_1, int aNPC_CONSTANT_2)
{
    ClearPlayerParty();
    object oPartyMember1 = SpawnIndividualPartyMember(aNPC_CONSTANT_1);
    object oPartyMember2 = SpawnIndividualPartyMember(aNPC_CONSTANT_2);
    if(GetIsObjectValid(oPartyMember1) )
    {
        AddPartyMember(aNPC_CONSTANT_1, oPartyMember1);
    }
    if(GetIsObjectValid(oPartyMember2) )
    {
        AddPartyMember(aNPC_CONSTANT_2, oPartyMember2);
    }
}

// Will return the tag of the party member constant passed in.
// Will return 'ERROR' if an invalid constant is passed in.
string GetNPCTag( int nNPC )
{
    switch( nNPC )
    {
        case  NPC_ATTON:
        {
            return "atton";
        }break;
        case  NPC_BAO_DUR:
        {
            return "baodur";
        }break;
        case  NPC_CANDEROUS:
        {
            return "mand";
        }break;
        case  NPC_DISCIPLE:
        {
            return "disciple";
        }break;
        case  NPC_G0T0:
        {
            return "g0t0";
        }break;
        case  NPC_HANDMAIDEN:
        {
            return "handmaiden";
        }break;
        case  NPC_HANHARR:
        {
            return "hanharr";
        }break;
        case  NPC_HK_47:
        {
            return "hk47";
        }break;
        case  NPC_KREIA:
        {
            return "kreia";
        }break;
        case  NPC_MIRA:
        {
            return "mira";
        }break;
        case  NPC_T3_M4:
        {
            return "t3m4";
        }break;
        case  NPC_VISAS:
        {
            return "visasmarr";
        }break;
    }
    return "ERROR";
}

string GetPuppetTag( int nNPC )
{
    switch( nNPC )
    {
        case  PUP_SENSORBALL:
        {
            return "remote";
        }break;
    }
    return "ERROR";
}

int GetNPCConstant( string sTag )
{
    if(sTag == "atton")
    {
        return NPC_ATTON;
    }
    else if(sTag == "baodur")
    {
        return  NPC_BAO_DUR;
    }
    else if(sTag == "mand")
    {
        return  NPC_CANDEROUS;
    }
    else if(sTag == "disciple")
    {
        return  NPC_DISCIPLE;
    }
    else if(sTag == "g0t0")
    {
        return  NPC_G0T0;
    }
    else if(sTag == "handmaiden")
    {
        return  NPC_HANDMAIDEN;
    }
    else if(sTag == "hanharr")
    {
        return  NPC_HANHARR;
    }
    else if(sTag == "hk47")
    {
        return  NPC_HK_47;
    }
    else if(sTag == "kreia")
    {
        return  NPC_KREIA;
    }
    else if(sTag == "mira")
    {
        return  NPC_MIRA;
    }
    else if(sTag == "t3m4")
    {
        return  NPC_T3_M4;
    }
    else if(sTag == "visasmarr")
    {
        return  NPC_VISAS;
    }
    return -1;
}

int GetPuppetConstant( string sTag )
{
    if(sTag == "remote")
    {
        return PUP_SENSORBALL;
    }
    return -1;
}


// Will spawn party member represented by aNPC_CONSTANT at thier personal waypoint IF they exist in the
// 'party base'.  This function does NOT add the spawned party member to the actual party.
object SpawnIndividualPartyMember(int aNPC_CONSTANT, string aWP)
{
    string sWP;
    if(aWP == "WP_gspawn_")
    {
        string sTag = GetNPCTag( aNPC_CONSTANT );
        if(sTag == "ERROR")
            return OBJECT_INVALID;
        sWP = aWP + sTag;
    }
    else
    {
        sWP = aWP;
    }
    object oWP = GetObjectByTag(sWP);
    object oPartyMember;
    if(GetIsObjectValid(oWP))
    {
        oPartyMember = SpawnAvailableNPC( aNPC_CONSTANT, GetLocation(oWP));
        if( GetIsObjectValid(oPartyMember))
        {
            //new AWD-OEI 10/23/2004
            SetCreatureAILevel(oPartyMember, AI_LEVEL_HIGH);
            return oPartyMember;
        }
    }
    return OBJECT_INVALID;
}

// Will spawn puppet represented by aNPC_CONSTANT at thier personal waypoint IF they exist in the
// 'party base'.  This function does NOT add the spawned puppet member to the actual party.
object SpawnIndividualPuppet(int aNPC_CONSTANT, string aWP)
{
    string sWP;
    if(aWP == "WP_gspawn_")
    {
        string sTag = GetPuppetTag( aNPC_CONSTANT );
        if(sTag == "ERROR")
            return OBJECT_INVALID;
        sWP = aWP + sTag;
    }
    else
    {
        sWP = aWP;
    }
    object oWP = GetObjectByTag(sWP);
    object oPartyMember;
    if(GetIsObjectValid(oWP))
    {
        oPartyMember = SpawnAvailablePUP( aNPC_CONSTANT, GetLocation(oWP));
        if( GetIsObjectValid(oPartyMember))
            return oPartyMember;
    }
    return OBJECT_INVALID;
}


// Will spawn all available party members at thier personal waypoints.  This function does not add anyone
// to the actual party.
void SpawnAllAvailablePartyMembers()
{
    int i;
    for(i = 0; i < 12; i++)
    {
        if(GetNPCSelectability( i ) != -1)
        {
            if( !GetIsObjectValid(SpawnIndividualPartyMember( i )) )
            {
                AurPostString("NPC could not spawn, invalid NPC or invalid location!",5,15,10.0);
            }
            else
            {
                if(i == NPC_BAO_DUR)//spawn bao's pet
                {
                    SpawnIndividualPuppet(PUP_SENSORBALL);
                }
            }
        }
    }
}


