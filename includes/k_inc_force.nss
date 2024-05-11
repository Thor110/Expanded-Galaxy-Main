//:: k_inc_force
/*
    v1.0
    Force Powers Include for KOTOR
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

float fLightningDuration = 1.0;

//These variables are set in the script run area.
int SWFP_PRIVATE_SAVE_TYPE;
int SWFP_PRIVATE_SAVE_VERSUS_TYPE;
int SWFP_DAMAGE;
int SWFP_DAMAGE_TYPE;
int SWFP_DAMAGE_VFX;
int SWFP_HARMFUL;
int SWFP_SHAPE;

//Runs the script section for the particular force power.
void  Sp_RunForcePowers();
//Immunity and Resist Spell check for the force power.
//The eDamage checks whether the target is immune to the damage effect
int Sp_BlockingChecks(object oTarget, effect eEffect, effect eEffect2, effect eDamage);
//Makes the necessary saving throws
int Sp_MySavingThrows(object oTarget, int iSpellDC = 0);
//Remove an effect of a specific type
void Sp_RemoveSpecificEffect(int nEffectTypeID, object oTarget);
//Remove an effect from a specific force power.
void Sp_RemoveSpellEffects(int nSpell_ID, object oCaster, object oTarget);
// Delays the application of a spell effect by an amount determined by distance.
float Sp_GetSpellEffectDelay(location SpellTargetLocation, object oTarget);
//Randomly delays the effect application for a default of 0.0 to 0.75 seconds
float Sp_GetRandomDelay(float fMinimumTime = 0.0, float MaximumTime = 0.75);
//Gets a saving throw appropriate to the jedi using the force power.
int Sp_GetJediDCSave();
///Apply effects in a sphere shape.
void Sp_SphereSaveHalf(object oAnchor, float fSize, int nCounter, effect eLink1, float fDuration1, effect eLink2, float fDuration);
//Apply effects to a single target.
void Sp_SingleTarget(object oAnchor, effect eLink1, float fDuration1, effect eLink2, float fDuration2);
//Apply effect to an area and negate on a save.
void Sp_SphereBlocking(object oAnchor, float fSize, int nCounter, effect eLink1, float fDuration1, effect eLink2, float fDuration);
// /Apply effect to an object and negate on a save.
void Sp_SingleTargetBlocking(object oAnchor, effect eLink1, float fDuration1, effect eLink2, float fDuration2);
//Apply effects for a for power.
void Sp_ApplyForcePowerEffects(float fTime, effect eEffect, object oTarget);
//Apply effects to targets.
void Sp_ApplyEffects(int nBlocking, object oAnchor, float fSize, int nCounter, effect eLink1, float fDuration1, effect eLink2, float fDuration2, int nRacial = RACIAL_TYPE_ALL);
//Removes all effects from the spells , Knights Mind, Mind Mastery and Battle Meditation
void Sp_RemoveBuffSpell();
//Prints a string for the spell stript
void SP_MyPrintString(string sString);
//Posts a string for the spell script
void SP_MyPostString(string sString, int n1 = 5, int n2 = 10, float fTime = 4.0);
//Interates through given a time period and a damage amount and hurts someone.  Checks if the person is in conversation.
void SP_InterativeDamage(effect eDamage, int nSecondsRemaining, object oTarget);
//Checks to see if the target is a Turret
int SP_CheckAppearanceTurret(object oTarget, int nFeedback = FALSE);
//Checks to see if the target is a Mark 1, 2, 4 or Spyder Droid
int SP_CheckAppearanceGeoDroid(object oTarget);
//Checks if the character already has Energy Resistance and Improved Energy Resistance
int SP_CheckEnergyResistance(object oTarget);
//This checks all of the delayed effect applications to make sure the target is still hostile and has not surrendered
void SP_MyApplyEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration=0.0);
//Checks droids appearance type and if they have shields up
int SP_CheckAppearanceGeoDroidShields(object oTarget, int nFeedback = FALSE);
//Check push compatibility, if true is passed in for the Whirlwind an addition check for shields is made
int SP_CheckForcePushViability(object oTarget, int Whirlwind);

// DJS-OEI 12/9/2003
void Sp_RemoveRelatedPowers( object oTarget, int nPowerID );
int Sp_BetterRelatedPowerExists( object oTarget, int nPowerID );
void Sp_RemoveRelatedPowersInRadius( int nPowerID, float nRadius );
int Sp_IsJedi( object oTarget );

// DJS-OEI 3/25/2004
// Due to the addition of Lightsaber/Consular Forms and their
// frequent modification of damage, I've implemented this function
// to calculate the damage for a Force Power based on the parameters
// passed in, as well as adding in modifiers based on the target
// or caster's active Form.
int Sp_CalcDamage( object oTarget, int nNumDice, int nSizeDice, int nFlatAmount=0 );

// DJS-OEI 3/28/2004
// Similar to Sp_CalcDamage(), this function calculates the duration
// of a Force Power, taking into account the base duration as well
// as modifiers due to Consular Forms.
float Sp_CalcDuration( float fBaseDuration );

// DJS-OEI 3/29/2004
// Similar to Sp_CalcDamage(), this function calculates the range
// of a Force Power, taking into account the base range as well
// as modifiers due to Consular Forms.
float Sp_CalcRange( float fBaseRange );

//::///////////////////////////////////////////////
//:: Apply Delayed Effect
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This checks all of the delayed effect applications
    to make sure the target is still hostile and has
    not surrendered
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 20, 2003
//:://////////////////////////////////////////////
void SP_MyApplyEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration=0.0)
{
    if(GetIsEnemy(oTarget))
    {
        ApplyEffectToObject(nDurationType, eEffect, oTarget, fDuration);
    }
}

//::///////////////////////////////////////////////
//:: Interative Damage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Interates through given a time period and a
    damage amount and hurts someone.  Checks if
    the person is in conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 5, 2003
//:://////////////////////////////////////////////
void SP_InterativeDamage(effect eDamage, int nSecondsRemaining, object oTarget)
{
    if(GetIsObjectValid(oTarget))
    {
        if(!GetIsConversationActive() && !GetIsDead(oTarget) && GetIsEnemy(oTarget))
        {
             if (nSecondsRemaining % 2 == 0)
             {
                  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
             }
             --nSecondsRemaining;
             if (nSecondsRemaining > 0)
             {
                DelayCommand(1.0f, SP_InterativeDamage(eDamage, nSecondsRemaining, oTarget));
             }
        }
    }
}

//::///////////////////////////////////////////////
//:: Blocking Checks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does the Spell Resistance and Immunity
    Checks
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 15, 2002
//:://////////////////////////////////////////////

int Sp_BlockingChecks(object oTarget, effect eEffect1, effect eEffect2, effect eDamage)
{
    int nReturn = FALSE;
    //MODIFIED by Preston Watamaniuk on April 11th
    //Put the immunity check in place for Force Powers.
    if(GetIsLinkImmune(oTarget, eEffect1) || GetIsLinkImmune(oTarget, eEffect2) || GetIsLinkImmune(oTarget, eDamage))
    {
        DisplayFeedBackText(oTarget, 1);
        nReturn = TRUE;
    }

    // DJS-OEI 7/20/2004
    // Form/Stance re-design.
    /*
    // DJS-OEI 3/29/2004
    // Users of the Power of the Dark Side III Consular Form
    // are immune to any spell with the Form Mask for that Form.
    if( GetSpellFormMask( GetSpellId() ) & FORM_MASK_POWER_OF_THE_DARK_SIDE ) {
        if( IsFormActive( oTarget, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_III ) ) {
            DisplayFeedBackText(oTarget, 1);
            nReturn = TRUE;
        }
    }
    */

    if(ResistForce(OBJECT_SELF, oTarget))
    {
        DisplayFeedBackText(oTarget, 0);
        nReturn = TRUE;
    }

    if(nReturn == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
    }

    return nReturn;
}

// DJS-OEI 3/16/2004
int Sp_IsJedi( object oTarget ) {

    if( ( GetLevelByClass( CLASS_TYPE_JEDICONSULAR, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_JEDIGUARDIAN, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_JEDIMASTER, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_JEDISENTINEL, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_JEDIWATCHMAN, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_JEDIWEAPONMASTER, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_SITHASSASSIN, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_SITHLORD, oTarget ) > 0 ) ||
        ( GetLevelByClass( CLASS_TYPE_SITHMARAUDER, oTarget ) > 0 ) ) {
        return TRUE;
    }
    return FALSE;
}

// DJS-OEI 3/25/2004
// Due to the addition of Lightsaber/Consular Forms and their
// frequent modification of damage, I've implemented this function
// to calculate the damage for a Force Power based on the parameters
// passed in, as well as adding in modifiers based on the target
// or caster's active Form.
int Sp_CalcDamage( object oTarget, int nNumDice, int nSizeDice, int nFlatAmount ) {

    int nDamage = 0;
    int nMod = 0;
    int nCounter = 0;

    if( nFlatAmount != 0 ) {
        nDamage = nFlatAmount;
    }
    else {
        // DJS-OEI 7/20/2004
        // Form/Stance re-design.
        /*
        // The caller is using using die rolls to determine.
        // damage. The Force Potency Form tree plays havoc
        // with this process since it can change rolls of 1 or 2
        // to higher values.
        if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_POTENCY_I ) ) {

            // Change all ones rolled to twos.
            int nRoll;
            for( nCounter=0; nCounter<nNumDice; nCounter++ ) {

                nRoll = Random( nSizeDice ) + 1;
                if( nRoll < 2 ) {
                    nRoll = 2;
                }
                nDamage += nRoll;
            }
        }
        else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_POTENCY_II ) ||
                 IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_POTENCY_III ) ) {

            // Change all ones and twos rolled to threes.
            int nRoll;
            for( nCounter=0; nCounter<nNumDice; nCounter++ ) {

                nRoll = Random( nSizeDice ) + 1;
                if( nRoll < 3 ) {
                    nRoll = 3;
                }
                nDamage += nRoll;
            }
        }
        */
        switch( nSizeDice ) {
            case 2:
                nDamage = d2( nNumDice );
                break;
            case 3:
                nDamage = d3( nNumDice );
                break;
            case 4:
                nDamage = d4( nNumDice );
                break;
            case 6:
                nDamage = d6( nNumDice );
                break;
            case 8:
                nDamage = d8( nNumDice );
                break;
            case 10:
                nDamage = d10( nNumDice );
                break;
            case 12:
                nDamage = d12( nNumDice );
                break;
            case 20:
                nDamage = d20( nNumDice );
                break;
            case 100:
                nDamage = d100( nNumDice );
                break;
            default:
                SP_MyPrintString("SP_CalcDamage() - Invalid Die Size:" + IntToString(nSizeDice));
                return 0;
                break;
        }
    }

    // DJS-OEI 7/20/2004
    // Form/Stance re-design.
    /////////////////////////////////////////////////
    // Modifiers due to caster's Form
    /////////////////////////////////////////////////
    // The Force Focus Form increases damage
    // for offensive Force Powers.
    if( IsFormActive( OBJECT_SELF, FORM_FORCE_I_FOCUS ) ) {
        // +3 to damage.
        nDamage += 3;
    }
    else if( IsFormActive( OBJECT_SELF, FORM_FORCE_II_POTENCY ) ) {
        // DJS-OEI 8/24/2004
        // Changed to +30%.
        /*
        // +1 damage for each class level. We'll just get the
        // levels attained for the base class and sub-class.
        int nTotalLevel = GetLevelByPosition( 1, OBJECT_SELF ) + GetLevelByPosition( 2, OBJECT_SELF );
        nDamage += nTotalLevel;
        */
        int nExtraDamage = ( nDamage * 30 ) / 100;
        nDamage += nExtraDamage;
    }

    /*
    // The Force Focus Lightsaber Form I-III increases damage
    // for offensive Force Powers.
    if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_FOCUS_I ) ) {
        // +1 to damage.
        nDamage += 1;
    }
    else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_FOCUS_II ) ) {
        // +3 to damage.
        nDamage += 3;
    }
    else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_FOCUS_III ) ) {
        // If the damage is a flat amount, just add 5. Otherwise, the
        // damage was calculated with die rolls. Increase the damage
        // by 1 for each die rolled.
        if( nFlatAmount == 0 ) {
            nDamage += nNumDice;
        }
        else {
            nDamage += 5;
        }
    }

    // The Force Potency Form I-III increases damage for offensive
    // Force Powers.
    if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_POTENCY_I ) ) {
        // If the damage is a flat amount, just add 5. Otherwise, the
        // damage was calculated with die rolls. Increase the damage
        // by 1 for each die rolled.
        if( nFlatAmount == 0 ) {
            nDamage += nNumDice;
        }
        else {
            nDamage += 5;
        }
    }
    else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_POTENCY_II ) ) {
        // If the damage is a flat amount, just add 7. Otherwise, the
        // damage was calculated with die rolls. Increase the damage
        // by 1 for each die rolled.
        if( nFlatAmount == 0 ) {
            nDamage += nNumDice;
        }
        else {
            nDamage += 7;
        }
    }
    else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_POTENCY_III ) ) {
        // If the damage is a flat amount, just add 10. Otherwise, the
        // damage was calculated with die rolls. Increase the damage
        // by 2 for each die rolled.
        if( nFlatAmount == 0 ) {
            nDamage += nNumDice*2;
        }
        else {
            nDamage += 10;
        }
    }

    // The Power of the Dark Side Form I-III increases damage for offensive
    // Force Powers.
    if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_I ) ||
        IsFormActive( OBJECT_SELF, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_II ) ) {
        // If the damage is a flat amount, add nothing. Otherwise, the
        // damage was calculated with die rolls. Increase the damage
        // by 1 for each die rolled.
        if( nFlatAmount == 0 ) {
            nDamage += nNumDice;
        }
    }
    else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_III ) ) {
        // If the damage is a flat amount, add nothing. Otherwise, the
        // damage was calculated with die rolls. Increase the damage
        // by 2 for each die rolled.
        if( nFlatAmount == 0 ) {
            nDamage += nNumDice*2;
        }
    }

    /////////////////////////////////////////////////
    // Modifiers due to target's Form
    /////////////////////////////////////////////////

    // The Ancient III Lightsaber Form and Force Armor III Form
    // both reduce damage by 1/2 of the target's level.
    if( IsFormActive( oTarget, FORM_LIGHTSABER_ANCIENT_III ) ||
        IsFormActive( oTarget, FORM_CONSULAR_FORCE_SHELL_III ) ) {
        nMod = GetHitDice( oTarget )/2;
        if( nDamage > nMod ) {
            nDamage -= nMod;
        }
        else {
            nDamage = 0;
        }
    }

    // The Force Armor II Form reduces damage by 4.
    if( IsFormActive( oTarget, FORM_CONSULAR_FORCE_SHELL_II ) ) {
        if( nDamage > 4 ) {
            nDamage -= 4;
        }
        else {
            nDamage = 0;
        }
    }
    */

    return nDamage;
}

// DJS-OEI 3/28/2004
// Similar to Sp_CalcDamage(), this function calculates the duration
// of a Force Power, taking into account the base duration as well
// as modifiers due to Consular Forms.
float Sp_CalcDuration( float fBaseDuration ) {

    float fFinalDuration = fBaseDuration;

    // DJS-OEI 7/20/2004
    // Form/Stance re-design.
    if( IsFormActive( OBJECT_SELF, FORM_FORCE_IV_MASTERY ) ) {
        // Duration is increased by 50%.
        fFinalDuration = fFinalDuration * 1.50f;
    }

    /*
    // If the Form Mask of the spell we're casting has the
    // Enduring Force mask, its duration can be modified
    // when Enduring Force is the caster's active Form.
    if( GetSpellFormMask( GetSpellId() ) & FORM_MASK_ENDURING_FORCE ) {
        if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_ENDURING_FORCE_I ) ) {
            // Duration is increased by 25%.
            fFinalDuration = fFinalDuration * 1.25f;
        }
        else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_ENDURING_FORCE_II ) ) {
            // Duration is increased by 50%.
            fFinalDuration = fFinalDuration * 1.50f;
        }
        else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_ENDURING_FORCE_III ) ) {
            // Duration is increased by 100%.
            fFinalDuration = fFinalDuration * 2.0f;
        }
    }
    */
    return fFinalDuration;
}

// DJS-OEI 3/29/2004
// Similar to Sp_CalcDamage(), this function calculates the range
// of a Force Power, taking into account the base range as well
// as modifiers due to Consular Forms.
float Sp_CalcRange( float fBaseRange ) {

    float fFinalRange = fBaseRange;

    // DJS-OEI 7/20/2004
    // Form/Stance re-design.
    /*
    // If the Form Mask of the spell we're casting has the
    // Force Amplification mask, its range can be modified
    // when Force Amplification is the caster's active Form.
    if( GetSpellFormMask( GetSpellId() ) & FORM_MASK_FORCE_AMPLIFICATION ) {
        if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_AMPLIFICATION_I ) ) {
            // Duration is increased by 25%.
            fFinalRange = fFinalRange * 1.25f;
        }
        else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_AMPLIFICATION_II ) ) {
            // Duration is increased by 50%.
            fFinalRange = fFinalRange * 1.50f;
        }
        else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_FORCE_AMPLIFICATION_III ) ) {
            // Duration is increased by 100%.
            fFinalRange = fFinalRange * 2.0f;
        }
    }
    */
    return fFinalRange;
}

int Sp_MySavingThrows(object oTarget, int iSpellDC = 0)
{
    int nSave;
    int nMod;

    // FAK - OEI , for allowing spell based DC
    if (iSpellDC > 0)
    {
        nMod = iSpellDC;
    }
    else
    {
        nMod = Sp_GetJediDCSave();
    }

    // DJS-OEI 7/20/2004
    // Form/Stance re-design.
    /////////////////////////////////////////////////
    // Modifiers due to caster's Form
    /////////////////////////////////////////////////
    if( IsFormActive( OBJECT_SELF, FORM_FORCE_IV_MASTERY ) ) {
        // +2 bonus to DC.
        nMod += 2;
    }

    /////////////////////////////////////////////////
    // Modifiers due to target's Form
    /////////////////////////////////////////////////
    // If the target has a bonus to saves, we just decrease
    // the DC by that amount. If it's a penalty, we increase it.
    if( IsFormActive( oTarget, FORM_SABER_II_MAKASHI ) ||
        IsFormActive( oTarget, FORM_FORCE_I_FOCUS ) ) {
        // +2 bonus to save.
        nMod -= 2;
    }
    else if( IsFormActive( oTarget, FORM_SABER_VI_NIMAN ) ) {
        // +1 bonus to save.
        nMod -= 1;
    }
    else if( IsFormActive( oTarget, FORM_SABER_VII_JUYO ) ||
             IsFormActive( oTarget, FORM_FORCE_IV_MASTERY ) ) {
        // -4 penalty to save.
        nMod += 4;
    }

    /*
    /////////////////////////////////////////////////
    // Modifiers due to caster's Form
    /////////////////////////////////////////////////

    // DJS-OEI 3/25/2004
    // The Power of the Dark Side Form provides bonuses to the
    // DC of the save.
    if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_I ) ) {
        // +1 bonus to DC.
        nMod += 1;
    }
    else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_II ) ||
             IsFormActive( OBJECT_SELF, FORM_CONSULAR_POWER_OF_THE_DARK_SIDE_III ) ) {
        // +2 bonus to DC.
        nMod += 2;
    }

    /////////////////////////////////////////////////
    // Modifiers due to target's Form
    /////////////////////////////////////////////////

    // DJS-OEI 3/16/2004
    // The Total Defense Stance gives Jedis a +4 to their
    // saving throws versus force powers. We just decrease
    // the DC by that amount.
    if( IsInTotalDefense( oTarget ) && Sp_IsJedi( oTarget ) ) {
        nMod -= 4;
    }

    // DJS-OEI 3/25/2004
    // The Ancient Lightsaber Form provides bonuses to saves,
    // which we handle as decreases to the DC.
    if( IsFormActive( oTarget, FORM_LIGHTSABER_ANCIENT_I ) ||
        IsFormActive( oTarget, FORM_LIGHTSABER_ANCIENT_II ) ) {
        // +1 bonus to save.
        nMod -= 1;
    }
    else if( IsFormActive( oTarget, FORM_LIGHTSABER_ANCIENT_III ) ) {
        // +2 bonus to save.
        nMod -= 2;
    }

    // DJS-OEI 3/25/2004
    // The Force Armor I-III Form provides bonuses to saves,
    // which we handle as decreases to the DC.
    if( IsFormActive( oTarget, FORM_CONSULAR_FORCE_SHELL_I ) ) {
        // +2 bonus to save.
        nMod -= 2;
    }
    else if( IsFormActive( oTarget, FORM_CONSULAR_FORCE_SHELL_II ) ) {
        // +4 bonus to save.
        nMod -= 4;
    }
    else if( IsFormActive( oTarget, FORM_CONSULAR_FORCE_SHELL_III ) ) {
        // +6 bonus to save.
        nMod -= 6;
    }
    */

    if( nMod < 0 ) {
        nMod = 0;
    }

    if(SWFP_PRIVATE_SAVE_TYPE == SAVING_THROW_FORT)
    {
        nSave = FortitudeSave(oTarget,nMod, SWFP_PRIVATE_SAVE_VERSUS_TYPE);
        SP_MyPrintString("Fort Save = " + IntToString(nSave) + " For DC of " + IntToString(nMod));
    }
    else if(SWFP_PRIVATE_SAVE_TYPE == SAVING_THROW_REFLEX)
    {
        nSave = ReflexSave(oTarget, nMod, SWFP_PRIVATE_SAVE_VERSUS_TYPE);
        SP_MyPrintString("Reflex Save = " + IntToString(nSave)+" For DC of " + IntToString(nMod));
    }
    else if(SWFP_PRIVATE_SAVE_TYPE == SAVING_THROW_WILL)
    {
        nSave = WillSave(oTarget, nMod, SWFP_PRIVATE_SAVE_VERSUS_TYPE);
        SP_MyPrintString("Will Save = " + IntToString(nSave)+" For DC of " + IntToString(nMod));
    }
    if(nSave > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
        DisplayFeedBackText(oTarget, 2);
    }
    return nSave;
}

void Sp_RemoveSpellEffects(int nSpell_ID, object oCaster, object oTarget)
{
    //Declare major variables
    int bValid = FALSE;
    effect eAOE;
    if(GetHasSpellEffect(nSpell_ID, oTarget))
    {
        //Search through the valid effects on the target.
        eAOE = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eAOE) && bValid == FALSE)
        {
            if (GetEffectCreator(eAOE) == oCaster)
            {
                //If the effect was created by the spell then remove it
                if(GetEffectSpellId(eAOE) == nSpell_ID)
                {
                    RemoveEffect(oTarget, eAOE);
                    bValid = TRUE;
                }
            }
            //Get next effect on the target
            eAOE = GetNextEffect(oTarget);
        }
    }
}

void Sp_RemoveSpecificEffect(int nEffectTypeID, object oTarget)
{
    //Declare major variables
    //Get the object that is exiting the AOE
    int bValid = FALSE;
    effect eAOE;
    //Search through the valid effects on the target.
    eAOE = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eAOE))
    {
        if (GetEffectType(eAOE) == nEffectTypeID)
        {
            //If the effect was created by the spell then remove it
            bValid = TRUE;
            RemoveEffect(oTarget, eAOE);
        }
        //Get next effect on the target
        eAOE = GetNextEffect(oTarget);
    }
}

float Sp_GetSpellEffectDelay(location SpellTargetLocation, object oTarget)
{
    float fDelay;
    return fDelay = GetDistanceBetweenLocations(SpellTargetLocation, GetLocation(oTarget))/20;
}

float Sp_GetRandomDelay(float fMinimumTime = 0.4, float MaximumTime = 1.1)
{
    float fRandom = MaximumTime - fMinimumTime;
    int nRandom;
    if(fRandom < 0.0)
    {
        return 0.0;
    }
    else
    {
        nRandom = FloatToInt(fRandom  * 10.0);
        nRandom = Random(nRandom) + 1;
        fRandom = IntToFloat(nRandom);
        fRandom /= 10.0;
        return fRandom + fMinimumTime;
    }
}

int Sp_GetJediDCSave()
{
    int nDC = GetSpellSaveDC();
    return nDC;
}

void Sp_ApplyForcePowerEffects(float fTime, effect eEffect, object oTarget)
{
    float fDelay;
    int nRoll = d6();
    fDelay = IntToFloat(nRoll)/10.0;
    if(fTime == 1000.0)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
    }
    else if(fTime == 0.0)
    {
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oTarget));
    }
    else
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oTarget, fTime);
    }
}

int SP_CheckEnergyResistance(object oTarget)
{
    // DJS-OEI 12/9/2003
    // Added Master Energy Resistance to the check.
    if( GetHasSpellEffect(FORCE_POWER_RESIST_COLD_HEAT_ENERGY, oTarget) ||
        GetHasSpellEffect(FORCE_POWER_RESIST_POISON_DISEASE_SONIC, oTarget) ||
        GetHasSpellEffect(FORCE_POWER_MASTER_ENERGY_RESISTANCE, oTarget) )
    {
        return TRUE;
    }
    return FALSE;
}
//::///////////////////////////////////////////////
//:: Runs the specified force power.
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Runs the script for the particular force power.

    SWFP_HARMFUL = ;
    SWFP_PRIVATE_SAVE_TYPE;
    SWFP_PRIVATE_SAVE_VERSUS_TYPE;
    SWFP_DAMAGE;
    SWFP_DAMAGE_TYPE;
    SWFP_DAMAGE_VFX;

*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 30, 2002
//:://////////////////////////////////////////////

