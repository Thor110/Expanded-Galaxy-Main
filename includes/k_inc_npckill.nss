//Richard Taylor
//OEI 08/08/04
//Various functions to help with killing creatures in
//violent and damaging explosions.

//When this function is called on something it will
//destroy the oCreature after nDelay seconds and do nDamage to
//everyone within 4 meters radius.
void DamagingExplosion(object oCreature, int nDelay, int nDamage );

//When this function is called on something it will
//destroy the oCreature after nDelay seconds but not
//damage anyone in the explosion
void NonDamagingExplosion(object oCreature, int nDelay);

//When this function is called on something it will do
//an EffectDeath on oCreature after nSeconds
void KillCreature(object oCreature, int nDelay);

int GR_GetGrenadeDC(object oTarget);

void DamagingExplosion( object oCreature, int nDelay, int nDamage )
{

    //IF there is a delay just call ourselves after ndelay seconds and
    //not have a delay next time
    if ( nDelay > 0 )
    {
        //AurPostString( "Delaying Damaging", 10, 25, 5.0f );
        DelayCommand( IntToFloat(nDelay), DamagingExplosion(oCreature, 0, nDamage ));
        return;
    }

    //AurPostString( "Executing Damaging", 10, 26, 5.0f );
    int nDC = 15;
    int nDCCheck = 0;

    location oLoc = GetLocation(oCreature);
    float oOri = GetFacing(oCreature);
    vector vPos = GetPositionFromLocation( oLoc );

    vPos.z = vPos.z + 1.0f ;
    location oExplosionLoc = Location( vPos, oOri );
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 4.0, oLoc, FALSE, 65);

    while (GetIsObjectValid(oTarget) && nDamage > 0 )
    {
        int nFaction = GetStandardFaction( oTarget );

        if ( oTarget != OBJECT_SELF && nFaction != STANDARD_FACTION_NEUTRAL )
        {
            nDCCheck = nDC;
            nDCCheck -= GR_GetGrenadeDC(oTarget);

            if ( !ReflexSave(oTarget, nDCCheck, SAVING_THROW_TYPE_NONE))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_PIERCING), oTarget);
            }
            else
            {//Do a evasion check
                int nApply = 0;

                if ( GetHasFeat( FEAT_EVASION, oTarget ) )
                {
                    nApply = 0;
                }
                else
                {
                    nApply = nDamage / 2;
                }
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nApply, DAMAGE_TYPE_PIERCING), oTarget);
            }
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 4.0, oLoc, FALSE, 65 );
    }

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(3003), oExplosionLoc);

    AssignCommand(oCreature, ClearAllActions());
    DestroyObject(oCreature, 0.0f, TRUE);
}

void NonDamagingExplosion(object oCreature, int nDelay)
{
    DamagingExplosion(oCreature, nDelay, 0);
}

void KillCreature(object oCreature, int nDelay )
{
    if ( nDelay > 0 )
    {
        DelayCommand(IntToFloat(nDelay), KillCreature( oCreature, 0 ));
        return;
    }

    effect eDeath = EffectDeath(FALSE, FALSE, TRUE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oCreature );
}

void main()
{
    int nKillMode = GetScriptParameter(1);
    int nDelay = GetScriptParameter(2);
    int nDamage = GetScriptParameter(3);

    if ( nKillMode == 0 )
    {
      //  AurPostString( "Calling damaging. Delay of: ", 10, 20, 5.0f );
      //  AurPostString( IntToString( nDelay ), 10, 21, 5.0f );
        DamagingExplosion(OBJECT_SELF, nDelay, nDamage);
        return;
    }

    if ( nKillMode == 1 )
    {
        NonDamagingExplosion(OBJECT_SELF, nDelay);
        return;
    }

    if ( nKillMode == 2 )
    {
        KillCreature(OBJECT_SELF, nDelay);
        return;
    }
}

//Get the DC for the grenade based on the targets feats.

int GR_GetGrenadeDC(object oTarget)
{
    int nUnc1 = GetHasFeat(FEAT_UNCANNY_DODGE_1, oTarget);
    int nUnc2 = GetHasFeat(FEAT_UNCANNY_DODGE_2, oTarget);
    int nDC = 0;

    if(nUnc1 == TRUE)
    {
        nDC += 2;
        if(nUnc2 == TRUE)
        {
            nDC += 2;
        }
    }
    return nDC;

}
