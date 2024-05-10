//:: k_trp_generic
/*
    Generic Trap Scripts
Trap Name   Trap Animation  Effect  minor   Effect average  Effect deadly
Flash Stun
    A bright light explodes.
    Save at DC 15 or be stunned.
    Save at DC 20 or be stunned.
    Save at DC 25 or be stunned.
Fragmentation Mine
    Conventional explosion
    Explodes for 3-18 damage in medium radius.
    Explodes for 5-30 damage in medium radius.
    Explodes for 9-54 damage in medium radius.
Laser Slice Trap
    Lasers shoot out from floor and flay a character.
    Lasers cut up one target for 4-24 damage.
    Lasers cut up one target for 7-42 damage.
    Lasers cut up one target for 12-72 damage.
Gas Trap
    Gas shoots out and poisons everyone
    Inflicts a mild poison on everyone in a medium radius.
    Inflicts a average poison on everyone in a medium radius.
    Inflicts a virulent poison on everyone in a medium radius.
Sonic Charge
    Sonic blast shoots out and damages in a range
    Sonic damage for 3-18
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_debug"
void main()
{
    int nDC;
    object oTarget;
    int nTrapID = GetTrapBaseType(OBJECT_SELF);
    location lTrap = GetLocation(OBJECT_SELF);
    int nTest = 27;

    Db_PostString("Trap Fired", 5,5,4.0);

    // DJS-OEI 1/20/2004
    // Made a bunch of changes to support the trap
    // design for KotOR2.

    //FLASH STUN MINE
    if( nTrapID == TRAP_BASE_TYPE_FLASH_STUN_MINOR ||
        nTrapID == TRAP_BASE_TYPE_FLASH_STUN_AVERAGE ||
        nTrapID == TRAP_BASE_TYPE_FLASH_STUN_STRONG ||
        nTrapID == TRAP_BASE_TYPE_FLASH_STUN_DEADLY ||
        nTrapID == TRAP_BASE_TYPE_FLASH_STUN_DEVASTATING)
    {
        //The only difference between the flash traps is the DC.  Therefore I am
        //using 1 section of the if statement.
        if(nTrapID == TRAP_BASE_TYPE_FLASH_STUN_MINOR) {nDC = 15 ;}
        if(nTrapID == TRAP_BASE_TYPE_FLASH_STUN_AVERAGE) {nDC = 20 ;}
        if(nTrapID == TRAP_BASE_TYPE_FLASH_STUN_STRONG) {nDC = 25 ;}
        if(nTrapID == TRAP_BASE_TYPE_FLASH_STUN_DEADLY) {nDC = 30 ;}
        if(nTrapID == TRAP_BASE_TYPE_FLASH_STUN_DEVASTATING) {nDC = 35 ;}

        // DJS-OEI 1/27/2004
        // Increase the radius for each rank in Demolitions
        float fRadius = 3.3;
        int nDemoSkill = GetOwnerDemolitionsSkill( OBJECT_SELF );
        if( nDemoSkill > 0 ) {
            fRadius += 0.1 * nDemoSkill;
        }

        //RWT-OEI 05/24/04 - +1 to the DC per 5 points of Demolitions Skill
        nDC += (nDemoSkill / 5);

        effect eStun = EffectStunned();
        eStun = SetEffectIcon(eStun, 63 );//RWT-OEI 07/08/04 - Added effect for this
        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        while(GetIsObjectValid(oTarget))
        {
            if(!WillSave(oTarget, 15) && GetRacialType(oTarget) != RACIAL_TYPE_DROID && !GetIsNeutral(oTarget, OBJECT_SELF))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, RoundsToSeconds(3));
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        }
    }
    //FRAGMENTATION MINE
    else if(nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR  ||
            nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_AVERAGE ||
            nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_STRONG ||
            nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_DEADLY ||
            nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_DEVASTATING )
    {
        int nDice;
        int nDamage;
        effect eDamage;
        //The only difference between the frag traps is the damage.  Therefore I am
        //using 1 section of the if statement.
        if(nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR) {nDamage = 18; nDC = 15;}
        if(nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_AVERAGE) {nDamage = 30; nDC = 20;}
        if(nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_STRONG) {nDamage = 42; nDC = 25;}
        if(nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_DEADLY) {nDamage = 54; nDC = 30;}
        if(nTrapID == TRAP_BASE_TYPE_FRAGMENTATION_MINE_DEVASTATING) {nDamage = 66; nDC = 35;}

        // DJS-OEI 1/26/2004
        // Modify damage by the demolitions skill of the person that
        // placed this mine.
        int nDemoSkill = GetOwnerDemolitionsSkill( OBJECT_SELF );
        if( nDemoSkill > 0 ) {
            nDamage += nDemoSkill;//RWT-OEI 05/24/04 - Took out the /5 per Feargus
        }

        // DJS-OEI 1/27/2004
        // Increase the radius for each rank in Demolitions
        float fRadius = 3.3;
        if( nDemoSkill > 0 ) {
            fRadius += 0.1 * nDemoSkill;
        }

        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        while(GetIsObjectValid(oTarget))
        {
            if(!GetIsNeutral(oTarget, OBJECT_SELF))
            {
                nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nDC);
                eDamage = EffectDamage(nDamage, DAMAGE_TYPE_PIERCING);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        }
    }
    //LASER SLICING TRAP - THIS IS NOW THE PLASMA MINE
    else if(nTrapID == TRAP_BASE_TYPE_LASER_SLICING_MINOR ||
            nTrapID == TRAP_BASE_TYPE_LASER_SLICING_AVERAGE ||
            nTrapID == TRAP_BASE_TYPE_LASER_SLICING_STRONG ||
            nTrapID == TRAP_BASE_TYPE_LASER_SLICING_DEADLY ||
            nTrapID == TRAP_BASE_TYPE_LASER_SLICING_DEVASTATING )
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(1044),GetLocation(OBJECT_SELF));
        int nDice;
        int nDamage;
        effect eDamage;
        //The only difference between the laser slicing traps is the damage.  Therefore I am
        //using 1 section of the if statement.
        if(nTrapID == TRAP_BASE_TYPE_LASER_SLICING_MINOR) {nDamage = 24; nDC = 15;}
        if(nTrapID == TRAP_BASE_TYPE_LASER_SLICING_AVERAGE) {nDamage = 42; nDC = 20;}
        if(nTrapID == TRAP_BASE_TYPE_LASER_SLICING_STRONG) {nDamage = 60; nDC = 25;}
        if(nTrapID == TRAP_BASE_TYPE_LASER_SLICING_DEADLY) {nDamage = 78; nDC = 30;}
        if(nTrapID == TRAP_BASE_TYPE_LASER_SLICING_DEVASTATING) {nDamage = 96; nDC = 35;}

        // DJS-OEI 1/26/2004
        // Modify damage by the demolitions skill of the person that
        // placed this mine.
        int nDemoSkill = GetOwnerDemolitionsSkill( OBJECT_SELF );
        if( nDemoSkill > 0 ) {
            nDamage += 3 * nDemoSkill / 2;//RWT-OEI 05/24/04 - Changed to (3*skill)/2 per Fergus
        }

        // DJS-OEI 1/27/2004
        // Increase the radius for each rank in Demolitions
        float fRadius = 3.3;
        if( nDemoSkill > 0 ) {
            fRadius += 0.1 * nDemoSkill;
        }

        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        while(GetIsObjectValid(oTarget))
        {
            if(!GetIsNeutral(oTarget, OBJECT_SELF))
            {
                nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nDC);
                eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLASTER);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        }
    }
    //GAS POISON TRAP
    else if(nTrapID == TRAP_BASE_TYPE_POISON_GAS_MINOR ||
            nTrapID == TRAP_BASE_TYPE_POISON_GAS_AVERAGE ||
            nTrapID == TRAP_BASE_TYPE_POISON_GAS_STRONG ||
            nTrapID == TRAP_BASE_TYPE_POISON_GAS_DEADLY ||
            nTrapID == TRAP_BASE_TYPE_POISON_GAS_DEVASTATING ||
            nTrapID == nTest )//Default : 27
    {
        effect ePoison;
        //The only difference between the poison traps is the poison type.  Therefore I am
        //using 1 section of the if statement.
        if(nTrapID == TRAP_BASE_TYPE_POISON_GAS_MINOR) {ePoison = EffectPoison(POISON_DAMAGE_MILD);}
        if(nTrapID == TRAP_BASE_TYPE_POISON_GAS_AVERAGE) {ePoison = EffectPoison(POISON_DAMAGE_AVERAGE);}
        if(nTrapID == TRAP_BASE_TYPE_POISON_GAS_STRONG) {ePoison = EffectPoison(POISON_ABILITY_AND_DAMAGE_AVERAGE);}
        if(nTrapID == TRAP_BASE_TYPE_POISON_GAS_DEADLY) {ePoison = EffectPoison(POISON_DAMAGE_VIRULENT);}
        if(nTrapID == TRAP_BASE_TYPE_POISON_GAS_DEVASTATING) {ePoison = EffectPoison(POISON_ABILITY_AND_DAMAGE_VIRULENT);}
        if(nTrapID == nTest ) /* Default : 27 */{ePoison = EffectPoison(POISON_DAMAGE_AVERAGE);}

        ePoison = SetEffectIcon(ePoison, 110);//RWT-OEI 07/08/04
        // DJS-OEI 1/27/2004
        // Increase the radius for each rank in Demolitions
        float fRadius = 3.3;
        int nDemoSkill = GetOwnerDemolitionsSkill( OBJECT_SELF );
        if( nDemoSkill > 0 ) {
            fRadius += 0.2 * nDemoSkill;//RWT-OEI 05/24/04 - Changed from .1 to .2 per Fergus
        }

        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        while(GetIsObjectValid(oTarget))
        {
            if(GetRacialType(oTarget) != RACIAL_TYPE_DROID  && !GetIsNeutral(oTarget, OBJECT_SELF))
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoison, oTarget);
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        }
    }
    //SONIC CHARGE TRAP
    else if ( nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR ||
              nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE ||
              nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_STRONG ||
              nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_DEADLY ||
              nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_DEVASTATING )
    {
        int nDice;
        effect eDamage;
        int nDamage;
        effect eDex;
        if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR ||
              nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE)
        {
            eDex = EffectAbilityDecrease(ABILITY_DEXTERITY, 2);
        }
        else if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_STRONG ||
              nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_DEADLY)
        {
             eDex = EffectAbilityDecrease(ABILITY_DEXTERITY, 4);
        }
        else // devestating
        {
            eDex = EffectAbilityDecrease(ABILITY_DEXTERITY, 6);
        }

        eDex = SetEffectIcon(eDex, 112);

        if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR)   {nDamage = 18; nDC = 15; }
        if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE) {nDamage = 30; nDC = 20; }
        if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_STRONG)  {nDamage = 42; nDC = 25; }
        if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_DEADLY)  {nDamage = 54; nDC = 30; }
        if (nTrapID == TRAP_BASE_TYPE_SONIC_CHARGE_DEVASTATING) {nDamage = 66; nDC = 35; }

        // DJS-OEI 1/26/2004
        // Modify damage by the demolitions skill of the person that
        // placed this mine.
        int nDemoSkill = GetOwnerDemolitionsSkill( OBJECT_SELF );
        if( nDemoSkill > 0 ) {
            nDamage += nDemoSkill;
        }

        // DJS-OEI 1/27/2004
        // Increase the radius for each rank in Demolitions
        float fRadius = 3.3;
        if( nDemoSkill > 0 ) {
            fRadius += 0.1 * nDemoSkill;
        }

        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(3007),GetSpellTargetLocation());
        while (GetIsObjectValid(oTarget))
        {
            if ( !GetIsNeutral(oTarget, OBJECT_SELF))
            {
                int nDamageNew = GetReflexAdjustedDamage(nDamage, oTarget, nDC);
                eDamage = EffectDamage( nDamageNew, DAMAGE_TYPE_SONIC);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                if (nDamage <= nDamageNew)
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDex, oTarget, 30.0);
                }
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lTrap, TRUE);
        }
    }
}