void  Sp_RunForcePowers()
{
    object oTarget = GetSpellTargetObject();
    effect eLink1, eLink2;
    effect eInvalid;
    SWFP_SHAPE = SHAPE_SPHERE;

    //P.W. (June 8) This makes the Taris Calo Nord immune to Force Push, breaks the cutscene if not.
    if(GetTag(oTarget) == "Calo082" && GetSpellId() == FORCE_POWER_FORCE_PUSH)
    {
        DisplayFeedBackText(oTarget, 1);
        return;
    }

    // DJS-OEI 10/18/2004
    // I'm going to jump on the hack bandwagon and make sure General Vaklu can't
    // be affected by Confusion.
    if(GetTag(oTarget) == "vaklu" && GetSpellId() == FORCE_POWER_CONFUSION)
    {
        DisplayFeedBackText(oTarget, 1);
        return;
    }
    // DJS-OEI 10/22/2004
    // Also made Bralor immune.
    else if(GetTag(oTarget) == "npc_bralor" && GetSpellId() == FORCE_POWER_CONFUSION)
    {
        DisplayFeedBackText(oTarget, 1);
        return;
    }

    switch (GetSpellId())
    {
        /*
        AFFLICTION
        */
        case FORCE_POWER_AFFLICTION:
        {
            // If the target is already poisoned in any way, don't
            // apply this effect.
            if(!GetIsPoisoned(oTarget))
            {
                // DJS-OEI 12/9/2003
                // For KotOR2, we have decided to modify the application behavior
                // of Force Power trees. Lower level versions of Force Powers will
                // no longer overwrite higher level versions, although this means
                // the caster still loses their Force Points to no effect. Also,
                // casting a Force Power will remove any Force Powers of equal or
                // lesser level prior to applying themselves.

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( oTarget, FORCE_POWER_AFFLICTION );

                // Do not apply the effects of this power if a more powerful
                // version is already attached to the target.
                if( !Sp_BetterRelatedPowerExists( oTarget, FORCE_POWER_AFFLICTION ) ) {

                    SWFP_HARMFUL = TRUE;

                    eLink1 = EffectPoison(POISON_ABILITY_SCORE_AVERAGE);
                    eLink1 = EffectLinkEffects(eLink1, EffectMovementSpeedDecrease(50));
                    //eLink1 = SetEffectIcon(eLink1, 23);
                    eLink1 = SetEffectIcon(eLink1, 1);//RWT-OEI 07/08/04 - Affliction is a specific effect

                    //Sp_ApplyEffects(FALSE, oTarget, 0.0, 1, eLink1, 1000.0, eInvalid, 0.0);
                    //RWT-OEI 09/27/04 - Apparently this is supposed to last 21 seconds.
                    Sp_ApplyEffects(FALSE, oTarget, 0.0, 1, eLink1, 21.0, eInvalid, 0.0);
                }
            }
            // DJS-OEI 10/22/2004
            else {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
            }
        }
        break;

        /*
        CHOKE
        */
        case FORCE_POWER_CHOKE:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, 0, 0, (GetHitDice(OBJECT_SELF)*2)/3 );
            //SWFP_DAMAGE = (GetHitDice(OBJECT_SELF)*2)/3;

            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;
            SWFP_DAMAGE_VFX = VFX_IMP_CHOKE;

            eLink1 = EffectAbilityDecrease(ABILITY_CONSTITUTION, 4);
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityDecrease(ABILITY_STRENGTH, 4));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityDecrease(ABILITY_DEXTERITY, 4));
            eLink1 = SetEffectIcon(eLink1, 3);

            effect eChoke = EffectChoke();
            effect eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);

            int nResist = Sp_BlockingChecks(oTarget, eChoke, eDamage, eInvalid);
            int nSaves;
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if(nResist == 0)
            {
                nSaves = Sp_MySavingThrows(oTarget);
                if(nSaves == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_CHOKE), oTarget);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eChoke, oTarget, 6.0);

                    float fDuration = Sp_CalcDuration( 24.0 );
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                    int nIdx = 1;
                    float fDelay;
                    SP_InterativeDamage(eDamage, 7, oTarget);
                }
            }
            if(nResist > 0 || nSaves > 0)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }
        }
        break;

        /*
        HEAL
        */
        //MODIFIED by Preston Watamaniuk March 28
        // Remove cure poison and reduced the amount by 5
        case FORCE_POWER_CURE:
        {
            SWFP_HARMFUL = FALSE;

            // DJS-OEI 3/29/2004
            // The Regeneration Consular Forms increase the relevance of
            // the Wisdom and Charisma modifiers.
            int nMultiplier = 1;
            // DJS-OEI 7/20/2004
            // Form/Stance re-design.
            /*
            if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_I ) ) {
                nMultiplier = 2;
            }
            else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_II ) ||
                     IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_III ) ) {
                nMultiplier = 3;
            }
            */

            int nHeal = ( ( GetAbilityModifier(ABILITY_WISDOM) + GetAbilityModifier(ABILITY_CHARISMA) ) * nMultiplier ) + 5 + GetHitDice(OBJECT_SELF);

            effect eVis =  EffectVisualEffect(VFX_IMP_CURE);
            int nCnt = 0;

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                oParty = OBJECT_SELF;
            }

            while(nCnt < 3)
            {
                if(GetIsObjectValid(oParty) &&
                   GetRacialType(oParty) != RACIAL_TYPE_DROID &&
                   GetDistanceBetween(OBJECT_SELF, oParty) < 15.0)
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
                    //Sp_RemoveSpecificEffect(EFFECT_TYPE_POISON, oParty);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oParty);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oParty);
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
                }
            }
        }
        break;

        /*
        DEATH FIELD
        */
        case FORCE_POWER_DEATH_FIELD:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_DARK_SIDE;
            int nDamTest = GetHitDice(OBJECT_SELF);
            if(nDamTest > 10)
            {
                nDamTest = 10;
            }

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDamTest, 4 );
            //SWFP_DAMAGE = d4(nDamTest);
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_DARK_SIDE;
            SWFP_DAMAGE_VFX = VFX_PRO_DEATH_FIELD;

            int nHealCount;
            int nDamage = SWFP_DAMAGE/2;
            effect eDamage;
            effect eBeam = EffectBeam(VFX_BEAM_DEATH_FIELD_TENTACLE, OBJECT_SELF, BODY_NODE_HEAD);
            effect eVFX = EffectVisualEffect(VFX_PRO_DEATH_FIELD);

            //object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 12.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 12.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oTarget))
            {
                int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eDamage);
                if((GetRacialType(oTarget) == RACIAL_TYPE_HUMAN &&
                   GetRacialType(oTarget) != RACIAL_TYPE_DROID) || GetObjectType(oTarget) == OBJECT_TYPE_PLACEABLE)
                {
                    if(GetIsEnemy(oTarget))
                    {
                        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                        if(nResist == 0)
                        {
                            int nSaves = Sp_MySavingThrows(oTarget);
                            if(nSaves == FALSE)
                            {
                                eDamage =  EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                                nHealCount += SWFP_DAMAGE;
                            }
                            else
                            {
                                eDamage =  EffectDamage(nDamage, SWFP_DAMAGE_TYPE);
                                nHealCount += nDamage;
                            }
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, fLightningDuration);
                        }
                        else
                        {
                            //effect eBeam2 = EffectBeam(VFX_BEAM_DEATH_FIELD_TENTACLE, OBJECT_SELF, BODY_NODE_HEAD, TRUE);
                            //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, fLightningDuration);
                        }
                    }
                }
                //oTarget = GetNextObjectInShape(SHAPE_SPHERE, 12.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, 12.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
            if(GetCurrentHitPoints(OBJECT_SELF) < GetMaxHitPoints(OBJECT_SELF) && nHealCount > 0)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHealCount), OBJECT_SELF);
            }
        }
        break;

        /*
        DRAIN LIFE
        */
        case FORCE_POWER_DRAIN_LIFE:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;
            int nDam = GetHitDice(OBJECT_SELF);
            int nDamTest = GetHitDice(OBJECT_SELF);
            if(nDamTest > 10)
            {
                nDamTest = 10;
            }

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDamTest, 4 );
            //SWFP_DAMAGE = d4(nDamTest);
            SWFP_DAMAGE_TYPE= DAMAGE_TYPE_DARK_SIDE;
            SWFP_DAMAGE_VFX = VFX_PRO_DRAIN;
            //Set up the drain effect link for the target
            effect eBeam = EffectBeam(VFX_BEAM_DRAIN_LIFE, OBJECT_SELF, BODY_NODE_HAND);
            effect eVFX = EffectVisualEffect(SWFP_DAMAGE_VFX);
            //Set up the link to Heal the user by the same amount.
            effect eHeal;
            effect eDamage = EffectDamage(SWFP_DAMAGE, DAMAGE_TYPE_DARK_SIDE);

            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, fLightningDuration);
            DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget));

            int nResist = Sp_BlockingChecks(oTarget, eDamage, eInvalid, eInvalid);

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if(GetRacialType(oTarget) != RACIAL_TYPE_DROID)
            {
                if(nResist == 0)
                {
                    int nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves > 0)
                    {
                        SWFP_DAMAGE /= 2;
                    }
                    eDamage = EffectDamage(SWFP_DAMAGE,  DAMAGE_TYPE_DARK_SIDE);
                    if(GetCurrentHitPoints(OBJECT_SELF) < GetMaxHitPoints(OBJECT_SELF) && SWFP_DAMAGE > 0)
                    {
                        eHeal = EffectHeal(SWFP_DAMAGE);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);
                    }
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                }
            }
        }
        break;

        /*
        DESTROY DROID
        */
        case FORCE_POWER_DROID_DESTROY:
        {
            int bIsMine = FALSE;
            //RWT-OEI 08/31/04 - Need to special case the mine stuff
            //everywhere below.
            //We don't have to confirm that the targetted trap is the
            //right level of trap to get blown up because it wouldn't
            //have been targettable otherwise. But all the traps in the loop
            //for the AoE portion will have to be tested.
            if ( GetObjectType(oTarget) == OBJECT_TYPE_TRIGGER )
            {
                //Check for MINOR and AVERAGE and STRONG trap types now
                int nMineType = GetTrapBaseType(oTarget);
                if ( !GetIsTrapped(oTarget) )
                {
                    nMineType = -1;
                }
                if ( nMineType == TRAP_BASE_TYPE_FLASH_STUN_MINOR            ||
                     nMineType == TRAP_BASE_TYPE_FLASH_STUN_AVERAGE          ||
                     nMineType == TRAP_BASE_TYPE_FLASH_STUN_STRONG           ||
                     nMineType == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR     ||
                     nMineType == TRAP_BASE_TYPE_FRAGMENTATION_MINE_AVERAGE  ||
                     nMineType == TRAP_BASE_TYPE_FRAGMENTATION_MINE_STRONG   ||
                     nMineType == TRAP_BASE_TYPE_LASER_SLICING_MINOR         ||
                     nMineType == TRAP_BASE_TYPE_LASER_SLICING_AVERAGE       ||
                     nMineType == TRAP_BASE_TYPE_LASER_SLICING_STRONG        ||
                     nMineType == TRAP_BASE_TYPE_POISON_GAS_MINOR            ||
                     nMineType == TRAP_BASE_TYPE_POISON_GAS_AVERAGE          ||
                     nMineType == TRAP_BASE_TYPE_POISON_GAS_STRONG           ||
                     nMineType == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR          ||
                     nMineType == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE        ||
                     nMineType == TRAP_BASE_TYPE_SONIC_CHARGE_STRONG
                     )
                 {
                     bIsMine = TRUE;
                 }
                 else
                 {
                    break;//Somehow a non-mine trigger got targetted. Just bail
                 }
            }

            SWFP_HARMFUL = TRUE;
            //SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_REFLEX;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;//RWT-OEI 09/27/04
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_ELECTRICAL;

            float fRange = Sp_CalcRange( 6.0 );

            eLink1 = EffectBeam(VFX_BEAM_DROID_DESTROY, oTarget, BODY_NODE_CHEST);
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_PRO_LIGHTNING_L));

            eLink2 = EffectDroidStun();
            eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(1008));
            eLink2 = SetEffectIcon(eLink2, 5);

            effect eLink3 = EffectBeam(VFX_BEAM_DROID_DESTROY, OBJECT_SELF, BODY_NODE_HAND);
            eLink3 = EffectLinkEffects(eLink3, EffectVisualEffect(VFX_PRO_LIGHTNING_L));

            // DJS-OEI 3/25/2004
            int nDamage = Sp_CalcDamage( oTarget, GetHitDice(OBJECT_SELF), 6 );
            //int nDamage = d6(GetHitDice(OBJECT_SELF));
            int nApply;

            // DJS-OEI 11/20/2003
            // If the target has the Evasion feat, the damage on a successful
            // Reflex save is 0. Otherwise, it's half the original damage.
            if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                nApply = 0;
            }
            else {
                nApply = nDamage/2;
            }

            effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);;
            effect eSaveDamage = EffectDamage(nApply, DAMAGE_TYPE_ELECTRICAL);


            //Apply Effects to the first droid targeted.
            int nResist = 0;
            if ( !bIsMine )
            {
                nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
            }
            int nSaves = 0;
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink3, oTarget, fLightningDuration);
            if(nResist == 0)
            {
                if (!bIsMine)
                {
                    nSaves = Sp_MySavingThrows(oTarget);
                }
                if(nSaves == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage , oTarget);
                    float fDuration = Sp_CalcDuration( 12.0 );
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSaveDamage , oTarget);
                }
            }
            else
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }

            //RWT-OEI 08/31/04 - Cache location here since this object goes baibai
            location lTarget = GetLocation(oTarget);
            if ( bIsMine )
            {
                AssignCommand(oTarget,ExecuteScript( "k_trp_generic",oTarget));
                DetonateMine(oTarget);
            }

            //Start going through all hostile droids around the primary target
            //object oSecond = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            object oSecond = GetFirstObjectInShape(SHAPE_SPHERE, fRange, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_TRIGGER);
            while(GetIsObjectValid(oSecond))
            {
                int bIsMine2 = FALSE;
                if (GetObjectType(oSecond) == OBJECT_TYPE_TRIGGER)
                {
                    //Check for MINOR, AVERAGE, and STRONG mine types here
                    int nMineType2 = GetTrapBaseType(oSecond);
                    if ( !GetIsTrapped(oSecond) )
                    {
                        nMineType2 = -1;
                    }
                    if (nMineType2 == TRAP_BASE_TYPE_FLASH_STUN_MINOR            ||
                        nMineType2 == TRAP_BASE_TYPE_FLASH_STUN_AVERAGE          ||
                        nMineType2 == TRAP_BASE_TYPE_FLASH_STUN_STRONG           ||
                        nMineType2 == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR     ||
                        nMineType2 == TRAP_BASE_TYPE_FRAGMENTATION_MINE_AVERAGE  ||
                        nMineType2 == TRAP_BASE_TYPE_FRAGMENTATION_MINE_STRONG   ||
                        nMineType2 == TRAP_BASE_TYPE_LASER_SLICING_MINOR         ||
                        nMineType2 == TRAP_BASE_TYPE_LASER_SLICING_AVERAGE       ||
                        nMineType2 == TRAP_BASE_TYPE_LASER_SLICING_STRONG        ||
                        nMineType2 == TRAP_BASE_TYPE_POISON_GAS_MINOR            ||
                        nMineType2 == TRAP_BASE_TYPE_POISON_GAS_AVERAGE          ||
                        nMineType2 == TRAP_BASE_TYPE_POISON_GAS_STRONG           ||
                        nMineType2 == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR          ||
                        nMineType2 == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE        ||
                        nMineType2 == TRAP_BASE_TYPE_SONIC_CHARGE_STRONG
                        )
                    {
                        bIsMine2 = TRUE;
                    }
                    else
                    {
                        continue;//This is a non-mine trigger. Just skip it.
                    }
                }
                if(oSecond != oTarget && GetIsEnemy(oSecond) && (GetRacialType(oSecond) == RACIAL_TYPE_DROID || bIsMine2))
                {
                    if ( !bIsMine2 )
                    {
                        nResist = Sp_BlockingChecks(oSecond, eLink1, eLink2, eInvalid);
                    }
                    else
                    {
                        nResist = 0;
                    }

                    SignalEvent(oSecond, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    if(nResist == 0)
                    {
                        if ( !bIsMine2 )
                        {
                            nSaves = Sp_MySavingThrows(oSecond);
                        }
                        else
                        {
                            nSaves = 0;
                        }
                        //Apply the beam effect and hit regardless because damage is still done.
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oSecond, fLightningDuration);
                        if(nSaves == 0)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage , oSecond);
                            float fDuration = Sp_CalcDuration( 12.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oSecond, fDuration);
                        }
                        else
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eSaveDamage , oSecond);
                        }
                        if ( bIsMine2 )
                        {
                            AssignCommand(oSecond,ExecuteScript( "k_trp_generic",oSecond));
                            DetonateMine(oSecond);
                        }
                    }
                }
                //oSecond = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oSecond = GetNextObjectInShape(SHAPE_SPHERE, fRange, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_TRIGGER);
            }
        }
        break;

        /*
        DISABLE DROID
        */
        case FORCE_POWER_DROID_DISABLE:
        {
            int bIsMine = FALSE;
            //RWT-OEI 08/31/04 - Need to special case the mine stuff
            //everywhere below.
            //We don't have to confirm that the targetted trap is the
            //right level of trap to get blown up because it wouldn't
            //have been targettable otherwise. But all the traps in the loop
            //for the AoE portion will have to be tested.
            if ( GetObjectType(oTarget) == OBJECT_TYPE_TRIGGER )
            {
                //Check for MINOR and AVERAGE trap types now
                int nMineType = GetTrapBaseType(oTarget);
                if ( !GetIsTrapped(oTarget) )
                {
                    nMineType = -1;
                }
                if ( nMineType == TRAP_BASE_TYPE_FLASH_STUN_MINOR            ||
                     nMineType == TRAP_BASE_TYPE_FLASH_STUN_AVERAGE          ||
                     nMineType == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR     ||
                     nMineType == TRAP_BASE_TYPE_FRAGMENTATION_MINE_AVERAGE  ||
                     nMineType == TRAP_BASE_TYPE_LASER_SLICING_MINOR         ||
                     nMineType == TRAP_BASE_TYPE_LASER_SLICING_AVERAGE       ||
                     nMineType == TRAP_BASE_TYPE_POISON_GAS_MINOR            ||
                     nMineType == TRAP_BASE_TYPE_POISON_GAS_AVERAGE          ||
                     nMineType == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR          ||
                     nMineType == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE )
                 {
                     bIsMine = TRUE;
                 }
                 else
                 {
                    break;//Somehow a non-mine trigger got targetted. Bail
                 }
            }
            SWFP_HARMFUL = TRUE;
            //SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_REFLEX;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;//RWT-OEI 09/27/04
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_ELECTRICAL;

            float fRange = Sp_CalcRange( 5.0 );

            eLink1 = EffectBeam(VFX_BEAM_DROID_DESTROY, oTarget, BODY_NODE_CHEST);
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_PRO_LIGHTNING_L));

            eLink2 = EffectDroidStun();
            eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(1008));
            eLink2 = SetEffectIcon(eLink2, 4);

            effect eLink3 = EffectBeam(VFX_BEAM_DROID_DISABLE, OBJECT_SELF, BODY_NODE_HAND);
            eLink3 = EffectLinkEffects(eLink3, EffectVisualEffect(VFX_PRO_LIGHTNING_L));

            // DJS-OEI 3/25/2004
            int nDamage = Sp_CalcDamage( oTarget, 0, 0, GetHitDice(OBJECT_SELF) );
            //int nDamage = GetHitDice(OBJECT_SELF);
            int nApply;

            // DJS-OEI 11/20/2003
            // If the target has the Evasion feat, the damage on a successful
            // Reflex save is 0. Otherwise, it's half the original damage.
            if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                nApply = 0;
            }
            else {
                nApply = nDamage/2;
            }

            effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);;
            effect eSaveDamage = EffectDamage(nApply, DAMAGE_TYPE_ELECTRICAL);


            //Apply Effects to the first droid targeted.
            int nResist = 0;
            if ( !bIsMine )
            {
                nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
            }
            int nSaves = 0;

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink3, oTarget, fLightningDuration);
            if(nResist == 0)
            {
                if ( !bIsMine )
                {
                    nSaves = Sp_MySavingThrows(oTarget);
                }
                if(nSaves == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage , oTarget);
                    float fDuration = Sp_CalcDuration( 12.0 );
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSaveDamage , oTarget);
                }
            }
            else
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }

            location lTarget = GetLocation(oTarget);
            if ( bIsMine )
            {
                AssignCommand(oTarget,ExecuteScript( "k_trp_generic",oTarget));
                DetonateMine(oTarget);
            }

            //Start going through all hostile droids around the primary target
            //object oSecond = GetFirstObjectInShape(SHAPE_SPHERE, fRange, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            object oSecond = GetFirstObjectInShape(SHAPE_SPHERE, fRange, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_TRIGGER);
            while(GetIsObjectValid(oSecond))
            {
                int bIsMine2 = FALSE;
                if (GetObjectType(oSecond) == OBJECT_TYPE_TRIGGER)
                {
                    int nMineType2 = GetTrapBaseType(oSecond);
                    if ( !GetIsTrapped(oSecond))
                    {
                        nMineType2 = -1;
                    }
                    if (nMineType2 == TRAP_BASE_TYPE_FLASH_STUN_MINOR            ||
                        nMineType2 == TRAP_BASE_TYPE_FLASH_STUN_AVERAGE          ||
                        nMineType2 == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR     ||
                        nMineType2 == TRAP_BASE_TYPE_FRAGMENTATION_MINE_AVERAGE  ||
                        nMineType2 == TRAP_BASE_TYPE_LASER_SLICING_MINOR         ||
                        nMineType2 == TRAP_BASE_TYPE_LASER_SLICING_AVERAGE       ||
                        nMineType2 == TRAP_BASE_TYPE_POISON_GAS_MINOR            ||
                        nMineType2 == TRAP_BASE_TYPE_POISON_GAS_AVERAGE          ||
                        nMineType2 == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR          ||
                        nMineType2 == TRAP_BASE_TYPE_SONIC_CHARGE_AVERAGE )
                    {
                        bIsMine2 = TRUE;
                    }
                    else
                    {
                        continue;//This is a non-mine trigger. Just skip it.
                    }
                }
                if(oSecond != oTarget && GetIsEnemy(oSecond) && (GetRacialType(oSecond) == RACIAL_TYPE_DROID || bIsMine2 ))
                {
                    int bIsMine2 = (GetObjectType(oSecond) == OBJECT_TYPE_TRIGGER);
                    if (!bIsMine2)
                    {
                        nResist = Sp_BlockingChecks(oSecond, eLink1, eLink2, eInvalid);
                    }

                    SignalEvent(oSecond, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    if(nResist == 0)
                    {
                        if ( !bIsMine2 )
                        {
                            AurPostString( "Mines found in radius.", 20, 21, 5.0f );
                            nSaves = Sp_MySavingThrows(oSecond);
                        }
                        //Apply the beam effect and hit regardless because damage is still done.
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oSecond, fLightningDuration);
                        if(nSaves == 0)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage , oSecond);
                            float fDuration = Sp_CalcDuration( 12.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oSecond, fDuration);
                        }
                        else
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eSaveDamage , oSecond);
                        }
                        if ( bIsMine2 )
                        {
                            AssignCommand(oSecond,ExecuteScript( "k_trp_generic",oSecond));
                            DetonateMine(oSecond);
                        }
                    }
                }
                //oSecond = GetNextObjectInShape(SHAPE_SPHERE, fRange, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oSecond = GetNextObjectInShape(SHAPE_SPHERE, fRange, lTarget, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_TRIGGER);
            }
        }
        break;

        /*
        STUN DROID
        */
        case FORCE_POWER_DROID_STUN:
        {
            //RWT-OEI 08/31/04
            //if the oTarget is a trigger, it's a mine, so handle way differently
            int bIsMine = 0;
            if ( GetObjectType(oTarget) == OBJECT_TYPE_TRIGGER )
            {
                int nMineType = GetTrapBaseType(oTarget);
                if ( !GetIsTrapped(oTarget) )
                {
                    nMineType = -1;
                }
                if ( nMineType == TRAP_BASE_TYPE_FLASH_STUN_MINOR             ||
                     nMineType == TRAP_BASE_TYPE_FRAGMENTATION_MINE_MINOR     ||
                     nMineType == TRAP_BASE_TYPE_LASER_SLICING_MINOR          ||
                     nMineType == TRAP_BASE_TYPE_POISON_GAS_MINOR            ||
                     nMineType == TRAP_BASE_TYPE_SONIC_CHARGE_MINOR )
                {
                    bIsMine = TRUE;
                }
                else
                {
                    break;//Somehow a none-mine trigger got targetted. Just skip
                }
            }
            //if ( GetObjectType(oTarget) == OBJECT_TYPE_TRIGGER )
            if ( bIsMine )
            {
                AurPostString( "Stun Droid on a mine.", 20,20,5.0f);
                eLink1 = EffectBeam(2065, OBJECT_SELF, BODY_NODE_HAND);
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_PRO_LIGHTNING_S));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fLightningDuration);
                AssignCommand(oTarget, ExecuteScript("k_trp_generic", oTarget));
                DetonateMine(oTarget);
            }
            else
            {//Otherwise target is a droid, so handle the existing way.
                SWFP_HARMFUL = TRUE;
                SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;
                SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_ELECTRICAL;

                // DJS-OEI 3/25/2004
                SWFP_DAMAGE = Sp_CalcDamage( oTarget, 0, 0, GetHitDice(OBJECT_SELF) );
                //SWFP_DAMAGE = GetHitDice(OBJECT_SELF);

                SWFP_DAMAGE_TYPE= DAMAGE_TYPE_ELECTRICAL;

                eLink1 = EffectBeam(2065, OBJECT_SELF, BODY_NODE_HAND); //P.W.(May 19, 2003) New Droid Stun Beam Effect added
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_PRO_LIGHTNING_S));
                eLink2 = EffectDroidStun();
                eLink2 = SetEffectIcon(eLink2, 30);
                eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(1007));  //P.W.(May 19, 2003) Linked the smoke to Link 2
                effect eDamage;

                int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fLightningDuration);

                if(nResist == 0)
                {
                    int nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves == 0)
                    {
                        eDamage = EffectDamage(SWFP_DAMAGE, DAMAGE_TYPE_ELECTRICAL);
                        float fDuration = Sp_CalcDuration( 12.0 );
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                    }
                    else
                    {
                        eDamage = EffectDamage(SWFP_DAMAGE/2, DAMAGE_TYPE_ELECTRICAL);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                    }
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                }
            }
        }
        break;

        /*
        FEAR
        */
        case FORCE_POWER_FEAR:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_FEAR;

            eLink1 = EffectHorrified();
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(1041));
            eLink1 = SetEffectIcon(eLink1, 6);

            float fDuration = Sp_CalcDuration( 6.0 );
            Sp_ApplyEffects(TRUE, oTarget, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
        }
        break;

        /*
        FORCE ARMOR
        */
        case FORCE_POWER_FORCE_ARMOR:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            float fDuration = Sp_CalcDuration( 20.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_ARMOR );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_FORCE_ARMOR ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectACIncrease(6, AC_DODGE_BONUS);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 6));
                eLink1 = SetEffectIcon(eLink1, 7);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
            }
            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_ARMOR)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_ARMOR);
                         eLink1 = EffectACIncrease(6, AC_DODGE_BONUS);
                         eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 6));
                         eLink1 = SetEffectIcon(eLink1, 7);
                         eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                         eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                    }
                }
            }
        }
        break;

        /*
        FORCE AURA
        */
        case FORCE_POWER_FORCE_AURA:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            float fDuration = Sp_CalcDuration( 20.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_AURA );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_FORCE_AURA ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectACIncrease(2, AC_DODGE_BONUS);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 2));
                eLink1 = SetEffectIcon(eLink1, 8);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_AURA);

                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_AURA)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_AURA);
                         eLink1 = EffectACIncrease(2, AC_DODGE_BONUS);
                         eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 2));
                         eLink1 = SetEffectIcon(eLink1, 8);
                         eLink2 = EffectVisualEffect(VFX_PRO_FORCE_AURA);

                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                    }
                }
            }
        }
        break;

        /*
        FORCE BREACH
        */
        case FORCE_POWER_FORCE_BREACH:
        {
            effect eBuff = GetFirstEffect(oTarget);
            int bValid = FALSE;
            while(GetIsEffectValid(eBuff))
            {
                if(GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_AURA ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_SHIELD ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_ARMOR ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_MIND ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_KNIGHT_MIND ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_MIND_MASTERY ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_SPEED_BURST  ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_KNIGHT_SPEED ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_SPEED_MASTERY ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_RESIST_COLD_HEAT_ENERGY ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_RESIST_POISON_DISEASE_SONIC ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_RESIST_FORCE ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_IMMUNITY ||
                   // DJS-OEI 12/9/2003
                   GetEffectSpellId(eBuff) == FORCE_POWER_MASTER_ENERGY_RESISTANCE ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_BARRIER ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_IMPROVED_FORCE_BARRIER ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_MASTER_FORCE_BARRIER ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_ENLIGHTENMENT )
                 {
                    RemoveEffect(oTarget, eBuff);
                 }
                 eBuff = GetNextEffect(oTarget);
            }
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_BREACH), oTarget);
        }
        break;

        /*
        FORCE IMMUNITY
        */
        case FORCE_POWER_FORCE_IMMUNITY:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_IMMUNITY );

            float fDuration = Sp_CalcDuration( 60.0 );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_FORCE_IMMUNITY ) ) {

                SWFP_HARMFUL = FALSE;
                int nSR = 15 + GetHitDice(OBJECT_SELF);
                eLink1 = EffectForceResistanceIncrease(nSR);
                eLink1 = SetEffectIcon(eLink1, 9);
                eLink2 = EffectVisualEffect(VFX_PRO_RESIST_FORCE);

                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 1.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_IMMUNITY)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_IMMUNITY);
                         int nSR = 15 + GetHitDice(oCharacter);
                         eLink1 = EffectForceResistanceIncrease(nSR);
                         eLink1 = SetEffectIcon(eLink1, 9);
                         eLink2 = EffectVisualEffect(VFX_PRO_RESIST_FORCE);
                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 1.0);
                    }
                }
            }
        }
        break;

        /*
        FORCE PUSH
        */
        case FORCE_POWER_FORCE_PUSH:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_REFLEX;

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, 0, 0, GetHitDice(OBJECT_SELF) );
            //SWFP_DAMAGE = GetHitDice(OBJECT_SELF);
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;

            //eLink1 = EffectForcePushed();
            //eLink2 = EffectStunned();
            //eLink2 = SetEffectIcon(eLink2, 11);
            //eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_IMP_FORCE_PUSH));
            effect eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            // DJS-OEI 10/24/2004
            // Droids can now be pushed back, but not stunned.
            if( GetRacialType(oTarget) == RACIAL_TYPE_DROID ) {
                eLink1 = EffectForcePushed();
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_IMP_FORCE_PUSH));
            }
            else {
                eLink1 = EffectForcePushed();
                eLink2 = EffectStunned();
                eLink2 = SetEffectIcon(eLink2, 11);
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_IMP_FORCE_PUSH));
            }
            int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eDamage);
            if(SP_CheckForcePushViability(oTarget, FALSE))
            {
                if(nResist == FALSE)
                {
                    int nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves == FALSE)
                    {
                        eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                        DelayCommand(0.4, SP_MyApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, 0.1);
                        float fDuration = Sp_CalcDuration( 2.0 );
                        DelayCommand(2.55, SP_MyApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration));
                    }
                    else
                    {
                        int nApply;

                        // DJS-OEI 11/20/2003
                        // If the target has the Evasion feat, the damage on a successful
                        // Reflex save is 0. Otherwise, it's half the original damage.
                        if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                            nApply = 0;
                        }
                        else {
                            nApply = SWFP_DAMAGE/2;
                        }

                        eDamage = EffectDamage(nApply, SWFP_DAMAGE_TYPE);
                        // DJS-OEI 10/26/2004
                        // Asked to remove push effect on successful save.
