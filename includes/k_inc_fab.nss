// k_inc_fab
/*
    Ferret's Wacky Include Script - YAY
    A running compilation of short cuts
    to make life easier
*/
// FAB 3/11

// This spawns in a creature with resref sCreature
// in waypoint location "sp_<sCreature><nInstance>"
object FAB_Spawn( string sCreature, int nInstance = 0 );

// This makes oAct face in the direction of oFace
// if oFace is left blank it defaults to the PC
void FAB_Face( object oAct, object oFace = OBJECT_INVALID );

// This function teleports the PC to oWP then any
// other CNPCs are teleported behind the PC.
// WARNING: Make sure that behind the waypoint there
// are valid points for the CNPCs to teleport to.
void FAB_PCPort( object oWP );

// This function returns a location directly behind the object
// you pass it. The float can be changed to determine how far
// behind the PC.
location FAB_Behind( object oTarg, float fMult = 2.5 );

// This spawns in a creature with resref sCreature
// in waypoint location "sp_<sCreature><nInstance>"
object FAB_Spawn( string sCreature, int nInstance = 0 )
{

    string sWP;

    if ( nInstance == 0 ) sWP = "sp_" + sCreature ;
    else sWP = "sp_" + sCreature + IntToString( nInstance );

    return CreateObject( OBJECT_TYPE_CREATURE, sCreature, GetLocation( GetObjectByTag( sWP ) ));

}

// This makes oAct face in the direction of oFace
// if oFace is left blank it defaults to the PC
void FAB_Face( object oAct, object oFace = OBJECT_INVALID )
{

    if ( oFace == OBJECT_INVALID ) oFace = GetFirstPC();

    AssignCommand( oAct, SetFacingPoint( GetPositionFromLocation(GetLocation(oFace)) ));

}

// This function teleports the PC to oWP then any
// other CNPCs are teleported behind the PC.
// WARNING: Make sure that behind the waypoint there
// are valid points for the CNPCs to teleport to.
void FAB_PCPort( object oWP )
{

    AurPostString("Testing!",5,4,2.0);
    //object oWP = GetObjectByTag( "tp_test" );
    //object oTarg = GetFirstPC();
    object oTarg = GetPartyMemberByIndex(0);

    DelayCommand( 0.1, AssignCommand( oTarg, ClearAllActions() ));
    DelayCommand( 0.2, AssignCommand( oTarg, ActionJumpToObject(oWP) ) );

    float fX = 0.0;
    float fY = 0.0;

    float fFacing = GetFacing( oWP ) + 0.0;
    float fFacing2 = GetFacing( oWP ) + 90.0;
    float fTempFace;
    vector vTest;

    if ( fFacing >  180.0 ) fTempFace = fFacing - 360.0;
    else fTempFace = fFacing;

    fTempFace = fTempFace / 90;

    if ( fTempFace < -1.0 ) fTempFace = -( fTempFace + 2.0 );
    if ( fTempFace > 1.0 ) fTempFace = -( fTempFace - 2.0 );

    fY = fTempFace * -2.5;

    // Come up with X adjust based on Facing2
    if ( fFacing2 > 360.0 ) fFacing2 = fFacing2 - 360.0;
    if ( fFacing2 >  180.0 ) fTempFace = fFacing2 - 360.0;
    else fTempFace = fFacing2;

    fTempFace = fTempFace / 90;

    if ( fTempFace < -1.0 ) fTempFace = -( fTempFace + 2.0 );
    if ( fTempFace > 1.0 ) fTempFace = -( fTempFace - 2.0 );

    fX = fTempFace * -2.5;

    //AurPostString("fFacing: " + FloatToString(fFacing),5,4,2.0);
    //AurPostString("fX: " + FloatToString(fX) + ", fY: " + FloatToString(fY),5,5,2.0);

    //oTarg = GetObjectByTag( "bith",0 );
    oTarg = GetPartyMemberByIndex(1);

    if( GetIsObjectValid(oTarg) && GetCurrentHitPoints(oTarg) > 1 )
    {
        SetCommandable(TRUE,oTarg);
        vTest = GetPositionFromLocation(GetLocation(oWP)) + Vector(fX,fY);
        DelayCommand( 0.1, AssignCommand( oTarg, ClearAllActions() ));
        DelayCommand( 0.2, AssignCommand( oTarg, ActionJumpToLocation( Location(vTest,fFacing) ) ));
        //SetCommandable(FALSE,oTarg);
    }

    //oTarg = GetObjectByTag( "bith",1 );
    oTarg = GetPartyMemberByIndex(2);
    if( GetIsObjectValid(oTarg) && GetCurrentHitPoints(oTarg) > 1 )
    {
        SetCommandable(TRUE,oTarg);
        vTest = GetPositionFromLocation(GetLocation(oWP)) + Vector(fX * 1.9,fY * 1.9);
        DelayCommand( 0.1, AssignCommand( oTarg, ClearAllActions() ));
        DelayCommand( 0.2, AssignCommand( oTarg, ActionJumpToLocation( Location(vTest,fFacing) ) ));
        //SetCommandable(FALSE,oTarg);
    }

}

// This function returns a location directly behind the object
// you pass it. The float can be changed to determine how far
// behind the PC.
location FAB_Behind( object oTarg, float fMult = 2.5 )
{

    float fX = 0.0;
    float fY = 0.0;

    float fFacing = GetFacing( oTarg ) + 0.0;
    float fFacing2 = GetFacing( oTarg ) + 90.0;
    float fTempFace;
    vector vTest;

    if ( fFacing >  180.0 ) fTempFace = fFacing - 360.0;
    else fTempFace = fFacing;

    fTempFace = fTempFace / 90;

    if ( fTempFace < -1.0 ) fTempFace = -( fTempFace + 2.0 );
    if ( fTempFace > 1.0 ) fTempFace = -( fTempFace - 2.0 );

    fY = fTempFace * - fMult;

    // Come up with X adjust based on Facing2
    if ( fFacing2 > 360.0 ) fFacing2 = fFacing2 - 360.0;
    if ( fFacing2 >  180.0 ) fTempFace = fFacing2 - 360.0;
    else fTempFace = fFacing2;

    fTempFace = fTempFace / 90;

    if ( fTempFace < -1.0 ) fTempFace = -( fTempFace + 2.0 );
    if ( fTempFace > 1.0 ) fTempFace = -( fTempFace - 2.0 );

    fX = fTempFace * - fMult;

    vTest = GetPositionFromLocation(GetLocation(oTarg)) + Vector(fX,fY);

    return Location( vTest,fFacing );

}