//                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, 0.1);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
//                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_PUSH), oTarget);

                    }
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                }
            }
        }
        break;

        /*
        FORCE VALOR
        */
        case FORCE_POWER_FORCE_MIND:
        {
            // DJS-OEI 12/10/2003
            // Although the Force Valor series of effects still need to handle
            // stacking like all of the other power trees, it can't be handled
            // in the same fashion since it affects a radius. We can't just call
            // Sp_ApplyEffects() as usual since we would have to change the script
            // to query for better related effects in the tree prior to application.
            // As a result, we are just going to find all of the targets ourselves.
            SWFP_HARMFUL = FALSE;
            eLink1 = EffectSavingThrowIncrease(SAVING_THROW_FORT,2);
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CHARISMA, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_DEXTERITY, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_WISDOM, 2));
            eLink2 = EffectVisualEffect(VFX_IMP_MIND_FORCE);
            eLink1 = SetEffectIcon(eLink1, 10);

            float fDuration = Sp_CalcDuration( 20.0 );

            // Get each creature within 30.0 units.
            object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets party members only.
                if( GetIsObjectValid(oCreature) && IsObjectPartyMember(oCreature) )
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_FORCE_MIND );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_FORCE_MIND ) ) {
                        SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                        Sp_ApplyForcePowerEffects(fDuration, eLink1, oCreature);
                        Sp_ApplyForcePowerEffects(0.0, eLink2, oCreature);
                    }
                }
                oCreature = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        FORCE SHIELD
        */
        case FORCE_POWER_FORCE_SHIELD:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            float fDuration = Sp_CalcDuration( 20.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_SHIELD );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_FORCE_SHIELD ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectACIncrease(4, AC_DODGE_BONUS);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 4));
                eLink1 = SetEffectIcon(eLink1, 12);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_SHIELD);

                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
            }
            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_SHIELD)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_SHIELD);
                         eLink1 = EffectACIncrease(4, AC_DODGE_BONUS);
                         eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 4));
                         eLink1 = SetEffectIcon(eLink1, 12);
                         eLink2 = EffectVisualEffect(VFX_PRO_FORCE_SHIELD);

                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 3.0);

                    }
                }
            }
        }
        break;

        /*
        FORCE STORM
        */
        case FORCE_POWER_FORCE_STORM:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            float fRange = Sp_CalcRange( 12.0 );

            // DJS-OEI 3/25/2004
            int nDice = GetHitDice(OBJECT_SELF);
            // DJS-OEI 10/7/2004
            // Removed cap.
            /*
            if(nDice > 10)
            {
                nDice = 10;
            }
            */
            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDice, 6 );
            //SWFP_DAMAGE = d6(nDamage);
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_ELECTRICAL;
            effect eBeam = EffectBeam(2061, OBJECT_SELF, BODY_NODE_HEAD);
            effect eVis = EffectVisualEffect(VFX_PRO_LIGHTNING_L);
            effect eForce;
            effect eDam;
            //object oUse = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            object oUse = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oUse))
            {
                //Make Immunity Checks
                if(GetIsEnemy(oUse))
                {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // DJS-OEI 3/25/2004
                    // Modified this power to use the sp_ functions so it could
                    // get the benefits of the Form modifiers.
                    int nResist = Sp_BlockingChecks(oUse, eVis, eBeam, eInvalid);
                    int nSaves;
                    if(nResist == 0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oUse);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oUse, fLightningDuration);

                        nSaves = Sp_MySavingThrows(oUse);
                        if(nSaves == 0)
                        {
                            eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                            eForce = EffectDamageForcePoints(SWFP_DAMAGE);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eForce, oUse);
                        }
                        else
                        {
                            eDam = EffectDamage(SWFP_DAMAGE/2, SWFP_DAMAGE_TYPE);
                            eForce = EffectDamageForcePoints(SWFP_DAMAGE/2);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eForce, oUse);
                        }
                    }
                    else {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                    }

                    /*
                    if(!ResistForce(OBJECT_SELF, oUse))
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oUse);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oUse, fLightningDuration);

                        // DJS-OEI 3/16/2004
                        // The Total Defense Stance gives Jedis a +4 to their
                        // saving throws versus force powers. We just decrease
                        // the DC by that amount.
                        int nMod = Sp_GetJediDCSave();
                        if( IsInTotalDefense( oTarget ) && Sp_IsJedi( oTarget ) ) {
                            if( nMod > 4 ) {
                                nMod -= 4;
                            }
                            else {
                                nMod = 0;
                            }
                        }

                        if(!WillSave(oUse, nMod))
                        {
                            eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                            eForce = EffectDamageForcePoints(SWFP_DAMAGE);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eForce, oUse);
                        }
                        else
                        {
                            eDam = EffectDamage(SWFP_DAMAGE/2, SWFP_DAMAGE_TYPE);
                            eForce = EffectDamageForcePoints(SWFP_DAMAGE/2);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eForce, oUse);
                        }
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                    }
                    */
                }
                //oUse = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oUse = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        FORCE WAVE
        */
        case FORCE_POWER_FORCE_WAVE:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_REFLEX;

            float fRange = Sp_CalcRange( 15.0 );

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, 0, 0, GetHitDice(OBJECT_SELF) + GetHitDice(OBJECT_SELF)/2 );
            //SWFP_DAMAGE = GetHitDice(OBJECT_SELF) + GetHitDice(OBJECT_SELF)/2;
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;
            effect eVis = EffectVisualEffect(VFX_IMP_FORCE_PUSH);
            eLink1 = EffectForcePushed();
            eLink2 = EffectStunned();
            eLink2 = SetEffectIcon(eLink2, 13);
            effect eDam;
            effect eForce;
            //object oUse = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            object oUse = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FORCE_WAVE), GetLocation(OBJECT_SELF));
            while(GetIsObjectValid(oUse))
            {
                //Make Immunity Checks
                if(GetIsEnemy(oUse))
                {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // DJS-OEI 3/25/2004
                    // Modified this power to use the sp_ functions so it could
                    // get the benefits of the Form modifiers.
                    int nResist = Sp_BlockingChecks(oUse, eVis, eInvalid, eInvalid);
                    int nSaves;
                    if(nResist == 0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oUse);

                        nSaves = Sp_MySavingThrows(oUse);
                        if(nSaves == 0)
                        {
                            eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                            DelayCommand(0.4, SP_MyApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse));

                            if(SP_CheckForcePushViability(oUse, FALSE))
                            {
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oUse, 0.2);
                            }
                            DelayCommand(2.55, SP_MyApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oUse, 6.0));
                        }
                        else
                        {
                            // DJS-OEI 10/26/2004
                            // Asked to remove Push if save succeeded.
//                            if(SP_CheckForcePushViability(oUse, FALSE))
//                            {
//                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oUse, 0.2);
//                            }

                            int nApply;
                            // DJS-OEI 11/20/2003
                            // If the target has the Evasion feat, the damage on a successful
                            // Reflex save is 0. Otherwise, it's half the original damage.
                            if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                                nApply = 0;
                            }
                            else {
                                nApply = SWFP_DAMAGE/2;
                            }

                            eDam = EffectDamage(nApply, SWFP_DAMAGE_TYPE);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
                        }
                    }

                    /*
                    if(!ResistForce(OBJECT_SELF, oUse))
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oUse);

                        // DJS-OEI 3/16/2004
                        // The Total Defense Stance gives Jedis a +4 to their
                        // saving throws versus force powers. We just decrease
                        // the DC by that amount.
                        int nMod = Sp_GetJediDCSave();
                        if( IsInTotalDefense( oTarget ) && Sp_IsJedi( oTarget ) ) {
                            if( nMod > 4 ) {
                                nMod -= 4;
                            }
                            else {
                                nMod = 0;
                            }
                        }

                        if(!ReflexSave(oUse, nMod))
                        {
                            eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                            DelayCommand(0.4, SP_MyApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse));

                            if(SP_CheckForcePushViability(oUse, FALSE))
                            {
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oUse, 0.2);
                            }
                            DelayCommand(2.55, SP_MyApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oUse, 6.0));
                        }
                        else
                        {
                            if(SP_CheckForcePushViability(oUse, FALSE))
                            {
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oUse, 0.2);
                            }

                            int nApply;
                            // DJS-OEI 11/20/2003
                            // If the target has the Evasion feat, the damage on a successful
                            // Reflex save is 0. Otherwise, it's half the original damage.
                            if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                                nApply = 0;
                            }
                            else {
                                nApply = SWFP_DAMAGE/2;
                            }

                            eDam = EffectDamage(nApply, SWFP_DAMAGE_TYPE);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
                        }
                    }
                    */
                }
                //oUse = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oUse = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        FORCE WHIRLWIND
        */
        case FORCE_POWER_FORCE_WHIRLWIND:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_REFLEX;

            float fRange = Sp_CalcRange( 5.0 );

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, 0, 0, GetHitDice(OBJECT_SELF)/3 );
            //SWFP_DAMAGE = GetHitDice(OBJECT_SELF)/3;
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;
            effect eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);

            //SP_MyPostString(IntToString(SP_CheckAppearanceGeoDroidShields(oTarget)),5,5,3.0);

            if(SP_CheckForcePushViability(oTarget, TRUE))
            {
                eLink1 = EffectWhirlWind();
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_IMP_FORCE_WHIRLWIND));
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_FORCE_WHIRLWIND));
                eLink1 = SetEffectIcon(eLink1, 14);

                int nResist = Sp_BlockingChecks(oTarget, eLink1, eDamage, eInvalid);
                int nSaves;
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                if(nResist == 0)
                {
                    nSaves =Sp_MySavingThrows(oTarget);
                    if(nSaves == 0)
                    {
                        //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, 9.0);
                        //RWT-OEI 09/27/04 - QA says they fall too soon. Upping this to 12 to
                        //see if that fixes it. FMP#6266
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, 12.0);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDamage, oTarget);
                        int nIdx = 1;
                        float fDelay;
                        SP_InterativeDamage(eDamage, 13, oTarget);
                    }
                }
                if(nResist > 0 || nSaves > 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                }
            }
            //Force Push all enemies away from the target is they meet the conditions.
            SP_MyPrintString("");
            eLink2 = EffectForcePushTargeted(GetLocation(oTarget));
            object oSecond = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget));
            while(GetIsObjectValid(oSecond))
            {
                if(SP_CheckForcePushViability(oSecond, FALSE) == TRUE && GetIsEnemy(oSecond, OBJECT_SELF) && oSecond != oTarget)
                {
                    //P.W. (June 8) - Put this check in so Calo Nord does not move during the fight on Taris
                    if(GetTag(oTarget) != "Calo082")
                    {
                        SignalEvent(oSecond, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                        int nResist2 = Sp_BlockingChecks(oSecond, eLink2,eInvalid,eInvalid);
                        if(nResist2 == 0)
                        {
                            int nSaves2 = Sp_MySavingThrows(oSecond);
                            if(nSaves2 == 0)
                            {
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oSecond, 0.2);
                            }
                        }
                    }
                }
                oSecond = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget));
                SP_MyPrintString("");
            }
        }
        break;

        /*
        IMPROVED HEAL
        */
        //MODIFIED by Preston Watamaniuk March 28
        //Cut the heal in half
        case FORCE_POWER_HEAL:
        {
            SWFP_HARMFUL = FALSE;

            // DJS-OEI 3/29/2004
            // The Regeneration Consular Forms increase the relevance of
            // the Wisdom and Charisma modifiers.
            int nMultiplier = 1;
            // DJS-OEI 7/20/2004
            // Form/Stance re-design.
            /*
            if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_I ) ) {
                nMultiplier = 2;
            }
            else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_II ) ||
                     IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_III ) ) {
                nMultiplier = 3;
            }
            */

            // DJS-OEI 10/20/2004
            // Balance change
            //int nHeal = ( ( GetAbilityModifier(ABILITY_WISDOM) + GetAbilityModifier(ABILITY_CHARISMA) ) * nMultiplier ) + 10 + GetHitDice(OBJECT_SELF);
            int nHeal = ( ( GetAbilityModifier(ABILITY_WISDOM) + GetAbilityModifier(ABILITY_CHARISMA) ) * nMultiplier ) + 15 + GetHitDice(OBJECT_SELF);

            effect eVis =  EffectVisualEffect(VFX_IMP_HEAL);
            int nCnt = 0;

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                oParty = OBJECT_SELF;
            }

            while(nCnt < 3)
            {
                if(GetIsObjectValid(oParty) &&
                   GetRacialType(oParty) != RACIAL_TYPE_DROID &&
                   GetDistanceBetween(OBJECT_SELF, oParty) < 15.0)
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                    Sp_RemoveSpecificEffect(EFFECT_TYPE_POISON, oParty);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oParty);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oParty);
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt, CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN);
                }
            }
        }
        break;

        /*
        MASTER HEAL
        */
        // Same as Improved Heal with addition 5 VP and Stun removal.
        case FORCE_POWER_MASTER_HEAL:
        {
            SWFP_HARMFUL = FALSE;

            // DJS-OEI 3/29/2004
            // The Regeneration Consular Forms increase the relevance of
            // the Wisdom and Charisma modifiers.
            int nMultiplier = 1;
            // DJS-OEI 7/20/2004
            // Form/Stance re-design.
            /*
            if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_I ) ) {
                nMultiplier = 2;
            }
            else if( IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_II ) ||
                     IsFormActive( OBJECT_SELF, FORM_CONSULAR_REGENERATION_III ) ) {
                nMultiplier = 3;
            }
            */

            // Balance Change
            //int nHeal = ( ( GetAbilityModifier(ABILITY_WISDOM) + GetAbilityModifier(ABILITY_CHARISMA) ) * nMultiplier ) + 15 + GetHitDice(OBJECT_SELF);
            int nHeal = ( ( GetAbilityModifier(ABILITY_WISDOM) + GetAbilityModifier(ABILITY_CHARISMA) ) * nMultiplier ) + 15 + 2*GetHitDice(OBJECT_SELF);

            effect eVis =  EffectVisualEffect(VFX_IMP_HEAL);
            int nCnt = 0;

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                oParty = OBJECT_SELF;
            }

            while(nCnt < 3)
            {
                if(GetIsObjectValid(oParty) &&
                   GetRacialType(oParty) != RACIAL_TYPE_DROID &&
                   GetDistanceBetween(OBJECT_SELF, oParty) < 15.0)
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                    Sp_RemoveSpecificEffect(EFFECT_TYPE_STUNNED, oParty);
                    Sp_RemoveSpecificEffect(EFFECT_TYPE_POISON, oParty);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oParty);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oParty);
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt, CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN);
                }
            }
        }
        break;

        /*
        HORROR
        */
        case FORCE_POWER_HORROR:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_FEAR;

            float fRange = Sp_CalcRange( 5.0 );

            eLink1 = EffectHorrified();
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(1042));
            eLink1 = SetEffectIcon(eLink1, 16);

            float fDuration = Sp_CalcDuration( 12.0 );
            Sp_ApplyEffects(TRUE, oTarget, fRange, 1000, eLink1, fDuration, eInvalid, 0.0, RACIAL_TYPE_HUMAN);
        }
        break;

        /*
        INSANITY
        */
        case FORCE_POWER_INSANITY:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_FEAR;

            float fRange = Sp_CalcRange( 10.0 );

            eLink1 = EffectHorrified();
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(1043));
            eLink1 = SetEffectIcon(eLink1, 17);

            // DJS-OEI 10/7/2004
            // Changed to base of 18 seconds.
            //float fDuration = Sp_CalcDuration( 12.0 );
            float fDuration = Sp_CalcDuration( 18.0 );
            Sp_ApplyEffects(TRUE, oTarget, fRange, 1000, eLink1, fDuration, eInvalid, 0.0, RACIAL_TYPE_HUMAN);

            //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(1043), oTarget);

        }
        break;

        /*
        KILL
        */
        case FORCE_POWER_KILL:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;
            effect eDeath = EffectDeath();
            effect eDamage;
            effect eChoke = EffectChoke();
            eChoke = SetEffectIcon(eChoke, 18);
            effect eVFX = EffectVisualEffect(VFX_IMP_CHOKE);

            int nResist = Sp_BlockingChecks(oTarget, eDeath, eDamage, eChoke);
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if(nResist == 0)
            {
                int nSaves = Sp_MySavingThrows(oTarget);

                // DJS-OEI 3/25/2004
                int nDamage = Sp_CalcDamage( oTarget, 0, 0, GetHitDice(OBJECT_SELF) );
                //int nDamage = GetHitDice(OBJECT_SELF);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget);
                eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
                if(nSaves == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eChoke, oTarget, 6.0);
                    nDamage = (GetMaxHitPoints(oTarget))/2;
                    nDamage = nDamage/3;

                    // DJS-OEI 3/25/2004
                    nDamage = Sp_CalcDamage( oTarget, 0, 0, nDamage );

                    //This will do damage over time to make the effect look more dramatic
                    eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
                    SP_InterativeDamage(eDamage, 7, oTarget);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                }

            }
            else
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }
        }
        break;

        /*
        KNIGHT VALOR
        */
        case FORCE_POWER_KNIGHT_MIND:
        {
            // DJS-OEI 12/10/2003
            // Although the Force Valor series of effects still need to handle
            // stacking like all of the other power trees, it can't be handled
            // in the same fashion since it affects a radius. We can't just call
            // Sp_ApplyEffects() as usual since we would have to change the script
            // to query for better related effects in the tree prior to application.
            // As a result, we are just going to find all of the targets ourselves.
            SWFP_HARMFUL = FALSE;
            eLink1 = EffectSavingThrowIncrease(SAVING_THROW_ALL,3);
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CHARISMA, 3));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 3));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_DEXTERITY, 3));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 3));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 3));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_WISDOM, 3));
            eLink1 = EffectLinkEffects(eLink1, EffectImmunity(IMMUNITY_TYPE_POISON));
            eLink1 = SetEffectIcon(eLink1, 19);
            eLink2 = EffectVisualEffect(1033);

            float fDuration = Sp_CalcDuration( 20.0 );

            // Get each creature within 30.0 units.
            object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets party members only.
                if( GetIsObjectValid(oCreature) && IsObjectPartyMember(oCreature) )
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_KNIGHT_MIND );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_KNIGHT_MIND ) ) {
                        SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                        Sp_ApplyForcePowerEffects(fDuration, eLink1, oCreature);
                        Sp_ApplyForcePowerEffects(0.0, eLink2, oCreature);
                    }
                }
                oCreature = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        KNIGHT SPEED
        */
        case FORCE_POWER_KNIGHT_SPEED:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            float fDuration = Sp_CalcDuration( 36.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_KNIGHT_SPEED );
            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_KNIGHT_SPEED ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectMovementSpeedIncrease(99);
                eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(4));
                eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks(1));
                eLink1 = SetEffectIcon(eLink1, 20);

                if(OBJECT_SELF == GetPartyMemberByIndex(0))
                {
                    eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_SPEED));
                    //eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_IMP_SPEED_KNIGHT));
                }
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_KNIGHT_SPEED)) {
                            Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_KNIGHT_SPEED );
                            eLink2 = EffectMovementSpeedIncrease(99);
                            eLink2 = EffectLinkEffects(eLink2, EffectACIncrease(4));
                            eLink2 = EffectLinkEffects(eLink2, EffectModifyAttacks(1));
                            eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_DUR_SPEED));
                            eLink2 = SetEffectIcon(eLink2, 20);
                            Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink2, fDuration, eInvalid, 0.0);
                    }
                }
            }
        }
        break;

        /*
        LIGHTSABER THROW
        */
        case FORCE_POWER_LIGHT_SABER_THROW:
        {
            SWFP_HARMFUL = TRUE;

            eLink1 = EffectLightsaberThrow(oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, OBJECT_SELF, 3.0);
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
        }
        break;
        /*
        ADVANCED LIGHTSABER THROW
        */
        case FORCE_POWER_LIGHT_SABER_THROW_ADVANCED:
        {
            SWFP_HARMFUL = TRUE;
            object oTarget2, oTarget3;
            oTarget2 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oTarget, 1);
            if(GetIsObjectValid(oTarget2) && GetDistanceBetween(oTarget, oTarget2) <= 5.0)
            {
                oTarget3 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, oTarget, 2);
                if(GetIsObjectValid(oTarget3) && GetDistanceBetween(oTarget, oTarget3) <= 5.0)
                {
                    SP_MyPrintString("Target 1 = " + ObjectToString(oTarget) +
                                " Target 2 = " + ObjectToString(oTarget2) +
                                " Target 3 = " + ObjectToString(oTarget3));
                    eLink1 = EffectLightsaberThrow(oTarget, oTarget2, oTarget3);
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                    SignalEvent(oTarget2, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                    SignalEvent(oTarget3, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                }
                else
                {
                    SP_MyPrintString("Target 1 = " + ObjectToString(oTarget) +
                                " Target 2 = " + ObjectToString(oTarget2));
                    eLink1 = EffectLightsaberThrow(oTarget, oTarget2);
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                    SignalEvent(oTarget2, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                }
            }
            else
            {
                SP_MyPrintString("Target 1 = " + ObjectToString(oTarget));
                eLink1 = EffectLightsaberThrow(oTarget);
                oTarget2 = OBJECT_INVALID;
            }
            SP_MyPrintString("Apply Throwsaber Effect");
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, OBJECT_SELF, 3.0);
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
        }
        break;

        /*
        LIGHTNING
        */
        case FORCE_POWER_LIGHTNING:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_ELECTRICAL;
            int nDice = GetHitDice(OBJECT_SELF);
            // DJS-OEI 10/7/2004
            // Removed cap.
            /*
            if(nDice > 10)
            {
                nDice = 10;
            }
            */

            float fRange = Sp_CalcRange( 17.0 );

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDice, 6 );
            //SWFP_DAMAGE = d6(nDamage);
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_ELECTRICAL;
            SWFP_DAMAGE_VFX = VFX_PRO_LIGHTNING_L; //1036 - With sound
            SWFP_SHAPE = SHAPE_SPELLCYLINDER;

            effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING_DARK_L, OBJECT_SELF, BODY_NODE_HAND);

            effect eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
            //object oUse = GetFirstObjectInShape(SWFP_SHAPE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            object oUse = GetFirstObjectInShape(SWFP_SHAPE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE );
            effect eBump = EffectVisualEffect(SWFP_DAMAGE_VFX);
            int nCnt = 1;
            // This will need to be changed to a double while get nearest in shape script.
            //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(1036), OBJECT_SELF);
            while(GetIsObjectValid(oUse))
            {
                if(GetIsEnemy(oUse))
                {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // DJS-OEI 3/25/2004
                    // Modified this power to use the sp_ functions so it could
                    // get the benefits of the Form modifiers.
                    int nResist = Sp_BlockingChecks(oUse, eBump, eInvalid, eInvalid);
                    int nSaves;
                    if(nResist == 0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eBump, oUse);

                        nSaves = Sp_MySavingThrows(oUse);
                        if(nSaves == 0)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            //ApplyEffectToObject(DURATION_TYPE_INSTANT, eForce, oUse);
                        }
                        else
                        {
                            SWFP_DAMAGE /= 2;
                            eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                        }
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oUse, fLightningDuration);
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
                    }

                    /*
                    //Make Immunity Checks
                    if(!ResistForce(OBJECT_SELF, oUse))
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eBump, oUse);

                        // DJS-OEI 3/16/2004
                        // The Total Defense Stance gives Jedis a +4 to their
                        // saving throws versus force powers. We just decrease
                        // the DC by that amount.
                        int nMod = Sp_GetJediDCSave();
                        if( IsInTotalDefense( oTarget ) && Sp_IsJedi( oTarget ) ) {
                            if( nMod > 4 ) {
                                nMod -= 4;
                            }
                            else {
                                nMod = 0;
                            }
                        }

                        if(!WillSave(oUse, nMod, SWFP_PRIVATE_SAVE_VERSUS_TYPE))
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);
                            //ApplyEffectToObject(DURATION_TYPE_INSTANT, eForce, oUse);
                        }
                        else
                        {
                            SWFP_DAMAGE /= 2;
                            eDam = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oUse);

                        }
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oUse, fLightningDuration);
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
                    }
                    */
                }
                nCnt++;
                //oUse = GetNextObjectInShape(SWFP_SHAPE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oUse = GetNextObjectInShape(SWFP_SHAPE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        MASTER VALOR
        */
        case FORCE_POWER_MIND_MASTERY:
        {
            // DJS-OEI 12/10/2003
            // Although the Force Valor series of effects still need to handle
            // stacking like all of the other power trees, it can't be handled
            // in the same fashion since it affects a radius. We can't just call
            // Sp_ApplyEffects() as usual since we would have to change the script
            // to query for better related effects in the tree prior to application.
            // As a result, we are just going to find all of the targets ourselves.
            SWFP_HARMFUL = FALSE;
            eLink1 = EffectSavingThrowIncrease(SAVING_THROW_ALL,5);
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CHARISMA, 5));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 5));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_DEXTERITY, 5));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 5));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 5));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_WISDOM, 5));
            eLink1 = EffectLinkEffects(eLink1, EffectImmunity(IMMUNITY_TYPE_POISON));
            eLink1 = SetEffectIcon(eLink1, 21);
            eLink2 = EffectVisualEffect(VFX_IMP_MIND_MASTERY);

            float fDuration = Sp_CalcDuration( 20.0 );

            // Get each creature within 30.0 units.
            object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets party members only.
                if( GetIsObjectValid(oCreature) && IsObjectPartyMember(oCreature) )
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_MIND_MASTERY );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_MIND_MASTERY ) ) {
                        SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                        Sp_ApplyForcePowerEffects(fDuration, eLink1, oCreature);
                        Sp_ApplyForcePowerEffects(0.0, eLink2, oCreature);
                    }
                }
                oCreature = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        PLAGUE
        */
        case FORCE_POWER_PLAGUE:
        {
            // If the target is already poisoned in any way, don't
            // apply this effect.
            if(!GetIsPoisoned(oTarget))
            {
                // DJS-OEI 12/9/2003
                // For KotOR2, we have decided to modify the application behavior
                // of Force Power trees. Lower level versions of Force Powers will
                // no longer overwrite higher level versions, although this means
                // the caster still loses their Force Points to no effect. Also,
                // casting a Force Power will remove any Force Powers of equal or
                // lesser level prior to applying themselves.

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( oTarget, FORCE_POWER_PLAGUE );

                // Do not apply the effects of this power if a more powerful
                // version is already attached to the target.
                if( !Sp_BetterRelatedPowerExists( oTarget, FORCE_POWER_PLAGUE ) ) {

                    SWFP_HARMFUL = TRUE;

                    eLink1 = EffectPoison(POISON_ABILITY_SCORE_VIRULENT);
                    eLink1 = EffectLinkEffects(eLink1, EffectMovementSpeedDecrease(50));
                    eLink1 = SetEffectIcon(eLink1, 23);
                    if(!GetIsPoisoned(oTarget))
                    {
                        //Sp_ApplyEffects(FALSE, oTarget, 0.0, 1, eLink1, 1000.0, eInvalid, 0.0);
                        //RWT-OEI 09/27/04 - This is apparently supposed to be 12 seconds instead
                        //of permanent.
                        Sp_ApplyEffects(FALSE, oTarget, 0.0, 1, eLink1, 12.0, eInvalid, 0.0);
                    }
                }
            }
            // DJS-OEI 10/22/2004
            else {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceResisted(OBJECT_SELF), oTarget);
            }
        }
        break;

        /*
        IMPROVED ENERGY RESISTANCE
        */
        case FORCE_POWER_RESIST_COLD_HEAT_ENERGY:
        {
            // DJS-OEI 12/10/2003
            // Although the Energy Resistance series of effects still need to handle
            // stacking like all of the other power trees, it can't be handled
            // in the same fashion since it affects multiple targets in the party. We can't just call
            // Sp_ApplyEffects() as usual since we would have to change the script
            // to query for better related effects in the tree prior to application.
            // As a result, we are just going to find all of the targets ourselves.
            SWFP_HARMFUL = FALSE;
            eLink1 = EffectDamageResistance(DAMAGE_TYPE_COLD, 12);
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_FIRE, 12));
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SONIC, 12));
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_BLASTER, 12));
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 12));
            eLink1 = SetEffectIcon(eLink1, 24);
            eLink2 = EffectVisualEffect(VFX_PRO_RESIST_ELEMENTS);

            // Keep in mind that enemies can also cast this, although
            // only the caster will receive benfit. If a PC casts it,
            // the entire party is affected regardless of distance.
            if(!IsObjectPartyMember(OBJECT_SELF))
            {
                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_RESIST_COLD_HEAT_ENERGY );

                // Do not apply the effects of this power if a more powerful
                // version is already attached to the target.
                if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_RESIST_COLD_HEAT_ENERGY ) ) {
                    float fDuration = Sp_CalcDuration( 120.0 );
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, OBJECT_SELF, fDuration);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, OBJECT_SELF, 1.0);
                }
            }
            else if(IsObjectPartyMember(OBJECT_SELF))
            {
                int nCnt = 0;
                object oParty;
                for(nCnt; nCnt < 3; nCnt++)
                {
                    oParty = GetPartyMemberByIndex(nCnt);
                    if(GetIsObjectValid(oParty))
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oParty, FORCE_POWER_RESIST_COLD_HEAT_ENERGY );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_RESIST_COLD_HEAT_ENERGY ) ) {

                            // Make sure to send the event signal to anyone other
                            // than the caster that gets the benefit of this power.
                            if( oParty != OBJECT_SELF ) {
                                SignalEvent(oParty, EventSpellCastAt(oParty, GetSpellId(), SWFP_HARMFUL));
                            }
                            float fDuration = Sp_CalcDuration( 120.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oParty, 1.0);
                        }
                    }
                }
            }
        }
        break;

        // DJS-OEI 12/9/2003
        /*
        MASTER ENERGY RESISTANCE
        */
        case FORCE_POWER_MASTER_ENERGY_RESISTANCE:
        {
            // DJS-OEI 12/10/2003
            // Although the Energy Resistance series of effects still need to handle
            // stacking like all of the other power trees, it can't be handled
            // in the same fashion since it affects multiple targets in the party. We can't just call
            // Sp_ApplyEffects() as usual since we would have to change the script
            // to query for better related effects in the tree prior to application.
            // As a result, we are just going to find all of the targets ourselves.
            SWFP_HARMFUL = FALSE;
            eLink1 = EffectDamageResistance(DAMAGE_TYPE_COLD, 20);
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_FIRE, 20));
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SONIC, 20));
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_BLASTER, 20));
            eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 20));
            eLink1 = SetEffectIcon(eLink1, 104);
            eLink2 = EffectVisualEffect(VFX_PRO_RESIST_ELEMENTS);

            // Keep in mind that enemies can also cast this, although
            // only the caster will receive benfit. If a PC casts it,
            // the entire party is affected regardless of distance.
            if(!IsObjectPartyMember(OBJECT_SELF))
            {
                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_MASTER_ENERGY_RESISTANCE );

                // Do not apply the effects of this power if a more powerful
                // version is already attached to the target.
                if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_MASTER_ENERGY_RESISTANCE ) ) {
                    float fDuration = Sp_CalcDuration( 120.0 );
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, OBJECT_SELF, fDuration);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, OBJECT_SELF, 1.0);
                }
            }
            else if(IsObjectPartyMember(OBJECT_SELF))
            {
                int nCnt = 0;
                object oParty;
                for(nCnt; nCnt < 3; nCnt++)
                {
                    oParty = GetPartyMemberByIndex(nCnt);
                    if(GetIsObjectValid(oParty))
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oParty, FORCE_POWER_MASTER_ENERGY_RESISTANCE );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_MASTER_ENERGY_RESISTANCE ) ) {

                            // Make sure to send the event signal to anyone other
                            // than the caster that gets the benefit of this power.
                            if( oParty != OBJECT_SELF ) {
                                SignalEvent(oParty, EventSpellCastAt(oParty, GetSpellId(), SWFP_HARMFUL));
                            }
                            float fDuration = Sp_CalcDuration( 120.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oParty, 1.0);
                        }
                    }
                }
            }
        }
        break;
        /*
        RESIST FORCE 1
        */
        case FORCE_POWER_RESIST_FORCE:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_RESIST_FORCE );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_RESIST_FORCE ) ) {

                SWFP_HARMFUL = FALSE;
                int nSR = 10 + GetHitDice(OBJECT_SELF);
                eLink1 = EffectForceResistanceIncrease(nSR);
                eLink1 = SetEffectIcon(eLink1, 25);
                eLink2 = EffectVisualEffect(VFX_PRO_RESIST_FORCE);

                float fDuration = Sp_CalcDuration( 60.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 1.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_RESIST_FORCE)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_RESIST_FORCE );
                         int nSR = 10 + GetHitDice(oCharacter);
                         eLink1 = EffectForceResistanceIncrease(nSR);
                         eLink1 = SetEffectIcon(eLink1, 25);
                         eLink2 = EffectVisualEffect(VFX_PRO_RESIST_FORCE);
                         float fDuration = Sp_CalcDuration( 60.0 );
                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 1.0);
                    }
                }
            }
        }
        break;

        /*
        RESIST ENERGY
        */

        case FORCE_POWER_RESIST_POISON_DISEASE_SONIC:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_RESIST_POISON_DISEASE_SONIC );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_RESIST_POISON_DISEASE_SONIC ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectDamageResistance(DAMAGE_TYPE_COLD, 6);
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_FIRE, 6));
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SONIC, 6));
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 6));
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_BLASTER, 6));
                eLink1 = SetEffectIcon(eLink1, 26);
                eLink2 = EffectVisualEffect(VFX_PRO_RESIST_ELEMENTS);
                float fDuration = Sp_CalcDuration( 120.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 1.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_RESIST_POISON_DISEASE_SONIC)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_RESIST_POISON_DISEASE_SONIC );
                         eLink1 = EffectDamageResistance(DAMAGE_TYPE_COLD, 6);
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_FIRE, 6));
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SONIC, 6));
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 6));
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_BLASTER, 6));
                         eLink1 = SetEffectIcon(eLink1, 26);
                         eLink2 = EffectVisualEffect( VFX_PRO_RESIST_ELEMENTS);
                         float fDuration = Sp_CalcDuration( 120.0 );
                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 1.0);
                    }
                }
            }
        }
        break;

        /*
        SHOCK
        */
        case FORCE_POWER_SHOCK:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_ELECTRICAL;
            int nDice = GetHitDice(OBJECT_SELF);
            // DJS-OEI 10/7/2004
            // Removed cap.
            /*
            if(nDice > 10)
            {
                nDice = 10;
            }
            */

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDice, 6 );
            //SWFP_DAMAGE = d6(nDamage);
            SP_MyPostString(IntToString(SWFP_DAMAGE),5,5,4.0);
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_ELECTRICAL;
            SWFP_DAMAGE_VFX = VFX_PRO_LIGHTNING_S;
            effect eDamage = EffectDamage(SWFP_DAMAGE, DAMAGE_TYPE_ELECTRICAL);
            effect eDamage2 = EffectDamage(SWFP_DAMAGE/2, DAMAGE_TYPE_ELECTRICAL);

            int nSaves = Sp_MySavingThrows(oTarget);
            int nResist = Sp_BlockingChecks(oTarget, eDamage, eInvalid, eInvalid);
            eLink1 = EffectBeam(2066, OBJECT_SELF, BODY_NODE_HAND); //P.W.(May 19, 2003) Changed to Shock beam effect.

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if(nResist == 0)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fLightningDuration);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_PRO_LIGHTNING_S), oTarget);
                if(nSaves == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage2, oTarget);
                }
            }
            //Sp_ApplyEffects(FALSE, oTarget, 0.0, 1, eLink1, fLightningDuration, eInvalid, 0.0);
        }
        break;

        /*
        STASIS
        */
        case FORCE_POWER_HOLD:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;
            eLink1 = EffectParalyze();
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_HOLD));
            eLink1 = SetEffectIcon(eLink1, 15);

            eLink2 = EffectMovementSpeedDecrease(50);
            eLink2 = EffectLinkEffects(eLink2, EffectACDecrease(4));
            eLink2 = SetEffectIcon(eLink2, 15);

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            //Make Immunity Checks
            int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
            if(nResist == 0)
            {
                // Remove any lower level or equal versions of this power.
                // DJS-OEI 9/30/2004
                // Since this spell has differing effects based on whether the
                // saving throw succeeds or fails, we can't remove the related
                // powers or a failed save on the second cast will override a
                // succeeded save on the first cast.
                //Sp_RemoveRelatedPowers( oTarget, FORCE_POWER_HOLD );

                // Do not apply the effects of this power if a more powerful
                // version is already attached to the target.
                if( !Sp_BetterRelatedPowerExists( oTarget, FORCE_POWER_HOLD ) ) {
                    float fDuration = Sp_CalcDuration( 12.0 );
                    int nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves == 0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget,fDuration);
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                    }
                }
            }
            else
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }
        }
        break;

        /*
        STASIS FIELD
        */
        case FORCE_POWER_SLEEP:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;

            float fRange = Sp_CalcRange( 10.0 );

            eLink1 = EffectParalyze();
            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_HOLD));
            eLink1 = SetEffectIcon(eLink1, 27);

            eLink2 = EffectMovementSpeedDecrease(50);
            eLink2 = EffectLinkEffects(eLink2, EffectACDecrease(4));
            eLink2 = SetEffectIcon(eLink2, 27);

            //oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oTarget))
            {
                if(GetIsEnemy(oTarget) && GetRacialType(oTarget) != RACIAL_TYPE_DROID)
                {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                    //Make Immunity Checks
                    int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
                    if(nResist == 0)
                    {
                        // Remove any lower level or equal versions of this power.
                        // DJS-OEI 9/30/2004
                        // Since this spell has differing effects based on whether the
                        // saving throw succeeds or fails, we can't remove the related
                        // powers or a failed save on the second cast will override a
                        // succeeded save on the first cast.
                        //Sp_RemoveRelatedPowers( oTarget, FORCE_POWER_SLEEP );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oTarget, FORCE_POWER_SLEEP ) ) {

                            float fDuration = Sp_CalcDuration( 12.0 );
                            int nSaves = Sp_MySavingThrows(oTarget);
                            if(nSaves == 0)
                            {
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                            }
                            else
                            {
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                            }
                        }
                    }
                }
                //oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, fRange, GetLocation(oTarget), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        /*
        SLOW
        */
        case FORCE_POWER_SLOW:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            eLink1 = EffectMovementSpeedDecrease(50);
            eLink1 = EffectLinkEffects(eLink1, EffectACDecrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectAttackDecrease(2));
            //eLink1 = EffectLinkEffects(eLink1, EffectDamageDecrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowDecrease(SAVING_THROW_REFLEX,2));
            eLink2 = EffectVisualEffect(VFX_PRO_AFFLICT);
            eLink1 = SetEffectIcon(eLink1, 28);

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            //Make Immunity Checks
            int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
            if(nResist == 0)
            {
                int nSaves = Sp_MySavingThrows(oTarget);
                if(nSaves == 0)
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oTarget, FORCE_POWER_SLOW );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oTarget, FORCE_POWER_SLOW ) ) {
                        float fDuration = Sp_CalcDuration( 30.0 );
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, 1.0);
                    }
                }
            }
        }
        break;
        /*
        BURST OF SPEED
        */
        case FORCE_POWER_SPEED_BURST:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            float fDuration = Sp_CalcDuration( 36.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_SPEED_BURST );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_SPEED_BURST ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectMovementSpeedIncrease(99);
                eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(2));
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_KNIGHTS_SPEED));
                eLink1 = SetEffectIcon(eLink1, 2);
                if(OBJECT_SELF == GetPartyMemberByIndex(0))
                {
                    eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_SPEED));
                }
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_SPEED_BURST)) {
                            Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_SPEED_BURST );
                            eLink2 = EffectMovementSpeedIncrease(99);
                            eLink2 = EffectLinkEffects(eLink2, EffectACIncrease(2));
                            eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_DUR_SPEED));
                            eLink2 = SetEffectIcon(eLink2, 2);
                            Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink2, fDuration, eInvalid, 0.0);
                    }
                }
            }
        }
        break;

        /*
        MASTER SPEED
        */
        case FORCE_POWER_SPEED_MASTERY:
        {
            // DJS-OEI 12/9/2003
            // For KotOR2, we have decided to modify the application behavior
            // of Force Power trees. Lower level versions of Force Powers will
            // no longer overwrite higher level versions, although this means
            // the caster still loses their Force Points to no effect. Also,
            // casting a Force Power will remove any Force Powers of equal or
            // lesser level prior to applying themselves.

            float fDuration = Sp_CalcDuration( 36.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_SPEED_MASTERY );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_SPEED_MASTERY ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectMovementSpeedIncrease(99);
                eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(4));
                eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks(2));
                eLink1 = SetEffectIcon(eLink1, 22);

                if(OBJECT_SELF == GetPartyMemberByIndex(0))
                {
                    eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_SPEED));
                    //eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_IMP_SPEED_MASTERY));
                }
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_SPEED_MASTERY)) {

                            Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_SPEED_MASTERY );
                            eLink2 = EffectMovementSpeedIncrease(99);
                            eLink2 = EffectLinkEffects(eLink2, EffectACIncrease(4));
                            eLink2 = EffectLinkEffects(eLink2, EffectModifyAttacks(2));
                            eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_DUR_SPEED));
                            eLink2 = SetEffectIcon(eLink2, 22);
                            Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink2, fDuration, eInvalid, 0.0);
                    }
                }
            }
        }
        break;

        /*
        STUN
        */
        case FORCE_POWER_STUN:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_MIND_AFFECTING;

            eLink1 = EffectStunned();
            //eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_HOLD));
            eLink1 = SetEffectIcon(eLink1, 29);

            eLink2 = EffectMovementSpeedDecrease(50);
            eLink2 = EffectLinkEffects(eLink2, EffectACDecrease(4));
            eLink1 = SetEffectIcon(eLink1, 29);

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            //Make Immunity Checks
            int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
            int nSaves;
            if(nResist == 0)
            {
                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( oTarget, FORCE_POWER_STUN );

                // Do not apply the effects of this power if a more powerful
                // version is already attached to the target.
                if( !Sp_BetterRelatedPowerExists( oTarget, FORCE_POWER_STUN ) ) {

                    float fDuration = Sp_CalcDuration( 9.0 );
                    nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves == 0)
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                    }
                }
            }
            if(nResist > 0 || nSaves > 0)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }
        }
        break;

        /*
        SUPRESS FORCE
        */
        case FORCE_POWER_SUPRESS_FORCE:
        {
            effect eBuff = GetFirstEffect(oTarget);
            int bValid = FALSE;
            while(GetIsEffectValid(eBuff))
            {
                if(GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_AURA ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_SHIELD ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_MIND ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_KNIGHT_MIND ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_SPEED_BURST ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_KNIGHT_SPEED ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_RESIST_FORCE ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_RESIST_POISON_DISEASE_SONIC ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_FORCE_BARRIER ||
                   GetEffectSpellId(eBuff) == FORCE_POWER_IMPROVED_FORCE_BARRIER )
                 {
                    RemoveEffect(oTarget, eBuff);
                 }
                 eBuff = GetNextEffect(oTarget);
            }
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_BREACH), oTarget);
        }
        break;

        /*
        WOUND
        */
        case FORCE_POWER_WOUND:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;

            // DJS-OEI 3/25/2004
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, 0, 0, (GetHitDice(OBJECT_SELF)*2)/3 );
            //SWFP_DAMAGE = (GetHitDice(OBJECT_SELF)*2)/3;
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;

            effect eChoke = EffectChoke();
            eChoke = SetEffectIcon(eChoke, 31);
            effect eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);

            int nResist = Sp_BlockingChecks(oTarget, eChoke, eDamage, eInvalid);
            int nSaves;
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if(nResist == 0)
            {
                nSaves = Sp_MySavingThrows(oTarget);
                if(nSaves == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_CHOKE), oTarget);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eChoke, oTarget, 6.0);
                    int nIdx = 1;
                    float fDelay;
                    SP_InterativeDamage(eDamage, 7, oTarget);
                }
            }
            if(nResist > 0 || nSaves > 0)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }
        }
        break;

        //
        // Force Sight
        //
        case FORCE_POWER_FORCE_SIGHT:
        {
            float fDuration = Sp_CalcDuration( 20.0 );

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_SIGHT );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_FORCE_SIGHT ) ) {

                SWFP_HARMFUL = FALSE;
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, EffectForceSight(), fDuration, eInvalid, 0.0);
            }
        }
        break;

        case SPECIAL_ABILITY_BODY_FUEL:
        {
            effect eBody = EffectBodyFuel();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBody, OBJECT_SELF, 30.0);
        }
        break;
        case SPECIAL_ABILITY_ENHANCED_SENSES:
        {
            effect eAC = EffectACDecrease(6);
            effect eAware = EffectSkillIncrease(SKILL_AWARENESS, 10);
            effect eSee = EffectTrueSeeing();
            eLink1 = EffectLinkEffects(eAC, eAware);
            eLink1 = EffectLinkEffects(eLink1, eAware);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, OBJECT_SELF, RoundsToSeconds(10));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MIND_FORCE), OBJECT_SELF);
        }
        break;

        case SPECIAL_ABILITY_PSYCHIC_STANCE:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_MIND_AFFECTING;

            eLink1 = EffectPsychicStatic();
            Sp_ApplyEffects(TRUE, oTarget, 10.0, 1000, eLink1, 20.0, eInvalid, 0.0);
        }
        break;

        /*
        Rage
        This ability allows Zaalbar to fly into a rage.
        When Zaalbar flies into a rage he gains +4 to his Strength and Constitution.  He also gains a +2 bonus on
        Fortitude and Will saves.  While raging Zaalbar cannot use any skills.  He also has a -4 penalty to his Defense rating.
        Interface: Mystical.  It takes one round to initiate the rage.
        Prerequisites: Nothing.  This is a unique NPC power.
        */
        case SPECIAL_ABILITY_RAGE:
        {
            SWFP_HARMFUL = FALSE;
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_FORT, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 4));
            eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 4));
            eLink1 = EffectLinkEffects(eLink1, EffectACDecrease(4));

            Sp_ApplyEffects(TRUE, OBJECT_SELF, 0.0, 1, eLink1, 30.0, eInvalid, 0.0);
        }
        break;

        case 83: //Monster Slam Attack
        {
            SP_MyPrintString("I am attempting to use monster slam");

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_REFLEX;
            SWFP_DAMAGE = GetHitDice(OBJECT_SELF);
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_BLUDGEONING;

            eLink1 = EffectForcePushed();
            eLink2 = EffectStunned();
            effect eDamage = EffectDamage(GetHitDice(OBJECT_SELF), SWFP_DAMAGE_TYPE);

            if(!ReflexSave(oTarget, 15))
            {
                eDamage = EffectDamage(GetHitDice(OBJECT_SELF), SWFP_DAMAGE_TYPE);
                DelayCommand(0.5, SP_MyApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, 0.25);
                DelayCommand(2.55, SP_MyApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, 3.0));
            }
            else
            {
                int nApply;
                // DJS-OEI 11/20/2003
                // If the target has the Evasion feat, the damage on a successful
                // Reflex save is 0. Otherwise, it's half the original damage.
                if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                    nApply = 0;
                }
                else {
                    nApply = GetHitDice(OBJECT_SELF)/2;
                }
                eDamage = EffectDamage(nApply, SWFP_DAMAGE_TYPE);
                DelayCommand(0.5, SP_MyApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, 0.25));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_PUSH), oTarget);

            }
        }
        break;

        case 130: //Fire Breath Weapon
        {
            oTarget = GetSpellTargetObject();
            int nDC = 15;
            int nDamage = 40;
            effect eBeam = EffectBeam(2053, OBJECT_SELF, BODY_NODE_HEAD);
            effect eVFX = EffectVisualEffect(1039);
            effect eBump = EffectVisualEffect(2062);
            effect eHorror = EffectHorrified();
            eHorror = SetEffectIcon(eHorror, 57);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.0);
            if(GetHitDice(oTarget) < 7 || FortitudeSave(oTarget, 15) == FALSE)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHorror, oTarget, 3.0);
            }
            DelayCommand(0.33, SP_MyApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBump, oTarget, 1.5));
            if(ReflexSave(oTarget, nDC, SAVING_THROW_TYPE_FIRE))
            {
                // DJS-OEI 11/20/2003
                // If the target has the Evasion feat, the damage on a successful
                // Reflex save is 0. Otherwise, it's half the original damage.
                if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                    nDamage = 0;
                }
                else {
                    nDamage /= 2;
                }
            }
            effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        }
        break;

        case 131:   // Sonic Howl
        {
            // DJS-OEI 9/27/2004
            // This is basically just Master Force Scream.
            /*
            int nVFX = 3002;
            int nDC = 15;
            effect eDex = EffectAbilityDecrease(ABILITY_DEXTERITY, 3);
            eDex = SetEffectIcon(eDex, 106);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVFX), OBJECT_SELF);
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetSpellTargetLocation());
            while(GetIsObjectValid(oTarget))
            {
                if(GetIsEnemy(oTarget))
                {
                    if(!FortitudeSave(oTarget, nDC, SAVING_THROW_TYPE_SONIC))
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDex, oTarget, 30.0);
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, 4.0, GetSpellTargetLocation());
            }
            */
            // Force Scream and Improved Force Scream both affect
            // targets in a cone extending from the caster's location.
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_SONIC;

            // Each version of the spell causes differing amounts of damage.
            int nDamageRolls;
            int nAttributeDamage;
            int nIconID;
            int nShape;
            float fShapeSize;
            int nVFXID;

                nDamageRolls = 7;
                nAttributeDamage = 6;
                nIconID = 113;
                nShape = SHAPE_SPHERE;
                // DJS-OEI 1/14/2004
                // Increase the range slightly. Since the range for this spell
                // is 10m, the pathing system fudging will in some cases not
                // cuase any valid targets to be within 10m to get damaged.
                //fShapeSize = Sp_CalcRange( 10.0 );
                fShapeSize = Sp_CalcRange( 12.0 );
                nVFXID = 9007;

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect( nVFXID ), OBJECT_SELF);

            object oTarget = GetFirstObjectInShape(nShape, fShapeSize, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oTarget))
            {
                int nTotalDamage = Sp_CalcDamage( oTarget, nDamageRolls, 6 );

                // Create the damage effects.
                eLink1 = EffectDamage( nTotalDamage, DAMAGE_TYPE_SONIC );
                eLink2 = EffectAbilityDecrease(ABILITY_STRENGTH, nAttributeDamage);
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_DEXTERITY, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_INTELLIGENCE, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_WISDOM, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_CHARISMA, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_CONSTITUTION, nAttributeDamage));
                eLink2 = SetEffectIcon(eLink2, nIconID);

                // Check resistances.
                int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                if( ( GetRacialType(oTarget) != RACIAL_TYPE_DROID ) &&
                    GetIsEnemy(oTarget) )
                {
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oTarget, 20);
                        if(nSaves <= 0)
                        {
                            // Apply physical damage effect to the target.
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);

                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                                // Apply the attribute damage effect.
                                float fDuration = Sp_CalcDuration( 30.0 );
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                            }
                        }
                        else {
                            int nApply;
                            // DJS-OEI 11/20/2003
                            // If the target has the Evasion feat, the damage on a successful
                            // save is 0. Otherwise, it's half the original damage.
                            if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                                nApply = 0;
                            }
                            else {
                                nApply = nTotalDamage/2;
                            }

                            if( nApply > 0 ) {
                                // The target saved, so the attribute damage is ignored.
                                // Rebuild the damage effect with the new damage.
                                eLink1 = EffectDamage( nApply, DAMAGE_TYPE_SONIC );
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);
                            }
                        }
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                    }
                }
                oTarget = GetNextObjectInShape(nShape, fShapeSize, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        // DJS-OEI 12/11/2003
        case FORCE_POWER_FORCE_BARRIER:
        {
            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_BARRIER );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_FORCE_BARRIER ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING, 4);
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_PIERCING, 4));
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SLASHING, 4));
                eLink1 = SetEffectIcon(eLink1, 64);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                float fDuration = Sp_CalcDuration( 30.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
            }

            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_BARRIER)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_BARRIER );
                         eLink1 = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING, 4);
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_PIERCING, 4));
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SLASHING, 4));
                         eLink1 = SetEffectIcon(eLink1, 64);
                         eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                         eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                         float fDuration = Sp_CalcDuration( 30.0 );
                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                    }
                }
            }
        }
        break;

        // DJS-OEI 12/11/2003
        case FORCE_POWER_IMPROVED_FORCE_BARRIER:
        {
            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_IMPROVED_FORCE_BARRIER );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_IMPROVED_FORCE_BARRIER ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING, 8);
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_PIERCING, 8));
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SLASHING, 8));
                eLink1 = SetEffectIcon(eLink1, 65);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                float fDuration = Sp_CalcDuration( 45.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
            }
            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_IMPROVED_FORCE_BARRIER)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_IMPROVED_FORCE_BARRIER );
                         eLink1 = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING, 8);
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_PIERCING, 8));
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SLASHING, 8));
                         eLink1 = SetEffectIcon(eLink1, 65);
                         eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                         eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                         float fDuration = Sp_CalcDuration( 45.0 );
                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                    }
                }
            }
        }
        break;

        // DJS-OEI 12/11/2003
        case FORCE_POWER_MASTER_FORCE_BARRIER:
        {
            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_MASTER_FORCE_BARRIER );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, FORCE_POWER_MASTER_FORCE_BARRIER ) ) {

                SWFP_HARMFUL = FALSE;
                eLink1 = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING, 15);
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_PIERCING, 15));
                eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SLASHING, 15));
                eLink1 = SetEffectIcon(eLink1, 66);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                float fDuration = Sp_CalcDuration( 60.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
            }
            //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
            //  Will add this bonus to anyone else w/Force Chain for free.
            if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                int index = 0;
                for ( ; index < 3; ++index ) {
                    object oCharacter = GetPartyMemberByIndex(index);
                    if ( oCharacter != OBJECT_SELF
                         && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                         && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_MASTER_FORCE_BARRIER)) {
                         Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_MASTER_FORCE_BARRIER );
                         eLink1 = EffectDamageResistance(DAMAGE_TYPE_BLUDGEONING, 15);
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_PIERCING, 15));
                         eLink1 = EffectLinkEffects(eLink1, EffectDamageResistance(DAMAGE_TYPE_SLASHING, 15));
                         eLink1 = SetEffectIcon(eLink1, 66);
                         eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                         eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                         float fDuration = Sp_CalcDuration( 60.0 );
                         Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                    }
                }
            }
        }
        break;

        // DJS-OEI 12/12/2003
        // Only PCs, NPCs, and Friendly Allies should cast these
        // versions of Battle Meditation. That way, only allies will
        // get bonuses with this spell ID and only targets will get
        // penalties with this spell ID.
        case FORCE_POWER_BATTLE_MEDITATION_PC:
        {
            SWFP_HARMFUL = FALSE;

            // Bonuses
            eLink1 = EffectDamageIncrease(2, DAMAGE_TYPE_UNIVERSAL);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackIncrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectVPRegenModifier( 50 ) );
            eLink1 = SetEffectIcon(eLink1, 67);

            int nCnt = 0;
            float fDuration = Sp_CalcDuration( 20.0 );

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                // The caster is a party member. Apply the benefits
                // to the each member of the party.
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                // The caster is not a party member. Apply the benefits
                // to the closest three allies.
                oParty = OBJECT_SELF;
            }

            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, FORCE_POWER_BATTLE_MEDITATION_PC );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_BATTLE_MEDITATION_PC ) ) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9000), oParty);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
                }
            }
        }
        break;

        case FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC:
        {
            SWFP_HARMFUL = FALSE;

            // Bonuses
            eLink1 = EffectDamageIncrease(2);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackIncrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
            eLink1 = EffectLinkEffects(eLink1, EffectVPRegenModifier( 50 ) );
            eLink1 = SetEffectIcon(eLink1, 68);

            int nCnt = 0;
            float fDuration = Sp_CalcDuration( 20.0 );

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                // The caster is a party member. Apply the benefits
                // to the each member of the party.
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                // The caster is not a party member. Apply the benefits
                // to the closest three allies.
                oParty = OBJECT_SELF;
            }

            //tIterae over all targets of the beneficial effects and
            // apply them.
            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC ) ) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9001), oParty);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
                }
            }

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_SHAPE = SHAPE_SPHERE;

            // Penalties
            eLink1 = EffectDamageDecrease(2);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackDecrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowDecrease(SAVING_THROW_WILL, 2));
            eLink1 = SetEffectIcon(eLink1, 68);

            // Iterate over all targets of the detrimental effects and
            // apply them.
            // Get each creature within 10.0 units.
            object oCreature = GetFirstObjectInShape(SWFP_SHAPE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets hostile creatures only.
                if( GetIsObjectValid(oCreature) &&
                    GetIsEnemy(oCreature) &&
                    GetRacialType(oCreature) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    //Make Immunity Checks
                    int nResist = Sp_BlockingChecks(oCreature, eLink1, eInvalid, eInvalid);
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oCreature);
                        if(nSaves == 0)
                        {
                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC ) ) {
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9003), oCreature);
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oCreature, fDuration);
                            }
                        }
                    }
                }
                oCreature = GetNextObjectInShape(SWFP_SHAPE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        case FORCE_POWER_MASTER_BATTLE_MEDITATION_PC:
        {
            SWFP_HARMFUL = FALSE;

            // Bonuses
            eLink1 = EffectDamageIncrease(4);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackIncrease(4));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 4));
            eLink1 = EffectLinkEffects(eLink1, EffectVPRegenModifier( 50 ) );
            eLink1 = SetEffectIcon(eLink1, 69);

            int nCnt = 0;
            float fDuration = Sp_CalcDuration( 20.0 );

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                // The caster is a party member. Apply the benefits
                // to the each member of the party.
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                // The caster is not a party member. Apply the benefits
                // to the closest three allies.
                oParty = OBJECT_SELF;
            }

            // Iterate over all targets of the beneficial effects and
            // apply them.
            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, FORCE_POWER_MASTER_BATTLE_MEDITATION_PC );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_MASTER_BATTLE_MEDITATION_PC ) ) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9002), oParty);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
                }
            }

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_SHAPE = SHAPE_SPHERE;

            // Penalties
            eLink1 = EffectDamageDecrease(4);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackDecrease(4));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowDecrease(SAVING_THROW_WILL, 4));
            eLink1 = SetEffectIcon(eLink1, 69);

            // Iterate over all targets of the detrimental effects and
            // apply them.
            // Get each creature within 15.0 units.
            object oCreature = GetFirstObjectInShape(SWFP_SHAPE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets hostile creatures only.
                if( GetIsObjectValid(oCreature) &&
                    GetIsEnemy(oCreature) &&
                    GetRacialType(oCreature) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    //Make Immunity Checks
                    int nResist = Sp_BlockingChecks(oCreature, eLink1, eInvalid, eInvalid);
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oCreature);
                        if(nSaves == 0)
                        {
                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_MASTER_BATTLE_MEDITATION_PC );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_MASTER_BATTLE_MEDITATION_PC ) ) {
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9004), oCreature);
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oCreature, fDuration);
                            }
                        }
                    }
                }
                oCreature = GetNextObjectInShape(SWFP_SHAPE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        // DJS-OEI 12/12/2003
        // Only enemies of the PC party should cast these
        // versions of Battle Meditation. That way, only enemies will
        // get bonuses with this spell ID and only "allied" targets will get
        // penalties with this spell ID.
        case FORCE_POWER_BAT_MED_ENEMY:
        {
            SWFP_HARMFUL = FALSE;

            // Bonuses
            eLink1 = EffectDamageIncrease(2, DAMAGE_TYPE_UNIVERSAL);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackIncrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
            eLink1 = SetEffectIcon(eLink1, 107);

            int nCnt = 0;
            float fDuration = Sp_CalcDuration( 20.0 );

            //Apply the benefits to the closest three allies.
            object oParty = OBJECT_SELF;
            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, FORCE_POWER_BAT_MED_ENEMY );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_BAT_MED_ENEMY ) ) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9000), oParty);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
            }
        }
        break;

        case FORCE_POWER_IMP_BAT_MED_ENEMY:
        {
            SWFP_HARMFUL = FALSE;

            // Bonuses
            eLink1 = EffectDamageIncrease(2);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackIncrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
            eLink1 = SetEffectIcon(eLink1, 108);

            int nCnt = 0;
            float fDuration = Sp_CalcDuration( 20.0 );

            object oParty = OBJECT_SELF;
            // Iterate over all targets of the beneficial effects and
            // apply them.
            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, FORCE_POWER_IMP_BAT_MED_ENEMY );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_IMP_BAT_MED_ENEMY ) ) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9001), oParty);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
            }

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_SHAPE = SHAPE_SPHERE;

            // Penalties
            eLink1 = EffectDamageDecrease(2);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackDecrease(2));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowDecrease(SAVING_THROW_WILL, 2));
            eLink1 = SetEffectIcon(eLink1, 108);

            // Iterate over all targets of the detrimental effects and
            // apply them.
            // Get each creature within 10.0 units.
            object oCreature = GetFirstObjectInShape(SWFP_SHAPE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets hostile creatures only.
                if( GetIsObjectValid(oCreature) &&
                    GetIsEnemy(oCreature) &&
                    GetRacialType(oCreature) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    //Make Immunity Checks
                    int nResist = Sp_BlockingChecks(oCreature, eLink1, eInvalid, eInvalid);
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oCreature);
                        if(nSaves == 0)
                        {
                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_IMP_BAT_MED_ENEMY );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_IMP_BAT_MED_ENEMY ) ) {
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9001), oCreature);
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oCreature, fDuration);
                            }
                        }
                    }
                }
                oCreature = GetNextObjectInShape(SWFP_SHAPE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        case FORCE_POWER_MAS_BAT_MED_ENEMY:
        {
            SWFP_HARMFUL = FALSE;

            // Bonuses
            eLink1 = EffectDamageIncrease(4);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackIncrease(4));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 4));
            eLink1 = SetEffectIcon(eLink1, 109);

            int nCnt = 0;
            float fDuration = Sp_CalcDuration( 20.0 );

            object oParty = OBJECT_SELF;
            // Iterate over all targets of the beneficial effects and
            // apply them.
            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, FORCE_POWER_MAS_BAT_MED_ENEMY );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, FORCE_POWER_MAS_BAT_MED_ENEMY ) ) {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9002), oParty);
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
            }

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_SHAPE = SHAPE_SPHERE;

            // Penalties
            eLink1 = EffectDamageDecrease(4);
            eLink1 = EffectLinkEffects(eLink1, EffectAttackDecrease(4));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowDecrease(SAVING_THROW_WILL, 4));
            eLink1 = SetEffectIcon(eLink1, 109);

            // Iterate over all targets of the detrimental effects and
            // apply them.
            // Get each creature within 15.0 units.
            object oCreature = GetFirstObjectInShape(SWFP_SHAPE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets hostile creatures only.
                if( GetIsObjectValid(oCreature) &&
                    GetIsEnemy(oCreature) &&
                    GetRacialType(oCreature) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    //Make Immunity Checks
                    int nResist = Sp_BlockingChecks(oCreature, eLink1, eInvalid, eInvalid);
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oCreature);
                        if(nSaves == 0)
                        {
                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_MAS_BAT_MED_ENEMY );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_MAS_BAT_MED_ENEMY ) ) {
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9002), oCreature);
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oCreature, fDuration);
                            }
                        }
                    }
                }
                oCreature = GetNextObjectInShape(SWFP_SHAPE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        // DJS-OEI 12/15/2003
        case FORCE_POWER_CRUSH_OPPOSITION_I:
        case FORCE_POWER_CRUSH_OPPOSITION_II:
        case FORCE_POWER_CRUSH_OPPOSITION_III:
        case FORCE_POWER_CRUSH_OPPOSITION_IV:
        case FORCE_POWER_CRUSH_OPPOSITION_V:
        case FORCE_POWER_CRUSH_OPPOSITION_VI:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_SHAPE = SHAPE_SPHERE;

            float fRange = Sp_CalcRange( 15.0 );

            // Calculate the severity of the penalty based on the power used.
            // It goes from 1 to 6.
            int nPenalty = GetSpellId() - FORCE_POWER_CRUSH_OPPOSITION_I + 1;

            // Penalties
            eLink1 = EffectAttackDecrease(nPenalty);
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowDecrease(SAVING_THROW_WILL, nPenalty));
            eLink1 = SetEffectIcon(eLink1, 70 + nPenalty - 1);

            // Iterate over all targets of the detrimental effects and
            // apply them.
            // Get each creature within 15.0 units.
            object oCreature = GetFirstObjectInShape(SWFP_SHAPE, fRange, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oCreature))
            {
                // This power targets hostile creatures only.
                if( GetIsObjectValid(oCreature) &&
                    GetIsEnemy(oCreature) &&
                    GetRacialType(oCreature) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    //Make Immunity Checks
                    int nResist = Sp_BlockingChecks(oCreature, eLink1, eInvalid, eInvalid);
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oCreature);
                        if(nSaves == 0)
                        {
                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oCreature, GetSpellId() );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oCreature, GetSpellId() ) ) {
                                float fDuration = Sp_CalcDuration( 45.0 );
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oCreature, fDuration);
                            }
                        }
                    }
                }
                oCreature = GetNextObjectInShape(SWFP_SHAPE, fRange, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        // DJS-OEI 12/15/2003
        // Applies the Force Body effect to the target. This effect has
        // the value 0, 1, or 2 embedded in it depending on the level of
        // this power cast. This will determine the percentages of FP/VP
        // used to cast subsquent spells.
        case FORCE_POWER_FORCE_BODY:
        case FORCE_POWER_IMPROVED_FORCE_BODY:
        case FORCE_POWER_MASTER_FORCE_BODY:
        {
            int nFX = 0;
            if( GetSpellId() == FORCE_POWER_FORCE_BODY ) {
                nFX = 9011;
            }
            else if( GetSpellId() == FORCE_POWER_IMPROVED_FORCE_BODY ) {
                nFX = 9012;
            }
            else if( GetSpellId() == FORCE_POWER_MASTER_FORCE_BODY ) {
                nFX = 9013;
            }

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, GetSpellId() );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, GetSpellId() ) ) {

                SWFP_HARMFUL = FALSE;
                int nValue = GetSpellId() - FORCE_POWER_FORCE_BODY;
                eLink1 = EffectForceBody( nValue );
                eLink1 = SetEffectIcon(eLink1, 76 + nValue );
                float fDuration = Sp_CalcDuration( 30.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( nFX ), OBJECT_SELF );
            }
        }
        break;

        // DJS-OEI 12/30/2003
        case FORCE_POWER_DRAIN_FORCE:
        {
            // Drain Force affects a single target and drains a maximum
            // of 10 FP plus the casting cost.

            // As per Ferret, the caster will always receive at least the casting
            // cost of the power in FP even if none of the targets have
            // that much FP to leech. Since the caster has lost the FP by the time
            // we get here, just apply a Force Heal effect immediately.
            int nCost = GetSpellForcePointCost();
            //eLink1 = EffectHealForcePoints( nCost );
            //ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, OBJECT_SELF);

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            // The number of FP to steal is assumed to be 10 to start with.
            int nFPAmount = 20;

            // Determine the number of Force Points the target has. If it is
            // less than the steal amount, decrease the steal amount.
            /*
            int nTargetFP = GetCurrentForcePoints( oTarget );
            if( nTargetFP < nFPAmount ) {
                nFPAmount = nTargetFP;
            }
            */
            if ( GetMaxForcePoints( oTarget ) < 1 )
            {
                nFPAmount = nCost;
            }
            else
            {
                nFPAmount = 20;
            }

            // Always give the player back the casting cost.
            //nFPAmount += nCost;

            // Create a temporary Force Point Damage effect in order to
            // see if the target is immune for some reason.
            eLink1 = EffectDamageForcePoints( nFPAmount );
            int nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);

            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if( GetRacialType(oTarget) != RACIAL_TYPE_DROID )
            {
                if(nResist == 0)
                {
                    int nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves > 0)
                    {
                        nFPAmount /= 2;
                    }
                    if ( nFPAmount < nCost )
                    {
                        nFPAmount = nCost;
                    }

                    // Apply a Force Point Damage effect to the target.
                    eLink1 = EffectDamageForcePoints( nFPAmount );
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);

                    // Apply a Force Point Heal effect to the caster.
                    eLink2 = EffectHealForcePoints( nFPAmount );
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, OBJECT_SELF);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                }
            }
        }
        break;

        // DJS-OEI 12/30/2003
        case FORCE_POWER_IMPROVED_DRAIN_FORCE:
        case FORCE_POWER_MASTER_DRAIN_FORCE:
        {
            // Improved Drain Force and Master Drain Force both
            // affect multiple targets.

            // As per Ferret, the caster will always receive at least the casting
            // cost of the power in FP even if none of the targets have
            // that much FP to leech. Since the caster has lost the FP by the time
            // we get here, just apply a Force Heal effect immediately.
            int nCost = GetSpellForcePointCost();
            //eLink1 = EffectHealForcePoints( nCost );
            //ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, OBJECT_SELF);

            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            int nFullRegainAmount = nCost;
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oTarget))
            {
                int nFPAmount;
                if( GetSpellId() == FORCE_POWER_IMPROVED_DRAIN_FORCE ) {
                    nFPAmount = 20;
                }
                else if( GetSpellId() == FORCE_POWER_MASTER_DRAIN_FORCE ) {
                    nFPAmount = 30;
                }

                // Determine the number of Force Points the target has. If it is
                // less than the steal amount, decrease the steal amount.
                int nTargetFP = GetCurrentForcePoints( oTarget );
                if( nTargetFP < nFPAmount ) {
                    nFPAmount = nTargetFP;
                }

                // Create a temporary Force Point Damage effect in order to
                // see if the target is immune for some reason.
                eLink1 = EffectDamageForcePoints( nFPAmount );
                int nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);

                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                if( ( GetRacialType(oTarget) != RACIAL_TYPE_DROID ) &&
                    GetIsEnemy(oTarget) )
                {
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oTarget);
                        if(nSaves > 0)
                        {
                            nFPAmount /= 2;
                        }

                        // Apply a Force Point Damage effect to the target.
                        eLink1 = EffectDamageForcePoints( nFPAmount );
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);

                        nFullRegainAmount += nFPAmount;
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
            }

            // Finally, give the player the FP they've drained plus the
            // casting cost (assigned above).
            eLink2 = EffectHealForcePoints( nFullRegainAmount );
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink2, OBJECT_SELF);
        }
        break;

        // DJS-OEI 12/30/2003
        case FORCE_POWER_FORCE_SCREAM:
        case FORCE_POWER_IMPROVED_FORCE_SCREAM:
        case FORCE_POWER_MASTER_FORCE_SCREAM:
        {
            // Force Scream and Improved Force Scream both affect
            // targets in a cone extending from the caster's location.
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;
            SWFP_PRIVATE_SAVE_VERSUS_TYPE = SAVING_THROW_TYPE_SONIC;

            // Each version of the spell causes differing amounts of damage.
            int nDamageRolls;
            int nAttributeDamage;
            int nIconID;
            int nShape;
            float fShapeSize;
            int nVFXID;
            location lTargetLoc;
            if( GetSpellId() == FORCE_POWER_FORCE_SCREAM ) {
                nDamageRolls = 3;
                nAttributeDamage = 2;
                nIconID = 79;
                nShape = SHAPE_SPELLCONE;
                fShapeSize = Sp_CalcRange( 20.0 );
                nVFXID = 9005;
                lTargetLoc = GetLocation( GetSpellTarget() );
            }
            else if( GetSpellId() == FORCE_POWER_IMPROVED_FORCE_SCREAM ) {
                nDamageRolls = 5;
                nAttributeDamage = 4;
                nIconID = 80;
                nShape = SHAPE_SPELLCONE;
                fShapeSize = Sp_CalcRange( 20.0 );
                nVFXID = 9006;
                lTargetLoc = GetLocation( GetSpellTarget() );
            }
            else if( GetSpellId() == FORCE_POWER_MASTER_FORCE_SCREAM ) {
                nDamageRolls = 7;
                nAttributeDamage = 6;
                nIconID = 81;
                nShape = SHAPE_SPHERE;
                // DJS-OEI 1/14/2004
                // Increase the range slightly. Since the range for this spell
                // is 10m, the pathing system fudging will in some cases not
                // cuase any valid targets to be within 10m to get damaged.
                //fShapeSize = Sp_CalcRange( 10.0 );
                fShapeSize = Sp_CalcRange( 12.0 );
                nVFXID = 9007;
                lTargetLoc = GetLocation( OBJECT_SELF );
            }

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect( nVFXID ), OBJECT_SELF);

//            object oTarget = GetFirstObjectInShape(nShape, fShapeSize, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE );
            object oTarget = GetFirstObjectInShape(nShape, fShapeSize, lTargetLoc, TRUE, OBJECT_TYPE_CREATURE );
            while(GetIsObjectValid(oTarget))
            {
                int nTotalDamage = Sp_CalcDamage( oTarget, nDamageRolls, 6 );

                // Create the damage effects.
                eLink1 = EffectDamage( nTotalDamage, DAMAGE_TYPE_SONIC );
                eLink2 = EffectAbilityDecrease(ABILITY_STRENGTH, nAttributeDamage);
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_DEXTERITY, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_INTELLIGENCE, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_WISDOM, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_CHARISMA, nAttributeDamage));
                eLink2 = EffectLinkEffects(eLink2, EffectAbilityDecrease(ABILITY_CONSTITUTION, nAttributeDamage));
                eLink2 = SetEffectIcon(eLink2, nIconID);

                // Check resistances.
                int nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eInvalid);
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                if( ( GetRacialType(oTarget) != RACIAL_TYPE_DROID ) &&
                    GetIsEnemy(oTarget) )
                {
                    if(nResist == 0)
                    {
                        int nSaves = Sp_MySavingThrows(oTarget);
                        if(nSaves <= 0)
                        {
                            // Apply physical damage effect to the target.
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);

                            // Remove any lower level or equal versions of this power.
                            Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                            // Do not apply the effects of this power if a more powerful
                            // version is already attached to the target.
                            if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                                // Apply the attribute damage effect.
                                float fDuration = Sp_CalcDuration( 30.0 );
                                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink2, oTarget, fDuration);
                            }
                        }
                        else {
                            int nApply;
                            // DJS-OEI 11/20/2003
                            // If the target has the Evasion feat, the damage on a successful
                            // save is 0. Otherwise, it's half the original damage.
                            if( GetHasFeat( FEAT_EVASION, oTarget ) ) {
                                nApply = 0;
                            }
                            else {
                                nApply = nTotalDamage/2;
                            }

                            if( nApply > 0 ) {
                                // The target saved, so the attribute damage is ignored.
                                // Rebuild the damage effect with the new damage.
                                eLink1 = EffectDamage( nApply, DAMAGE_TYPE_SONIC );
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink1, oTarget);
                            }
                        }
                    }
                    else
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                    }
                }
//                oTarget = GetNextObjectInShape(nShape, fShapeSize, GetLocation(OBJECT_SELF), TRUE, OBJECT_TYPE_CREATURE );
                oTarget = GetNextObjectInShape(nShape, fShapeSize, lTargetLoc, TRUE, OBJECT_TYPE_CREATURE );
            }
        }
        break;

        case FORCE_POWER_FURY:
        case FORCE_POWER_IMPROVED_FURY:
        case FORCE_POWER_MASTER_FURY:
        case FORCE_POWER_WOOKIEE_RAGE_I:
        case FORCE_POWER_WOOKIEE_RAGE_II:
        case FORCE_POWER_WOOKIEE_RAGE_III:
        {
            SWFP_HARMFUL = FALSE;

            int nVPPerLevel;
            int nSaveModifier;
            int nStrModifier;
            int nDefenseModifier;
            // DJS-OEI 2/15/2005
            // I have no idea why I commented this out, but it happened
            // in January 2004. Apparently the description still indicates
            // the target gets extra attacks. Reinstated since Speed tree
            // uses extra attacks.
            //int nExtraAttacks;
            int nExtraAttacks;
            float nDuration;
            int nIcon;
            if( ( GetSpellId() == FORCE_POWER_FURY ) ||
                ( GetSpellId() == FORCE_POWER_WOOKIEE_RAGE_I ) ) {
                nVPPerLevel = 1;
                nSaveModifier = 1;
                nStrModifier = 2;
                nDefenseModifier = 2;
                // DJS-OEI 2/15/2005
                // I have no idea why I commented this out, but it happened
                // in January 2004. Apparently the description still indicates
                // the target gets extra attacks. Reinstated since Speed tree
                // uses extra attacks.
                //nExtraAttacks = 0;
                nExtraAttacks = 0;
                nDuration = 30.0;
                nIcon = 82;
            }
            else if( ( GetSpellId() == FORCE_POWER_IMPROVED_FURY ) ||
                     ( GetSpellId() == FORCE_POWER_WOOKIEE_RAGE_II ) ) {
                nVPPerLevel = 2;
                nSaveModifier = 2;
                nStrModifier = 4;
                nDefenseModifier = 4; //RWT-OEI 09/27/04 - Changed from 4 to 2 per FMP#400
                // DJS-OEI 2/15/2005
                // I have no idea why I commented this out, but it happened
                // in January 2004. Apparently the description still indicates
                // the target gets extra attacks. Reinstated since Speed tree
                // uses extra attacks.
                //nExtraAttacks = 1;
                nExtraAttacks = 1;
                nDuration = 45.0;
                nIcon = 83;
            }
            else if( ( GetSpellId() == FORCE_POWER_MASTER_FURY ) ||
                     ( GetSpellId() == FORCE_POWER_WOOKIEE_RAGE_III ) ) {
                nVPPerLevel = 3;
                nSaveModifier = 3;
                nStrModifier = 6;
                nDefenseModifier = 6;
                // DJS-OEI 2/15/2005
                // I have no idea why I commented this out, but it happened
                // in January 2004. Apparently the description still indicates
                // the target gets extra attacks. Reinstated since Speed tree
                // uses extra attacks.
                //nExtraAttacks = 2;
                nExtraAttacks = 2;
                nDuration = 60.0;
                nIcon = 84;
            }

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, GetSpellId() );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( OBJECT_SELF, GetSpellId() ) ) {

                int nFinalVP = GetHitDice( OBJECT_SELF ) * nVPPerLevel;
                eLink1 = EffectFury();
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease( SAVING_THROW_FORT, nSaveModifier ) );
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease( SAVING_THROW_WILL, nSaveModifier ) );
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease( ABILITY_STRENGTH, nStrModifier ) );
                eLink1 = EffectLinkEffects(eLink1, EffectACDecrease( nDefenseModifier ) );

                // DJS-OEI 2/15/2005
                // I have no idea why I commented this out, but it happened
                // in January 2004. Apparently the description still indicates
                // the target gets extra attacks. Reinstated since Speed tree
                // uses extra attacks.
                /*
                if( nExtraAttacks > 0 ) {
                    eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks( nExtraAttacks ) );
                }
                */
                if( nExtraAttacks > 0 ) {
                    eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks( nExtraAttacks ) );
                }

                eLink1 = EffectLinkEffects(eLink1, EffectImmunity( IMMUNITY_TYPE_PARALYSIS ) );
                eLink1 = EffectLinkEffects(eLink1, EffectImmunity( IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE ) );
                eLink1 = SetEffectIcon(eLink1, nIcon);
                // DJS-OEI 10/16/2004
                // I unlinked this effect from the rest since when the points
                // were used up the effect was destroyed, along with the Fury effect.
                eLink2 = EffectTemporaryHitpoints( nFinalVP );

                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, nDuration, eInvalid, 0.0);
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink2, nDuration, eInvalid, 0.0);
            }
        }
        break;

        // DJS-OEI 1/2/2004
        case FORCE_POWER_INSPIRE_FOLLOWERS_I:
        case FORCE_POWER_INSPIRE_FOLLOWERS_II:
        case FORCE_POWER_INSPIRE_FOLLOWERS_III:
        case FORCE_POWER_INSPIRE_FOLLOWERS_IV:
        case FORCE_POWER_INSPIRE_FOLLOWERS_V:
        case FORCE_POWER_INSPIRE_FOLLOWERS_VI:
        {
            SWFP_HARMFUL = FALSE;

            float fDuration = Sp_CalcDuration( 45.0 );

            // Calculate the size of the bonus based on the power used.
            // It goes from 1 to 6.
            int nBonus = GetSpellId() - FORCE_POWER_INSPIRE_FOLLOWERS_I + 1;

            // Bonuses
            eLink1 = EffectAttackIncrease(nBonus);
            eLink1 = EffectLinkEffects(eLink1, EffectDamageIncrease(nBonus));
            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, nBonus));
            eLink1 = SetEffectIcon(eLink1, 85 + nBonus - 1);

            int nCnt = 0;

            object oParty;
            if(IsObjectPartyMember(OBJECT_SELF))
            {
                // The caster is a party member. Apply the benefits
                // to the each member of the party.
                oParty = GetPartyMemberByIndex(nCnt);
            }
            else
            {
                // The caster is not a party member. Apply the benefits
                // to the closest three allies.
                oParty = OBJECT_SELF;
            }

            // Iterate over all targets of the beneficial effects and
            // apply them.
            while(nCnt < 3)
            {
                if( GetIsObjectValid(oParty) &&
                    GetRacialType(oParty) != RACIAL_TYPE_DROID )
                {
                    SignalEvent(oParty, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oParty, GetSpellId() );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oParty, GetSpellId() ) ) {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oParty, fDuration);
                    }
                }
                nCnt++;
                if(IsObjectPartyMember(OBJECT_SELF))
                {
                   oParty = GetPartyMemberByIndex(nCnt);
                }
                else
                {
                   oParty = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCnt);
                }
            }
        }
        break;

        // DJS-OEI 1/2/2004
        // The first level of the Revitalize tree is separate from the
        // other two levels since it only applies to the first unconcious
        // character closest to the the caster.
        case FORCE_POWER_REVITALIZE:
        {
            SWFP_HARMFUL = FALSE;

            // Make sure the caster is in the party. If they're not we can't
            // really do anything with this power since enemies don't get
            // knocked unconscious, they die.
            if( IsObjectPartyMember(OBJECT_SELF) ) {

                // Find which party members are unconscious. This
                // function makes the assumption there can only be
                // up to 3 party members at a time, so only 2 can
                // be unconscious at maximum or the game would be over.
                object oPossibility1 = OBJECT_INVALID;
                object oPossibility2 = OBJECT_INVALID;

                int nCnt = 0;
                for( nCnt = 0; nCnt < 3; nCnt++ ) {
                    object oPartyMember = GetPartyMemberByIndex(nCnt);
                    // Don't count the caster since they couldn't be
                    // casting the spell if they were unconscious.
                    if( oPartyMember != OBJECT_SELF ) {
                        if( GetIsObjectValid(oPartyMember) &&
                            GetRacialType(oPartyMember) != RACIAL_TYPE_DROID &&
                            GetCurrentHitPoints( oPartyMember ) < 1 ) {

                            if( oPossibility1 == OBJECT_INVALID ) {
                                oPossibility1 = oPartyMember;
                            }
                            else {
                                oPossibility2 = oPartyMember;
                            }
                        }
                    }
                }

                // Determine the final target.
                oTarget = OBJECT_INVALID;
                if( ( oPossibility1 != OBJECT_INVALID ) && ( oPossibility2 == OBJECT_INVALID ) ) {
                    oTarget = oPossibility1;
                }
                else if( ( oPossibility1 == OBJECT_INVALID ) && ( oPossibility2 != OBJECT_INVALID ) ) {
                    // Should never happen, but deal with it anyways.
                    oTarget = oPossibility2;
                }
                else if( ( oPossibility1 != OBJECT_INVALID ) && ( oPossibility2 != OBJECT_INVALID ) ) {
                    // Find the closest unconscious party member.
                    float fDist1;
                    float fDist2;
                    fDist1 = GetDistanceBetween( OBJECT_SELF, oPossibility1 );
                    fDist2 = GetDistanceBetween( OBJECT_SELF, oPossibility2 );
                    if( fDist1 <= fDist2 ) {
                        oTarget = oPossibility1;
                    }
                    else {
                        oTarget = oPossibility2;
                    }
                }

                // If there is a valid target, resurrect it and give it 5% of its max HP back.
                if( oTarget != OBJECT_INVALID ) {
                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                    //int nHeal = ( GetMaxHitPoints( oTarget ) * 5 ) / 100;
                    //if( nHeal < 1 ) {
                    //    nHeal = 1;
                    //}
                    //RWT-OEI 09/27/04 FMP#4893 - They want it to do fixed HP amounts
                    int nHeal = 10;
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oTarget);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oTarget);
                    ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( 9008 ), oTarget );
                }
            }
        }
        break;

        // DJS-OEI 1/2/2004
        case FORCE_POWER_IMPROVED_REVITALIZE:
        case FORCE_POWER_MASTER_REVITALIZE:
        {
            SWFP_HARMFUL = FALSE;

            int nHPPercent = 0;
            if( GetSpellId() == FORCE_POWER_IMPROVED_REVITALIZE ) {
                nHPPercent = 5;
            }
            else {
                nHPPercent = 10;
            }

            // Make sure the caster is in the party. If they're not we can't
            // really do anything with this power since enemies don't get
            // knocked unconscious, they die.
            if( IsObjectPartyMember(OBJECT_SELF) ) {

                // Resurrect all unconscious non-droid party members and
                // give them some of their HP back.
                int nCnt = 0;
                for( nCnt = 0; nCnt < 3; nCnt++ ) {
                    object oPartyMember = GetPartyMemberByIndex(nCnt);
                    // Don't count the caster since they couldn't be
                    // casting the spell if they were unconscious.
                    if( oPartyMember != OBJECT_SELF ) {
                        if( GetIsObjectValid(oPartyMember) &&
                            GetRacialType(oPartyMember) != RACIAL_TYPE_DROID &&
                            GetCurrentHitPoints( oPartyMember ) < 1 ) {

                            SignalEvent(oPartyMember, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));

                            //int nHeal = ( GetMaxHitPoints( oPartyMember ) * nHPPercent ) / 100;
                            //if( nHeal < 1 ) {
                            //    nHeal = 1;
                            //}
                            //RWT-OEI 09/27/04 - FMP #4893 - They want it to do fixed
                            //heal amounts instead of percentage
                            int nHeal = 0;
                            if ( GetSpellId() == FORCE_POWER_IMPROVED_REVITALIZE )
                            {
                                nHeal = 25;
                            }
                            else
                            {
                                nHeal = 50;
                            }
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPartyMember);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oPartyMember);
                            ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect( 9008 ), oPartyMember );
                        }
                    }
                }
            }
        }
        break;

        // DJS-OEI 1/2/2004
        case FORCE_POWER_FORCE_CRUSH:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_FORT;

            int nDice = GetHitDice(OBJECT_SELF);
            // DJS-OEI 10/7/2004
            // Removed damage level cap and changed to d10.
            /*
            if(nDice > 10)
            {
                nDice = 10;
            }
            */
            //SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDice, 6 );
            SWFP_DAMAGE = Sp_CalcDamage( oTarget, nDice, 10 );
            //SWFP_DAMAGE = d6(nDamage);
            // DJS-OEI 8/16/2004
            // Damage type is now Unstoppable, although its define is still Acid.
            //SWFP_DAMAGE_TYPE = DAMAGE_TYPE_UNIVERSAL;
            SWFP_DAMAGE_TYPE = DAMAGE_TYPE_ACID;

            effect eCrush = EffectCrush();
            effect eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);

            int nResist = Sp_BlockingChecks(oTarget, eCrush, eDamage, eInvalid);
            int nSaves;
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
            if(nResist == 0)
            {
                nSaves = Sp_MySavingThrows(oTarget);
                if(nSaves == 0)
                {
                    // Apply the Crush effect for the length of the damage animation.
                    // Also, time the application of damage to the point at which the
                    // crush animation climaxes.
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCrush, oTarget, 2.0);
                    DelayCommand( 1.64, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget) );

                    // DJS-OEI 8/16/2004
                    // Finally, delay application of a Force Push effect with no
                    // fly-back duration to cause the target to fall to the ground
                    // and get back up.
                    effect eDrop = EffectForcePushed();
                    DelayCommand( 2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDrop, oTarget) );
                }
                else {
                    // Half damage.
                    eDamage = EffectDamage(SWFP_DAMAGE/2, SWFP_DAMAGE_TYPE);

                    // Apply the Crush effect for the length of the damage animation.
                    // Also, time the application of damage to the point at which the
                    // crush animation climaxes.
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCrush, oTarget, 2.0);
                    DelayCommand( 1.64, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget) );

                    // DJS-OEI 8/16/2004
                    // Finally, delay application of a Force Push effect with no
                    // fly-back duration to cause the target to fall to the ground
                    // and get back up.
                    effect eDrop = EffectForcePushed();
                    DelayCommand( 2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDrop, oTarget) );
                }
            }
            if(nResist > 0)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
            }
        }
        break;

        // DJS-OEI 1/2/2004
        case FORCE_POWER_FORCE_ENLIGHTENMENT:
        {
            SWFP_HARMFUL = FALSE;

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_ENLIGHTENMENT );

            // Apply the highest level versions of the Speed, Armor, and Valor
            // tree known by the caster.

            // Speed
            if( GetSpellAcquired( FORCE_POWER_SPEED_MASTERY ) ) {

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_SPEED_MASTERY );

                eLink1 = EffectMovementSpeedIncrease(99);
                eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(4));
                eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks(2));
                eLink1 = SetEffectIcon(eLink1, 22);

                if(OBJECT_SELF == GetPartyMemberByIndex(0))
                {
                    eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_SPEED));
                }
                float fDuration = Sp_CalcDuration( 36.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
                //  Will add this bonus to anyone else w/Force Chain for free.
                if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                    int index = 0;
                    for ( ; index < 3; ++index ) {
                        object oCharacter = GetPartyMemberByIndex(index);
                        if ( oCharacter != OBJECT_SELF
                             && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                             && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_SPEED_MASTERY)) {
                             Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_SPEED_MASTERY);

                            eLink1 = EffectMovementSpeedIncrease(99);
                            eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(4));
                            eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks(2));
                            eLink1 = SetEffectIcon(eLink1, 22);
                            Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                        }
                    }
                }
            }
            else if( GetSpellAcquired( FORCE_POWER_KNIGHT_SPEED ) ) {

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_KNIGHT_SPEED );

                eLink1 = EffectMovementSpeedIncrease(99);
                eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(4));
                eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks(1));
                eLink1 = SetEffectIcon(eLink1, 20);

                if(OBJECT_SELF == GetPartyMemberByIndex(0))
                {
                    eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_SPEED));
                }
                float fDuration = Sp_CalcDuration( 36.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
                //  Will add this bonus to anyone else w/Force Chain for free.
                if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                    int index = 0;
                    for ( ; index < 3; ++index ) {
                        object oCharacter = GetPartyMemberByIndex(index);
                        if ( oCharacter != OBJECT_SELF
                             && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                             && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_KNIGHT_SPEED)) {
                             Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_KNIGHT_SPEED);

                            eLink1 = EffectMovementSpeedIncrease(99);
                            eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(4));
                            eLink1 = EffectLinkEffects(eLink1, EffectModifyAttacks(1));
                            eLink1 = SetEffectIcon(eLink1, 20);
                            Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                        }
                    }
                }
            }
            else if( GetSpellAcquired( FORCE_POWER_SPEED_BURST ) ) {

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_SPEED_BURST );

                eLink1 = EffectMovementSpeedIncrease(99);
                eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(2));
                eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_KNIGHTS_SPEED));
                eLink1 = SetEffectIcon(eLink1, 2);
                if(OBJECT_SELF == GetPartyMemberByIndex(0))
                {
                    eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_SPEED));
                }
                float fDuration = Sp_CalcDuration( 36.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
                //  Will add this bonus to anyone else w/Force Chain for free.
                if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                    int index = 0;
                    for ( ; index < 3; ++index ) {
                        object oCharacter = GetPartyMemberByIndex(index);
                        if ( oCharacter != OBJECT_SELF
                             && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                             && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_SPEED_BURST)) {
                             Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_SPEED_BURST);

                            eLink1 = EffectMovementSpeedIncrease(99);
                            eLink1 = EffectLinkEffects(eLink1, EffectACIncrease(2));
                            eLink1 = EffectLinkEffects(eLink1, EffectVisualEffect(VFX_DUR_KNIGHTS_SPEED));
                            eLink1 = SetEffectIcon(eLink1, 2);
                            Sp_ApplyEffects(FALSE, oCharacter, 0.0, 1, eLink1, fDuration, eInvalid, 0.0);
                        }
                    }
                }
            }

            // Armor
            if( GetSpellAcquired( FORCE_POWER_FORCE_ARMOR ) ) {

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_ARMOR );

                eLink1 = EffectACIncrease(6, AC_DODGE_BONUS);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 6));
                eLink1 = SetEffectIcon(eLink1, 7);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                float fDuration = Sp_CalcDuration( 20.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
                //  Will add this bonus to anyone else w/Force Chain for free.
                if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                    int index = 0;
                    for ( ; index < 3; ++index ) {
                        object oCharacter = GetPartyMemberByIndex(index);
                        if ( oCharacter != OBJECT_SELF
                             && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                             && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_ARMOR)) {
                             Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_ARMOR);

                            eLink1 = EffectACIncrease(6, AC_DODGE_BONUS);
                            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 6));
                            eLink1 = SetEffectIcon(eLink1, 7);
                            eLink2 = EffectVisualEffect(VFX_PRO_FORCE_ARMOR);
                            eLink2 = EffectLinkEffects(eLink2, EffectVisualEffect(VFX_PRO_FORCE_SHIELD));

                            Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                        }
                    }
                }
            }
            else if( GetSpellAcquired( FORCE_POWER_FORCE_SHIELD ) ) {

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_SHIELD );

                eLink1 = EffectACIncrease(4, AC_DODGE_BONUS);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 4));
                eLink1 = SetEffectIcon(eLink1, 12);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_SHIELD);

                float fDuration = Sp_CalcDuration( 20.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
                //  Will add this bonus to anyone else w/Force Chain for free.
                if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                    int index = 0;
                    for ( ; index < 3; ++index ) {
                        object oCharacter = GetPartyMemberByIndex(index);
                        if ( oCharacter != OBJECT_SELF
                             && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                             && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_SHIELD)) {
                             Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_SHIELD);


                            eLink1 = EffectACIncrease(4, AC_DODGE_BONUS);
                            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 4));
                            eLink1 = SetEffectIcon(eLink1, 12);
                            eLink2 = EffectVisualEffect(VFX_PRO_FORCE_SHIELD);

                            Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                        }
                    }
                }
            }
            else if( GetSpellAcquired( FORCE_POWER_FORCE_AURA ) ) {

                // Remove any lower level or equal versions of this power.
                Sp_RemoveRelatedPowers( OBJECT_SELF, FORCE_POWER_FORCE_AURA );

                eLink1 = EffectACIncrease(2, AC_DODGE_BONUS);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 2));
                eLink1 = SetEffectIcon(eLink1, 8);
                eLink2 = EffectVisualEffect(VFX_PRO_FORCE_AURA);

                float fDuration = Sp_CalcDuration( 20.0 );
                Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                //RWT-OEI 12//29/03 - Added support for the ForceChain FEAT
                //  Will add this bonus to anyone else w/Force Chain for free.
                if ( GetHasFeat(FEAT_FORCE_CHAIN, OBJECT_SELF) ) {
                    int index = 0;
                    for ( ; index < 3; ++index ) {
                        object oCharacter = GetPartyMemberByIndex(index);
                        if ( oCharacter != OBJECT_SELF
                             && GetHasFeat(FEAT_FORCE_CHAIN, oCharacter)
                             && !Sp_BetterRelatedPowerExists( oCharacter, FORCE_POWER_FORCE_AURA)) {
                             Sp_RemoveRelatedPowers( oCharacter, FORCE_POWER_FORCE_AURA);


                            eLink1 = EffectACIncrease(2, AC_DODGE_BONUS);
                            eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_ALL, 2));
                            eLink1 = SetEffectIcon(eLink1, 8);
                            eLink2 = EffectVisualEffect(VFX_PRO_FORCE_AURA);

                            Sp_ApplyEffects(FALSE, OBJECT_SELF, 0.0, 1, eLink1, fDuration, eLink2, 3.0);
                        }
                    }
                }
            }

            // Valor
            if( GetSpellAcquired( FORCE_POWER_MIND_MASTERY ) ) {

                eLink1 = EffectSavingThrowIncrease(SAVING_THROW_ALL,5);
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CHARISMA, 5));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 5));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_DEXTERITY, 5));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 5));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 5));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_WISDOM, 5));
                eLink1 = EffectLinkEffects(eLink1, EffectImmunity(IMMUNITY_TYPE_POISON));
                eLink1 = SetEffectIcon(eLink1, 21);
                eLink2 = EffectVisualEffect(VFX_IMP_MIND_MASTERY);

                // Get each creature within 30.0 units.
                object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
                while(GetIsObjectValid(oCreature))
                {
                    // This power targets party members only.
                    if( GetIsObjectValid(oCreature) && IsObjectPartyMember(oCreature) )
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_MIND_MASTERY );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_MIND_MASTERY ) ) {
                            SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                            float fDuration = Sp_CalcDuration( 20.0 );
                            Sp_ApplyForcePowerEffects(fDuration, eLink1, oCreature);
                            Sp_ApplyForcePowerEffects(0.0, eLink2, oCreature);
                        }
                    }
                    oCreature = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
                }
            }
            else if( GetSpellAcquired( FORCE_POWER_KNIGHT_MIND ) ) {

                eLink1 = EffectSavingThrowIncrease(SAVING_THROW_ALL,3);
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CHARISMA, 3));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 3));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_DEXTERITY, 3));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 3));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 3));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_WISDOM, 3));
                eLink1 = EffectLinkEffects(eLink1, EffectImmunity(IMMUNITY_TYPE_POISON));
                eLink1 = SetEffectIcon(eLink1, 19);
                eLink2 = EffectVisualEffect(1033);

                // Get each creature within 30.0 units.
                object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
                while(GetIsObjectValid(oCreature))
                {
                    // This power targets party members only.
                    if( GetIsObjectValid(oCreature) && IsObjectPartyMember(oCreature) )
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_KNIGHT_MIND );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_KNIGHT_MIND ) ) {
                            SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                            float fDuration = Sp_CalcDuration( 20.0 );
                            Sp_ApplyForcePowerEffects(fDuration, eLink1, oCreature);
                            Sp_ApplyForcePowerEffects(0.0, eLink2, oCreature);
                        }
                    }
                    oCreature = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
                }
            }
            else if( GetSpellAcquired( FORCE_POWER_FORCE_MIND ) ) {

                eLink1 = EffectSavingThrowIncrease(SAVING_THROW_FORT,2);
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectSavingThrowIncrease(SAVING_THROW_WILL, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CHARISMA, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_CONSTITUTION, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_DEXTERITY, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_STRENGTH, 2));
                eLink1 = EffectLinkEffects(eLink1, EffectAbilityIncrease(ABILITY_WISDOM, 2));
                eLink2 = EffectVisualEffect(VFX_IMP_MIND_FORCE);
                eLink1 = SetEffectIcon(eLink1, 10);

                // Get each creature within 30.0 units.
                object oCreature = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
                while(GetIsObjectValid(oCreature))
                {
                    // This power targets party members only.
                    if( GetIsObjectValid(oCreature) && IsObjectPartyMember(oCreature) )
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oCreature, FORCE_POWER_FORCE_MIND );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oCreature, FORCE_POWER_FORCE_MIND ) ) {
                            SignalEvent(oCreature, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                            float fDuration = Sp_CalcDuration( 20.0 );
                            Sp_ApplyForcePowerEffects(fDuration, eLink1, oCreature);
                            Sp_ApplyForcePowerEffects(0.0, eLink2, oCreature);
                        }
                    }
                    oCreature = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE );
                }
            }
        }
        break;

        // DJS-OEI 7/29/2004
        case FORCE_POWER_CONFUSION:
        {
            float fDuration = 0.0f;
            int nResist = 0;
            int nSaves = 0;

            // If an active instance of this spell is already
            // in progress, drop through to Mind Trick. The spell
            // will still cost the full amount, though. This should
            // only happen if the player cued a bunch of Confusion
            // castings instead of waiting for Mind Trick to replace
            // it in the interface.
            if( GetGlobalNumber( "000_Human_Conf_Active" ) == 0 ) {
                SWFP_HARMFUL = TRUE;
                SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

                if( GetPlotFlag( oTarget ) ) {
                    return;
                }

                // FAK - OEI 2/3/04 -- racial checks, DC checks
                if (GetRacialType(oTarget) == RACIAL_TYPE_DROID)
                {
                    return;
                }

                if (GetSubRace(oTarget) == 2)
                {
                    return;
                }

                eLink1 = EffectFactionModifier( STANDARD_FACTION_FRIENDLY_1 );

                nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);
                if(nResist == 0)
                {
                    nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves == 0)
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                            // Flag this spell as having been cast once already.
                            SetGlobalNumber( "000_Human_Conf_Active", 1 );

                            // If more than one casting is attempted, it will just
                            // drop through to Mind Trick.
                            fDuration = Sp_CalcDuration( 30.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                            break;
                        }
                    }
                }
                break;
            }
            else {
                // NO BREAK!!!
                // Drop through to Mind Trick.
            }
        }
        ///////////////////////////////////////////////////////////
        //
        // THERE IS NO BREAK HERE ON PURPOSE. FORCE CONFUSION CAN
        // DROP THROUGH TO MIND TRICK IF IT IS CAST AGAIN DURING
        // THE DURATION OF A PREVIOUS CASTING.
        //
        ///////////////////////////////////////////////////////////
        // DJS-OEI 7/28/2004
        case FORCE_POWER_MIND_TRICK:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            if( GetPlotFlag( oTarget ) ) {
                return;
            }

            // FAK - OEI 2/3/04 -- racial checks, DC checks
            if (GetRacialType(oTarget) == RACIAL_TYPE_DROID)
            {
                return;
            }

            if (GetSubRace(oTarget) == 2)
            {
                return;
            }

            eLink1 = EffectMindTrick();

            int nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);
            int nSaves;

            if(nResist == 0)
            {
                nSaves = Sp_MySavingThrows(oTarget);
                if(nSaves == 0)
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                        // In addition to the effect, turn the target away
                        // from the caster.
                        FaceObjectAwayFromObject( oTarget, OBJECT_SELF );
                        float fDuration = Sp_CalcDuration( 30.0 );
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9009), oTarget);
                    }
                }
            }
        }
        break;

        // DJS-OEI 7/30/2004
        case FORCE_POWER_BEAST_CONFUSION:
        {
            float fDuration = 0.0f;
            int nResist = 0;
            int nSaves = 0;

            // If an active instance of this spell is already
            // in progress, drop through to Beast Trick. The spell
            // will still cost the full amount, though. This should
            // only happen if the player cued a bunch of Confusion
            // castings instead of waiting for Beast Trick to replace
            // it in the interface.
            if( GetGlobalNumber( "000_Beast_Conf_Active" ) == 0 ) {
                SWFP_HARMFUL = TRUE;
                SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

                if( GetPlotFlag( oTarget ) ) {
                    return;
                }

                if (GetRacialType(oTarget) == RACIAL_TYPE_DROID)
                {
                    return;
                }

                // Only works on beasts.
                if (GetSubRace(oTarget) != 2)
                {
                    return;
                }

                eLink1 = EffectFactionModifier( STANDARD_FACTION_FRIENDLY_1 );

                nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);

                if(nResist == 0)
                {
                    nSaves = Sp_MySavingThrows(oTarget);
                    if(nSaves == 0)
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                            // Flag this spell as having been cast once already.
                            SetGlobalNumber( "000_Beast_Conf_Active", 1 );

                            // If more than one casting is attempted, it will just
                            // drop through to Mind Trick.
                            fDuration = Sp_CalcDuration( 30.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                            break;
                        }
                    }
                }
                break;
            }
            else {
                // NO BREAK!!!
                // Drop through to Beast Trick.
            }
        }
        ///////////////////////////////////////////////////////////
        //
        // THERE IS NO BREAK HERE ON PURPOSE. CONFUSION CAN
        // DROP THROUGH TO TRICK IF IT IS CAST AGAIN DURING
        // THE DURATION OF A PREVIOUS CASTING.
        //
        ///////////////////////////////////////////////////////////
        // DJS-OEI 7/30/2004
        case FORCE_POWER_BEAST_TRICK:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            if( GetPlotFlag( oTarget ) ) {
                return;
            }

            if (GetRacialType(oTarget) == RACIAL_TYPE_DROID)
            {
                return;
            }

            // Only works on beasts.
            if (GetSubRace(oTarget) != 2)
            {
                return;
            }

            eLink1 = EffectMindTrick();

            int nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);
            int nSaves;

            if(nResist == 0)
            {
                nSaves = Sp_MySavingThrows(oTarget);
                if(nSaves == 0)
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                        // In addition to the effect, turn the target away
                        // from the caster.
                        FaceObjectAwayFromObject( oTarget, OBJECT_SELF );
                        float fDuration = Sp_CalcDuration( 30.0 );
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9009), oTarget);
                    }
                }
            }
        }
        break;

        // DJS-OEI 7/30/2004
        case FORCE_POWER_DROID_CONFUSION:
        {
            float fDuration = 0.0f;
            int nResist = 0;
            int nSaves = 0;

            // If an active instance of this spell is already
            // in progress, drop through to Droid Trick. The spell
            // will still cost the full amount, though. This should
            // only happen if the player cued a bunch of Confusion
            // castings instead of waiting for Droid Trick to replace
            // it in the interface.
            if( GetGlobalNumber( "000_Droid_Conf_Active" ) == 0 ) {
                SWFP_HARMFUL = TRUE;
                SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

                if( GetPlotFlag( oTarget ) ) {
                    return;
                }

                if (GetRacialType(oTarget) != RACIAL_TYPE_DROID)
                {
                    return;
                }

                eLink1 = EffectFactionModifier( STANDARD_FACTION_FRIENDLY_1 );
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FORCE_WAVE), GetLocation(OBJECT_SELF));
//                effect eBeam = EffectBeam(2049, OBJECT_SELF, BODY_NODE_HAND);
//                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.0);

                //int nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);
                if(nResist == 0)
                {
                    int nDC = 5 + GetHitDice(OBJECT_SELF) + GetAbilityModifier( ABILITY_INTELLIGENCE );
                    nSaves = Sp_MySavingThrows(oTarget, nDC);
                    if(nSaves == 0)
                    {
                        // Remove any lower level or equal versions of this power.
                        Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                        // Do not apply the effects of this power if a more powerful
                        // version is already attached to the target.
                        if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                            // Flag this spell as having been cast once already.
                            SetGlobalNumber( "000_Droid_Conf_Active", 1 );

                            // If more than one casting is attempted, it will just
                            // drop through to Mind Trick.
                            fDuration = Sp_CalcDuration( 30.0 );
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                            break;
                        }
                    }
                }
                break;
            }
            else {
                // NO BREAK!!!
                // Drop through to Droid Trick.
            }
        }
        ///////////////////////////////////////////////////////////
        //
        // THERE IS NO BREAK HERE ON PURPOSE. CONFUSION CAN
        // DROP THROUGH TO TRICK IF IT IS CAST AGAIN DURING
        // THE DURATION OF A PREVIOUS CASTING.
        //
        ///////////////////////////////////////////////////////////
        // DJS-OEI 7/30/2004
        case FORCE_POWER_DROID_TRICK:
        {
            SWFP_HARMFUL = TRUE;
            SWFP_PRIVATE_SAVE_TYPE = SAVING_THROW_WILL;

            if( GetPlotFlag( oTarget ) ) {
                return;
            }

            if (GetRacialType(oTarget) != RACIAL_TYPE_DROID)
            {
                return;
            }

            eLink1 = EffectDroidScramble();
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FORCE_WAVE), GetLocation(OBJECT_SELF));
//            effect eBeam = EffectBeam(2049, OBJECT_SELF, BODY_NODE_HAND);
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.0);

            //int nResist = Sp_BlockingChecks(oTarget, eLink1, eInvalid, eInvalid);
            int nResist = 0;
            int nSaves;

            if(nResist == 0)
            {
                int nDC = 5 + GetHitDice(OBJECT_SELF) + GetAbilityModifier( ABILITY_INTELLIGENCE );
                nSaves = Sp_MySavingThrows(oTarget, nDC);
                if(nSaves == 0)
                {
                    // Remove any lower level or equal versions of this power.
                    Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

                    // Do not apply the effects of this power if a more powerful
                    // version is already attached to the target.
                    if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

                        // In addition to the effect, turn the target away
                        // from the caster.
                        FaceObjectAwayFromObject( oTarget, OBJECT_SELF );
                        float fDuration = Sp_CalcDuration( 30.0 );
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(9009), oTarget);
                    }
                }
            }
        }
        break;

        // DJS-OEI 8/15/2004
        case FORCE_POWER_BREATH_CONTROL:
        {
            SWFP_HARMFUL = FALSE;

            eLink1 = EffectImmunity(IMMUNITY_TYPE_POISON);
            eLink1 = SetEffectIcon(eLink1, 111);

            // Remove any lower level or equal versions of this power.
            Sp_RemoveRelatedPowers( oTarget, GetSpellId() );

            // Do not apply the effects of this power if a more powerful
            // version is already attached to the target.
            if( !Sp_BetterRelatedPowerExists( oTarget, GetSpellId() ) ) {

        // DJS-OEI 10/24/2004
        // Increased duration at QA's behest.
                //float fDuration = Sp_CalcDuration( 30.0 );
                float fDuration = Sp_CalcDuration( 240.0 );
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, fDuration);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(1015), oTarget, 3.0);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(2064), oTarget, fDuration);
            }
        }
        break;
    }

    // DJS-OEI 7/20/2004
    // Form/Stance re-design.
    /*
    // DJS-OEI 3/29/2004
    // If the designated target was using the Regeneration III
    // Consular Form, they get 20% of the base cost of the power
    // in FP.
    if( GetSpellFormMask( GetSpellId() ) & FORM_MASK_REGENERATION ) {
        object oSpellTarget = GetSpellTargetObject();
        if( GetIsObjectValid( oSpellTarget ) ) {
            if( IsFormActive( oSpellTarget, FORM_CONSULAR_REGENERATION_III ) ) {
                int nCost = ( GetSpellBaseForcePointCost( GetSpellId() ) * 20 ) / 100;
                eLink1 = EffectHealForcePoints( nCost );
                ApplyEffectToObject( DURATION_TYPE_INSTANT, eLink1, oSpellTarget );
            }
        }
    }
    */
}

//::///////////////////////////////////////////////
//:: While Loop Effect Delivery
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Uses these values to deliver the effects in the
    loop.

    SWFP_PRIVATE_SAVE_TYPE;
    SWFP_PRIVATE_SAVE_VERSUS_TYPE;
    SWFP_DAMAGE;
    SWFP_DAMAGE_TYPE;
    SWFP_DAMAGE_VFX;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 2, 2002
//:://////////////////////////////////////////////

void Sp_ApplyEffects(int nBlocking, object oAnchor, float fSize, int nCounter, effect eLink1, float fDuration1, effect eLink2, float fDuration2, int nRacial = RACIAL_TYPE_ALL)
{
    int nCnt = 0;
    object oTarget;
    //By setting the counter to 1 you specify a single target.
    //By setting the counter to 1000, you specify all targets in a shape.
    //By setting the counter to another number you specify that many targets maximum.
    if(nCounter > 1)
    {
        oTarget = GetFirstObjectInShape(SWFP_SHAPE, fSize, GetLocation(oAnchor));
    }
    else if(nCounter == 1)
    {
        oTarget = oAnchor;
    }
    while(GetIsObjectValid(oTarget) && nCnt < nCounter)
    {
        if(nRacial == GetRacialType(oTarget) || nRacial == RACIAL_TYPE_ALL)
        {
            int nIdx = 0; // Index for the for loop link application.
            effect eUse;  // Current effect to use
            float fUse;   // Current duration to use
            int nDamage;  // The damage as set from SWFP_DAMAGE
            int bFizzle;  // Tracks whether the Fizzle has played on the caster yet or not.
            effect eDamage; // The damage effect which will be linked after the saves are done and checked with blocking.
            if((GetIsEnemy(oTarget) && SWFP_HARMFUL == TRUE) || (GetIsFriend(oTarget) && SWFP_HARMFUL == FALSE))
            {
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), SWFP_HARMFUL));
                //eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                int nResist = FALSE;
                int nSaves = -1;
                if(SWFP_HARMFUL == TRUE)
                {
                    nResist = Sp_BlockingChecks(oTarget, eLink1, eLink2, eDamage);
                }
                //By adding another index the number of links added to this function can increase.
                for(nIdx; nIdx <= 1; nIdx++)
                {
                    if(nIdx == 0)
                    {
                        eUse = eLink1;
                        fUse = fDuration1;
                    }
                    else
                    {
                        eUse = eLink2;
                        fUse = fDuration2;
                    }
                    if(nResist == FALSE)
                    {
                        //MODIFIED by Preston Watamaniuk March 23
                         //Moved the save call down to here from up above with the resist inorder to help
                         //feedback system not make useless save calls.
                        //MODIFIED by Preston Watamaniuk March 24
                         //Made the default value of nSave -1 so that I only do it once.
                        //MODIFIED by Preston Watamaniuk April 5
                         //Made sure to set nSaves to FALSE so that it would fall through the function.
                        if(SWFP_HARMFUL == TRUE && nSaves == -1)
                        {
                            nSaves = Sp_MySavingThrows(oTarget);
                        }
                        else
                        {
                            nSaves = FALSE;
                        }
                        if(nSaves == FALSE)
                        {
                            if(nIdx == 1 && SWFP_DAMAGE > 0)
                            //Damage effects are always linked to the eDamage effect which is kept seperate from
                            //all other eLink types coming in.
                            {
                                eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                                eDamage = EffectLinkEffects(eDamage, EffectVisualEffect(SWFP_DAMAGE_VFX));
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                            }
                            if(GetIsEffectValid(eUse))
                            {
                                Sp_ApplyForcePowerEffects(fUse, eUse, oTarget);
                            }
                        }
                        //If the blocking flag is true then do not apply any effects on a save.
                        else if(nSaves > 0 && nBlocking == FALSE)
                        {
                            if(nIdx == 1 && SWFP_DAMAGE > 0)
                            {
                                SWFP_DAMAGE /= 2;
                                eDamage = EffectDamage(SWFP_DAMAGE, SWFP_DAMAGE_TYPE);
                                eDamage = EffectLinkEffects(eDamage, EffectVisualEffect(SWFP_DAMAGE_VFX));
                                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                            }
                            if(GetIsEffectValid(eUse))
                            {
                                Sp_ApplyForcePowerEffects(fUse, eUse, oTarget);
                            }
                        }
                    }
                    if(nResist > 0 || (nSaves > 0 && nBlocking > 0))
                    {
                        if(bFizzle == FALSE)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectForceFizzle(), OBJECT_SELF);
                            bFizzle = TRUE;
                        }
                    }
                }
                nCnt++;
            }
        }
        oTarget = GetNextObjectInShape(SWFP_SHAPE, fSize, GetLocation(oAnchor), FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
    }
}

//::///////////////////////////////////////////////
//:: Remove Buff Bonuses
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through and removes all of the bonuses
    from people in a 30m radius from Force Mind,
    Knight Mind, Mind Mastery and Battle Meditation
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 7, 2002
//:://////////////////////////////////////////////
void Sp_RemoveBuffSpell()
{
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF));
    while(GetIsObjectValid(oTarget))
    {
        if(GetFactionEqual(oTarget))
        {
            //Declare major variables
            int bValid = FALSE;
            effect eAOE;
            if(GetHasSpellEffect(FORCE_POWER_FORCE_MIND, oTarget) ||
               GetHasSpellEffect(FORCE_POWER_MIND_MASTERY, oTarget) ||
               GetHasSpellEffect(FORCE_POWER_KNIGHT_MIND, oTarget) ||
               GetHasSpellEffect(SPECIAL_ABILITY_BATTLE_MEDITATION, oTarget))
            {
                //Search through the valid effects on the target.
                eAOE = GetFirstEffect(oTarget);
                while (GetIsEffectValid(eAOE) && bValid == FALSE)
                {
                    //If the effect was created by the spell then remove it
                    if(GetEffectSpellId(eAOE) == FORCE_POWER_FORCE_MIND ||
                       GetEffectSpellId(eAOE) == FORCE_POWER_MIND_MASTERY ||
                       GetEffectSpellId(eAOE) == FORCE_POWER_KNIGHT_MIND ||
                       GetEffectSpellId(eAOE) == SPECIAL_ABILITY_BATTLE_MEDITATION)
                    {
                        RemoveEffect(oTarget, eAOE);
                    }
                    //Get next effect on the target
                    eAOE = GetNextEffect(oTarget);
                }
            }
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF));
    }
}

//::///////////////////////////////////////////////
//:: Check for Appearance Type Turret
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the target is a Turret
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int SP_CheckAppearanceTurret(object oTarget, int nFeedback = FALSE)
{
    int nCheck = FALSE;

    SP_MyPostString("Appearance = " + IntToString(GetAppearanceType(oTarget)));

    // DJS-OEI 10/24/2004
    // Added some new Turret types.
    if(GetAppearanceType(oTarget) == 182 ||
       GetAppearanceType(oTarget) == 183 ||
       GetAppearanceType(oTarget) == 640 ||
       GetAppearanceType(oTarget) == 657 )
    {
        if(nFeedback == TRUE)
        {
            DisplayFeedBackText(oTarget, 1);
        }
        nCheck = TRUE;
    }
    return nCheck;
}

//::///////////////////////////////////////////////
//:: Check Droid Appearance Type
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the target is a Mark 1, 2, 4
    or Spyder Droid
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int SP_CheckAppearanceGeoDroid(object oTarget)
{
    int nCheck = FALSE;
    if(GetAppearanceType(oTarget) == 59 ||
       GetAppearanceType(oTarget) == 60 ||
       GetAppearanceType(oTarget) == 61 ||
       GetAppearanceType(oTarget) == 65)
    {
        nCheck = TRUE;
    }
    return nCheck;
}

//::///////////////////////////////////////////////
//:: Check Droid Appearance Type and and Shields
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the target is a Mark 1, 2, 4
    or Spyder Droid and has a shield activated
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////
int SP_CheckAppearanceGeoDroidShields(object oTarget, int nFeedback = FALSE)
{
    int nCheck = FALSE;
    if(GetAppearanceType(oTarget) == 59 ||
       GetAppearanceType(oTarget) == 60 ||
       GetAppearanceType(oTarget) == 61 ||
       GetAppearanceType(oTarget) == 65)
    {
        if(GetHasSpellEffect(110, oTarget) ||
           GetHasSpellEffect(111, oTarget) ||
           GetHasSpellEffect(112, oTarget) ||
           GetHasSpellEffect(113, oTarget) ||
           GetHasSpellEffect(114, oTarget) ||
           GetHasSpellEffect(115, oTarget))
         {
            if(nFeedback == TRUE)
            {
                DisplayFeedBackText(oTarget, 1);
            }

            nCheck = TRUE;
         }
    }
    return nCheck;
}

//::///////////////////////////////////////////////
//:: Force Push Viability
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the target can be force pushed
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2003
//:://////////////////////////////////////////////
int SP_CheckForcePushViability(object oTarget, int Whirlwind)
{
    int bValid = FALSE;

    SP_MyPrintString("Push Check Start");
    if(GetCreatureSize(oTarget) != CREATURE_SIZE_LARGE &&
       GetCreatureSize(oTarget) != CREATURE_SIZE_HUGE)
    {
        SP_MyPrintString("Size is OK");
        if(SP_CheckAppearanceTurret(oTarget) == FALSE)
        {
            SP_MyPrintString("I am not a turret");
            if((Whirlwind == TRUE && SP_CheckAppearanceGeoDroidShields(oTarget) == FALSE) ||
                Whirlwind == FALSE)
            {
                SP_MyPrintString("I am whirlwind without droid shiled or not whirlwind");
                if(GetCreatureMovmentType(oTarget) != MOVEMENT_SPEED_IMMOBILE)
                {
                    SP_MyPrintString("Returning Push True");
                    bValid = TRUE;
                }
            }
        }
    }

    if(bValid == FALSE)
    {
        DisplayFeedBackText(oTarget, 1);
    }
    return bValid;
}


void SP_MyPrintString(string sString)
{
    if(!ShipBuild())
    {
        sString = "SPELL GENERIC DEBUG STRING: " + sString;
        PrintString(sString);
    }
}

void SP_MyPostString(string sString, int n1 = 5, int n2 = 10, float fTime = 4.0)
{
    sString = "DEBUG: " + sString;
    AurPostString(sString,10,10,3.0);
}

void Sp_RemoveRelatedPowersInRadius( int nPowerID, float nRadius ) {

    // DJS-OEI 12/10/2003
    // This function makes use of the Sp_RemoveRelatedPowers()
    // function to allow removal of lesser related powers on multiple
    // targets in a radius. These targets must be of the same
    // faction as the caster (OBJECT_SELF). This may need to be
    // changed if/when new force powers are created that require
    // ranged removal versus enemies.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, nRadius, GetLocation(OBJECT_SELF));
    while(GetIsObjectValid(oTarget))
    {
        if(GetFactionEqual(oTarget))
        {
            Sp_RemoveRelatedPowers( oTarget, nPowerID );
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, nRadius, GetLocation(OBJECT_SELF));
    }
}

void Sp_RemoveRelatedPowers( object oTarget, int nPowerID )
{
    // DJS-OEI 12/9/2003
    // Given a Force Power ID, remove all equal and
    // lesser Force Powers that are part of the same
    // Force Power tree from the target object.

    int nRelatedPowerID1 = -1;
    int nRelatedPowerID2 = -1;
    int nRelatedPowerID3 = -1;
    int nRelatedPowerID4 = -1;
    int nRelatedPowerID5 = -1;
    int nRelatedPowerID6 = -1;
    switch ( nPowerID )
    {
        // Slow/Affliction/Plague tree
        case FORCE_POWER_SLOW:
            // Remove all other Slow Force Power instances.
            nRelatedPowerID1 = FORCE_POWER_SLOW;
            break;
        case FORCE_POWER_AFFLICTION:
            // Remove all Slow Force Power and Affliction
            // Force Power instances.
            nRelatedPowerID1 = FORCE_POWER_SLOW;
            nRelatedPowerID2 = FORCE_POWER_AFFLICTION;
            break;
        case FORCE_POWER_PLAGUE:
            // Remove all Slow Force Power, Affliction
            // Force Power, and Plague Force Power instances.
            nRelatedPowerID1 = FORCE_POWER_SLOW;
            nRelatedPowerID2 = FORCE_POWER_AFFLICTION;
            nRelatedPowerID3 = FORCE_POWER_PLAGUE;
            break;

        // Force Aura/Force Shield/Force Armor tree
        case FORCE_POWER_FORCE_AURA:
            // Remove all other Force Aura instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_AURA;
            break;
        case FORCE_POWER_FORCE_SHIELD:
            // Remove all Force Aura and Force Shield instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_AURA;
            nRelatedPowerID2 = FORCE_POWER_FORCE_SHIELD;
            break;
        case FORCE_POWER_FORCE_ARMOR:
            // Remove all Force Aura, Force Shield,
            // and Force Armor instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_AURA;
            nRelatedPowerID2 = FORCE_POWER_FORCE_SHIELD;
            nRelatedPowerID3 = FORCE_POWER_FORCE_ARMOR;
            break;

        // Resist Force/Force Immunity tree
        case FORCE_POWER_RESIST_FORCE:
            // Remove all Resist Force instances.
            nRelatedPowerID1 = FORCE_POWER_RESIST_FORCE;
            break;
        case FORCE_POWER_FORCE_IMMUNITY:
            // Remove all Resist Force and Force Immunity instances.
            nRelatedPowerID1 = FORCE_POWER_RESIST_FORCE;
            nRelatedPowerID2 = FORCE_POWER_FORCE_IMMUNITY;
            break;

        // Force Valor/Knight Valor/Master Valor tree
        case FORCE_POWER_FORCE_MIND:
            // Remove all other Force Valor instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_MIND;
            break;
        case FORCE_POWER_KNIGHT_MIND:
            // Remove all Force Valor and Knight Valor instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_MIND;
            nRelatedPowerID2 = FORCE_POWER_KNIGHT_MIND;
            break;
        case FORCE_POWER_MIND_MASTERY:
            // Remove all Force Valor, Knight Valor,
            // and Master Valor instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_MIND;
            nRelatedPowerID2 = FORCE_POWER_KNIGHT_MIND;
            nRelatedPowerID3 = FORCE_POWER_MIND_MASTERY;
            break;

        // Energy Resistance/Improved Energy Resistance/Master Energy Resistance tree
        case FORCE_POWER_RESIST_POISON_DISEASE_SONIC:
            // Remove all other Energy Resistance instances.
            nRelatedPowerID1 = FORCE_POWER_RESIST_POISON_DISEASE_SONIC;
            break;
        case FORCE_POWER_RESIST_COLD_HEAT_ENERGY:
            // Remove all Energy Resistance and Improved
            // Energy Resistance instances.
            nRelatedPowerID1 = FORCE_POWER_RESIST_POISON_DISEASE_SONIC;
            nRelatedPowerID2 = FORCE_POWER_RESIST_COLD_HEAT_ENERGY;
            break;
        case FORCE_POWER_MASTER_ENERGY_RESISTANCE:
            // Remove all Energy Resistance, Improved Energy Resistance,
            // and Master Energy Resistance instances.
            nRelatedPowerID1 = FORCE_POWER_RESIST_POISON_DISEASE_SONIC;
            nRelatedPowerID2 = FORCE_POWER_RESIST_COLD_HEAT_ENERGY;
            nRelatedPowerID3 = FORCE_POWER_MASTER_ENERGY_RESISTANCE;
            break;

        // Stun/Stasis/Stasis Field tree
        case FORCE_POWER_STUN:
            // Remove all other Stun instances.
            nRelatedPowerID1 = FORCE_POWER_STUN;
            break;
        case FORCE_POWER_HOLD:
            // Remove all Stun and Stasis instances.
            nRelatedPowerID1 = FORCE_POWER_STUN;
            nRelatedPowerID2 = FORCE_POWER_HOLD;
            break;
        case FORCE_POWER_SLEEP:
            // Remove all Stun, Stasis, and Stasis Field instances.
            nRelatedPowerID1 = FORCE_POWER_STUN;
            nRelatedPowerID2 = FORCE_POWER_HOLD;
            nRelatedPowerID3 = FORCE_POWER_SLEEP;
            break;

        // Burst of Speed/Knight Speed/Master Speed tree
        case FORCE_POWER_SPEED_BURST:
            // Remove all other Burst of Speed instances.
            nRelatedPowerID1 = FORCE_POWER_SPEED_BURST;
            break;
        case FORCE_POWER_KNIGHT_SPEED:
            // Remove all Burst of Speed and Knight Speed instances.
            nRelatedPowerID1 = FORCE_POWER_SPEED_BURST;
            nRelatedPowerID2 = FORCE_POWER_KNIGHT_SPEED;
            break;
        case FORCE_POWER_SPEED_MASTERY:
            // Remove all Burst of Speed, Knight Speed, and
            // Master Speed instances.
            nRelatedPowerID1 = FORCE_POWER_SPEED_BURST;
            nRelatedPowerID2 = FORCE_POWER_KNIGHT_SPEED;
            nRelatedPowerID3 = FORCE_POWER_SPEED_MASTERY;
            break;

        // Force Barrier/Improved Barrier/Master Barrier tree
        case FORCE_POWER_FORCE_BARRIER:
            // Remove all other Force Barrier instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_BARRIER;
            break;
        case FORCE_POWER_IMPROVED_FORCE_BARRIER:
            // Remove all Force Barrier and Improved
            // Force Barrier instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_BARRIER;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FORCE_BARRIER;
            break;
        case FORCE_POWER_MASTER_FORCE_BARRIER:
            // Remove all Force Barrier, Improved Force
            // Barrier, and Master Barrier instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_BARRIER;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FORCE_BARRIER;
            nRelatedPowerID3 = FORCE_POWER_MASTER_FORCE_BARRIER;
            break;

        // Battle Meditation PC/Improved Battle Meditation PC/Master Battle Meditation PC tree
        case FORCE_POWER_BATTLE_MEDITATION_PC:
            // Remove all other Battle Meditation PC instances.
            nRelatedPowerID1 = FORCE_POWER_BATTLE_MEDITATION_PC;
            break;
        case FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC:
            // Remove all Battle Meditation PC and Improved
            // Battle Meditation PC instances.
            nRelatedPowerID1 = FORCE_POWER_BATTLE_MEDITATION_PC;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC;
            break;
        case FORCE_POWER_MASTER_BATTLE_MEDITATION_PC:
            // Remove all Battle Meditation PC, Improved Battle
            // Meditation PC, and Master Battle Meditation PC instances.
            nRelatedPowerID1 = FORCE_POWER_BATTLE_MEDITATION_PC;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC;
            nRelatedPowerID3 = FORCE_POWER_MASTER_BATTLE_MEDITATION_PC;
            break;

        // Battle Meditation Enemy/Improved Battle Meditation Enemy/Master Battle Meditation Enemy tree
        case FORCE_POWER_BAT_MED_ENEMY:
            // Remove all other Battle Meditation Enemy instances.
            nRelatedPowerID1 = FORCE_POWER_BAT_MED_ENEMY;
            break;
        case FORCE_POWER_IMP_BAT_MED_ENEMY:
            // Remove all Battle Meditation Enemy and Improved
            // Battle Meditation Enemy instances.
            nRelatedPowerID1 = FORCE_POWER_BAT_MED_ENEMY;
            nRelatedPowerID2 = FORCE_POWER_IMP_BAT_MED_ENEMY;
            break;
        case FORCE_POWER_MAS_BAT_MED_ENEMY:
            // Remove all Battle Meditation Enemy, Improved Battle
            // Meditation Enemy, and Master Battle Meditation Enemy instances.
            nRelatedPowerID1 = FORCE_POWER_BAT_MED_ENEMY;
            nRelatedPowerID2 = FORCE_POWER_IMP_BAT_MED_ENEMY;
            nRelatedPowerID3 = FORCE_POWER_MAS_BAT_MED_ENEMY;
            break;

        // Crush Opposition Tree
        case FORCE_POWER_CRUSH_OPPOSITION_I:
            // Remove all other Crush Opposition I instances.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_I;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_II:
            // Remove all other Crush Opposition I/II instances.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_I;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_II;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_III:
            // Remove all other Crush Opposition I/II/III instances.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_I;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_II;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_III;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_IV:
            // Remove all other Crush Opposition I/II/III/IV instances.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_I;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_II;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_III;
            nRelatedPowerID4 = FORCE_POWER_CRUSH_OPPOSITION_IV;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_V:
            // Remove all other Crush Opposition I/II/III/IV/V instances.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_I;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_II;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_III;
            nRelatedPowerID4 = FORCE_POWER_CRUSH_OPPOSITION_IV;
            nRelatedPowerID5 = FORCE_POWER_CRUSH_OPPOSITION_V;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_VI:
            // Remove all other Crush Opposition I/II/III/IV/V/VI instances.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_I;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_II;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_III;
            nRelatedPowerID4 = FORCE_POWER_CRUSH_OPPOSITION_IV;
            nRelatedPowerID5 = FORCE_POWER_CRUSH_OPPOSITION_V;
            nRelatedPowerID6 = FORCE_POWER_CRUSH_OPPOSITION_VI;
            break;

        // DJS-OEI 12/15/2003
        // Force Body Tree
        case FORCE_POWER_FORCE_BODY:
            // Remove all other Force Body instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_BODY;
            break;
        case FORCE_POWER_IMPROVED_FORCE_BODY:
            // Remove all other Force Body and Improved Force
            // Body instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_BODY;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FORCE_BODY;
            break;
        case FORCE_POWER_MASTER_FORCE_BODY:
            // Remove all other Force Body, Improved Force Body
            // and Master Force Body instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_BODY;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FORCE_BODY;
            nRelatedPowerID3 = FORCE_POWER_MASTER_FORCE_BODY;
            break;

        // DJS-OEI 12/31/2003
        // Force Scream Tree
        case FORCE_POWER_FORCE_SCREAM:
            // Remove all other Force Scream instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_SCREAM;
            break;
        case FORCE_POWER_IMPROVED_FORCE_SCREAM:
            // Remove all other Force Scream and Improved Force
            // Scream instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_SCREAM;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FORCE_SCREAM;
            break;
        case FORCE_POWER_MASTER_FORCE_SCREAM:
            // Remove all other Force Scream, Improved Force Scream
            // and Master Force Scream instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_SCREAM;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FORCE_SCREAM;
            nRelatedPowerID3 = FORCE_POWER_MASTER_FORCE_SCREAM;
            break;

        // DJS-OEI 1/2/2004
        // Fury Tree
        case FORCE_POWER_FURY:
            // Remove all other Fury instances.
            nRelatedPowerID1 = FORCE_POWER_FURY;
            break;
        case FORCE_POWER_IMPROVED_FURY:
            // Remove all other Fury and Improved Fury
            // instances.
            nRelatedPowerID1 = FORCE_POWER_FURY;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FURY;
            break;
        case FORCE_POWER_MASTER_FURY:
            // Remove all other Fury, Improved Fury
            // and Master Fury instances.
            nRelatedPowerID1 = FORCE_POWER_FURY;
            nRelatedPowerID2 = FORCE_POWER_IMPROVED_FURY;
            nRelatedPowerID3 = FORCE_POWER_MASTER_FURY;
            break;

        // DJS-OEI 8/20/2004
        case FORCE_POWER_WOOKIEE_RAGE_I:
            // Remove all other Rage instances.
            nRelatedPowerID1 = FORCE_POWER_WOOKIEE_RAGE_I;
            break;
        case FORCE_POWER_WOOKIEE_RAGE_II:
            // Remove all other Rage and Rage II
            // instances.
            nRelatedPowerID1 = FORCE_POWER_WOOKIEE_RAGE_I;
            nRelatedPowerID2 = FORCE_POWER_WOOKIEE_RAGE_II;
            break;
        case FORCE_POWER_WOOKIEE_RAGE_III:
            // Remove all other Rage, Rage II, and Rage III.
            nRelatedPowerID1 = FORCE_POWER_WOOKIEE_RAGE_I;
            nRelatedPowerID2 = FORCE_POWER_WOOKIEE_RAGE_II;
            nRelatedPowerID3 = FORCE_POWER_WOOKIEE_RAGE_III;
            break;

        // Inspire Followers Tree
        case FORCE_POWER_INSPIRE_FOLLOWERS_I:
            // Remove all other Inspire Followers I instances.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_I;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_II:
            // Remove all other Inspire Followers I/II instances.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_I;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_II;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_III:
            // Remove all other Inspire Followers I/II/III instances.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_I;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_II;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_III;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_IV:
            // Remove all other Inspire Followers I/II/III/IV instances.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_I;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_II;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_III;
            nRelatedPowerID4 = FORCE_POWER_INSPIRE_FOLLOWERS_IV;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_V:
            // Remove all other Inspire Followers I/II/III/IV/V instances.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_I;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_II;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_III;
            nRelatedPowerID4 = FORCE_POWER_INSPIRE_FOLLOWERS_IV;
            nRelatedPowerID5 = FORCE_POWER_INSPIRE_FOLLOWERS_V;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_VI:
            // Remove all other Inspire Followers I/II/III/IV/V/VI instances.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_I;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_II;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_III;
            nRelatedPowerID4 = FORCE_POWER_INSPIRE_FOLLOWERS_IV;
            nRelatedPowerID5 = FORCE_POWER_INSPIRE_FOLLOWERS_V;
            nRelatedPowerID6 = FORCE_POWER_INSPIRE_FOLLOWERS_VI;
            break;

        case FORCE_POWER_MIND_TRICK:
            // Remove all other Mind Trick instances.
            nRelatedPowerID1 = FORCE_POWER_MIND_TRICK;
            break;
        case FORCE_POWER_CONFUSION:
            // Remove all other Mind Trick and Force Confusion
            // instance.
            nRelatedPowerID1 = FORCE_POWER_MIND_TRICK;
            nRelatedPowerID2 = FORCE_POWER_CONFUSION;
            break;

        case FORCE_POWER_BEAST_TRICK:
            // Remove all other Beast Trick instances.
            nRelatedPowerID1 = FORCE_POWER_BEAST_TRICK;
            break;
        case FORCE_POWER_BEAST_CONFUSION:
            // Remove all other Beast Trick and Beast Confusion
            // instance.
            nRelatedPowerID1 = FORCE_POWER_BEAST_TRICK;
            nRelatedPowerID2 = FORCE_POWER_BEAST_CONFUSION;
            break;

        case FORCE_POWER_DROID_TRICK:
            // Remove all other Droid Trick instances.
            nRelatedPowerID1 = FORCE_POWER_DROID_TRICK;
            break;
        case FORCE_POWER_DROID_CONFUSION:
            // Remove all other Droid Trick and Droid Confusion
            // instance.
            nRelatedPowerID1 = FORCE_POWER_DROID_TRICK;
            nRelatedPowerID2 = FORCE_POWER_DROID_CONFUSION;
            break;

        case FORCE_POWER_FORCE_ENLIGHTENMENT:
            // Remove all other Force Enlightenment instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_ENLIGHTENMENT;
            break;

        case FORCE_POWER_FORCE_SIGHT:
            // Remove all other Force Sight instances.
            nRelatedPowerID1 = FORCE_POWER_FORCE_SIGHT;
            break;

        case FORCE_POWER_BREATH_CONTROL:
            // Remove all other Breath Control instances.
            nRelatedPowerID1 = FORCE_POWER_BREATH_CONTROL;
            break;

        case 131:
            // Remove all other Sonic Howl instances.
            nRelatedPowerID1 = 131;

        default:
            return;
    }

    // Check to see if the target has any of the Force Power
    // effects we want to delete.
    effect eRelatedEffect;
    if( GetHasSpellEffect(nRelatedPowerID1, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID2, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID3, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID4, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID5, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID6, oTarget) )
    {
        // Search through the valid effects on the target
        // for those that match the requested related powers.
        eRelatedEffect = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eRelatedEffect))
        {
            // If the effect was created by one of the related Force Powers
            // we want to delete, remove the effect.
            if( GetEffectSpellId(eRelatedEffect) == nRelatedPowerID1 ||
                GetEffectSpellId(eRelatedEffect) == nRelatedPowerID2 ||
                GetEffectSpellId(eRelatedEffect) == nRelatedPowerID3 ||
                GetEffectSpellId(eRelatedEffect) == nRelatedPowerID4 ||
                GetEffectSpellId(eRelatedEffect) == nRelatedPowerID5 ||
                GetEffectSpellId(eRelatedEffect) == nRelatedPowerID6 )
            {
                RemoveEffect(oTarget, eRelatedEffect);
            }
            //Get next effect on the target
            eRelatedEffect = GetNextEffect(oTarget);
        }
    }
}

int Sp_BetterRelatedPowerExists( object oTarget, int nPowerID )
{
    // DJS-OEI 12/9/2003
    // Given a Force Power ID, this function will return
    // whether or not a more powerful version of the power
    // from the same Force Power tree is already applied to
    // the target object.
    int bBetterExists = 0;

    int nRelatedPowerID1 = -1;
    int nRelatedPowerID2 = -1;
    int nRelatedPowerID3 = -1;
    int nRelatedPowerID4 = -1;
    int nRelatedPowerID5 = -1;
    int nRelatedPowerID6 = -1;
    switch ( nPowerID )
    {
        // Slow/Affliction/Plague tree
        case FORCE_POWER_SLOW:
            // Affliction and Plague are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_AFFLICTION;
            nRelatedPowerID2 = FORCE_POWER_PLAGUE;
            break;
        case FORCE_POWER_AFFLICTION:
            // Plague is more powerful and part of the
            // same tree.
            nRelatedPowerID1 = FORCE_POWER_PLAGUE;
            break;

        // Force Aura/Force Shield/Force Armor tree
        case FORCE_POWER_FORCE_AURA:
            // Force Shield and Force Armor are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_FORCE_SHIELD;
            nRelatedPowerID2 = FORCE_POWER_FORCE_ARMOR;
            break;
        case FORCE_POWER_FORCE_SHIELD:
            // Force Armor is more powerful and part of the
            // same tree.
            nRelatedPowerID1 = FORCE_POWER_FORCE_ARMOR;
            break;

        // Resist Force/Force Immunity tree
        case FORCE_POWER_RESIST_FORCE:
            // Force Immunity is more powerful and part of the
            // same tree.
            nRelatedPowerID1 = FORCE_POWER_FORCE_IMMUNITY;
            break;

        // Force Valor/Knight Valor/Master Valor tree
        case FORCE_POWER_FORCE_MIND:
            // Knight Valor and Master Valor are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_KNIGHT_MIND;
            nRelatedPowerID2 = FORCE_POWER_MIND_MASTERY;
            break;
        case FORCE_POWER_KNIGHT_MIND:
            // Master Valor is more powerful and part of the
            // same tree.
            nRelatedPowerID1 = FORCE_POWER_MIND_MASTERY;
            break;

        // Energy Resistance/Improved Energy Resistance/Master Energy Resistance tree
        case FORCE_POWER_RESIST_POISON_DISEASE_SONIC:
            // Improved Energy Resistance and Master Energy Resistance are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_RESIST_COLD_HEAT_ENERGY;
            nRelatedPowerID2 = FORCE_POWER_MASTER_ENERGY_RESISTANCE;
            break;
        case FORCE_POWER_RESIST_COLD_HEAT_ENERGY:
            // Master Energy Resistance is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MASTER_ENERGY_RESISTANCE;
            break;

        // Stun/Stasis/Stasis Field tree
        case FORCE_POWER_STUN:
            // Stasis and Stasis are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_HOLD;
            nRelatedPowerID2 = FORCE_POWER_SLEEP;
            break;
        case FORCE_POWER_HOLD:
            // Stasis Field is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_SLEEP;
            break;

        // Burst of Speed/Knight Speed/Master Speed tree
        case FORCE_POWER_SPEED_BURST:
            // Knight Speed and Master Speed are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_KNIGHT_SPEED;
            nRelatedPowerID2 = FORCE_POWER_SPEED_MASTERY;
            break;
        case FORCE_POWER_KNIGHT_SPEED:
            // Master Speed is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_SPEED_MASTERY;
            break;

        // Force Barrier/Improved Barrier/Master Barrier tree
        case FORCE_POWER_FORCE_BARRIER:
            // Improved Barrier and Master Barrier are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_IMPROVED_FORCE_BARRIER;
            nRelatedPowerID2 = FORCE_POWER_MASTER_FORCE_BARRIER;
            break;
        case FORCE_POWER_IMPROVED_FORCE_BARRIER:
            // Master Barrier is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MASTER_FORCE_BARRIER;
            break;

        // Battle Meditation PC/Improved Battle Meditation PC/Master Battle Meditation PC tree
        case FORCE_POWER_BATTLE_MEDITATION_PC:
            // Improved Battle Meditation PC and Master Battle Meditation PC are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC;
            nRelatedPowerID2 = FORCE_POWER_MASTER_BATTLE_MEDITATION_PC;
            break;
        case FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC:
            // Master Battle Meditation PC is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MASTER_BATTLE_MEDITATION_PC;
            break;

        // Battle Meditation Enemy/Improved Battle Meditation EnemyMaster Battle Meditation Enemy tree
        case FORCE_POWER_BAT_MED_ENEMY:
            // Improved Battle Meditation Enemy and Master Battle Meditation Enemy are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_IMP_BAT_MED_ENEMY;
            nRelatedPowerID2 = FORCE_POWER_MAS_BAT_MED_ENEMY;
            break;
        case FORCE_POWER_IMP_BAT_MED_ENEMY:
            // Master Battle Meditation Enemy is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MAS_BAT_MED_ENEMY;
            break;

        // Crush Opposition Tree
        case FORCE_POWER_CRUSH_OPPOSITION_I:
            // Crush Opposition II/III/IV/V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_II;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_III;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_IV;
            nRelatedPowerID4 = FORCE_POWER_CRUSH_OPPOSITION_V;
            nRelatedPowerID5 = FORCE_POWER_CRUSH_OPPOSITION_VI;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_II:
            // Crush Opposition III/IV/V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_III;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_IV;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_V;
            nRelatedPowerID4 = FORCE_POWER_CRUSH_OPPOSITION_VI;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_III:
            // Crush Opposition IV/V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_IV;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_V;
            nRelatedPowerID3 = FORCE_POWER_CRUSH_OPPOSITION_VI;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_IV:
            // Crush Opposition V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_V;
            nRelatedPowerID2 = FORCE_POWER_CRUSH_OPPOSITION_VI;
            break;
        case FORCE_POWER_CRUSH_OPPOSITION_V:
            // Crush Opposition VI is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_CRUSH_OPPOSITION_VI;
            break;

        // Force Body/Improved Body/Master Body tree
        case FORCE_POWER_FORCE_BODY:
            // Improved Body and Master Body are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_IMPROVED_FORCE_BODY;
            nRelatedPowerID2 = FORCE_POWER_MASTER_FORCE_BODY;
            break;
        case FORCE_POWER_IMPROVED_FORCE_BODY:
            // Master Body is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MASTER_FORCE_BODY;
            break;

        // DJS-OEI 12/31/2003
        // Force Scream/Improved Force Scream/Master Force Scream
        case FORCE_POWER_FORCE_SCREAM:
            // Improved Scream and Master Scream are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_IMPROVED_FORCE_SCREAM;
            nRelatedPowerID2 = FORCE_POWER_MASTER_FORCE_SCREAM;
            break;
        case FORCE_POWER_IMPROVED_FORCE_SCREAM:
            // Master Scream is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MASTER_FORCE_SCREAM;
            break;

        // DJS-OEI 1/2/2004
        // Fury Tree
        case FORCE_POWER_FURY:
            // Improved Fury and Scream Body are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_IMPROVED_FURY;
            nRelatedPowerID2 = FORCE_POWER_MASTER_FURY;
            break;
        case FORCE_POWER_IMPROVED_FURY:
            // Master Fury is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_MASTER_FURY;
            break;

        // DJS-OEI 8/20/2004
        // Rage Tree
        case FORCE_POWER_WOOKIEE_RAGE_I:
            // Rage II and Rage III are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_WOOKIEE_RAGE_II;
            nRelatedPowerID2 = FORCE_POWER_WOOKIEE_RAGE_III;
            break;
        case FORCE_POWER_WOOKIEE_RAGE_II:
            // Rage III is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_WOOKIEE_RAGE_III;
            break;

        // Inspire Followers Tree
        case FORCE_POWER_INSPIRE_FOLLOWERS_I:
            // Inspire Followers II/III/IV/V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_II;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_III;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_IV;
            nRelatedPowerID4 = FORCE_POWER_INSPIRE_FOLLOWERS_V;
            nRelatedPowerID5 = FORCE_POWER_INSPIRE_FOLLOWERS_VI;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_II:
            // Inspire Followers III/IV/V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_III;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_IV;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_V;
            nRelatedPowerID4 = FORCE_POWER_INSPIRE_FOLLOWERS_VI;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_III:
            // Inspire Followers IV/V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_IV;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_V;
            nRelatedPowerID3 = FORCE_POWER_INSPIRE_FOLLOWERS_VI;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_IV:
            // Inspire Followers V/VI are more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_V;
            nRelatedPowerID2 = FORCE_POWER_INSPIRE_FOLLOWERS_VI;
            break;
        case FORCE_POWER_INSPIRE_FOLLOWERS_V:
            // Inspire Followers VI is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_INSPIRE_FOLLOWERS_VI;
            break;

        case FORCE_POWER_MIND_TRICK:
            // Force Confusion is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_CONFUSION;
            break;

        case FORCE_POWER_BEAST_TRICK:
            // Beast Confusion is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_BEAST_CONFUSION;
            break;

        case FORCE_POWER_DROID_TRICK:
            // Droid Confusion is more powerful and
            // part of the same tree.
            nRelatedPowerID1 = FORCE_POWER_DROID_CONFUSION;
            break;

        case FORCE_POWER_PLAGUE:
        case FORCE_POWER_FORCE_ARMOR:
        case FORCE_POWER_FORCE_IMMUNITY:
        case FORCE_POWER_MIND_MASTERY:
        case FORCE_POWER_MASTER_ENERGY_RESISTANCE:
        case FORCE_POWER_SLEEP:
        case FORCE_POWER_SPEED_MASTERY:
        case FORCE_POWER_MASTER_FORCE_BARRIER:
        case FORCE_POWER_MASTER_BATTLE_MEDITATION_PC:
        case FORCE_POWER_MAS_BAT_MED_ENEMY:
        case FORCE_POWER_CRUSH_OPPOSITION_VI:
        case FORCE_POWER_MASTER_FORCE_BODY:
        case FORCE_POWER_MASTER_FORCE_SCREAM:
        case FORCE_POWER_MASTER_FURY:
        case FORCE_POWER_WOOKIEE_RAGE_III:
        case FORCE_POWER_INSPIRE_FOLLOWERS_VI:
        case FORCE_POWER_DOMINATE:
        case FORCE_POWER_FORCE_ENLIGHTENMENT:
        case FORCE_POWER_FORCE_SIGHT:
        case FORCE_POWER_CONFUSION:
        case FORCE_POWER_BEAST_CONFUSION:
        case FORCE_POWER_DROID_CONFUSION:
        case FORCE_POWER_BREATH_CONTROL:
        case 131: // DJS-OEI 10/23/2004 Sonic Howl
        default:
            // There is either no Force Power within the same
            // tree that is better than the given one, or
            // the power ID passed in is not part of a tree
            // that requires this check.
            return 0;
            break;
    }

    // Check to see if the target has any of the Force Power
    // effects we are looking for.
    effect eRelatedEffect;
    if( GetHasSpellEffect(nRelatedPowerID1, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID2, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID3, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID4, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID5, oTarget) ||
        GetHasSpellEffect(nRelatedPowerID6, oTarget) )
    {
        bBetterExists = 1;
    }

    return bBetterExists;
}
