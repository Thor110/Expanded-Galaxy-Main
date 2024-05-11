//:: k_inc_gensupport
/*
    v1.0
    Support Include for k_inc_generic

    NOTE - To get these functions
    use k_inc_generic
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

//BOSS ATTACK TYPES
int SW_BOSS_ATTACK_TYPE_GRENADE = 1;
int SW_BOSS_ATTACK_TYPE_FORCE_POWER = 2;
int SW_BOSS_ATTACK_TYPE_NPC = 3;
int SW_BOSS_ATTACK_TYPE_PC = 4;
int SW_BOSS_ATTACK_ANY = 5;
int SW_BOSS_ATTACK_DROID = 6;

//LOCAL NUMBERS
int SW_NUMBER_COMBO_ROUTINE = 3;
int SW_NUMBER_COMBO_INDEX = 4;
int SW_NUMBER_LAST_COMBO = 5;
int SW_NUMBER_ROUND_COUNTER = 6;
int SW_NUMBER_COMBAT_ZONE = 7;
int SW_NUMBER_HEALERAI_THRESHOLD = 8;
int SW_NUMBER_HEALERAI_PERCENTAGE = 9;
int SW_NUMBER_COOLDOWN = 10; // fak - oei, rounds before firing again
int SW_NUMBER_COOLDOWN_FIRE = 11; // fak - oei, threshold at which turret fires

//COMBO CONSTANTS
int SW_COMBO_RANGED_FEROCIOUS = 1;
int SW_COMBO_RANGED_AGGRESSIVE = 2;
int SW_COMBO_RANGED_DISCIPLINED = 3;
int SW_COMBO_RANGED_CAUTIOUS = 4;
int SW_COMBO_MELEE_FEROCIOUS = 5;
int SW_COMBO_MELEE_AGGRESSIVE = 6;
int SW_COMBO_MELEE_DISCIPLINED = 7;
int SW_COMBO_MELEE_CAUTIOUS = 8;
int SW_COMBO_BUFF_PARTY = 9;
int SW_COMBO_BUFF_DEBILITATE = 10;
int SW_COMBO_BUFF_DAMAGE = 11;
int SW_COMBO_BUFF_DEBILITATE_DESTROY = 12;
int SW_COMBO_SUPRESS_DEBILITATE_DESTROY = 13;
int SW_COMBO_SITH_ATTACK = 14;
int SW_COMBO_BUFF_ATTACK = 15;
int SW_COMBO_SITH_CONFOUND = 16;
int SW_COMBO_JEDI_SMITE = 17;
int SW_COMBO_SITH_TAUNT = 18;
int SW_COMBO_SITH_BLADE = 19;
int SW_COMBO_SITH_CRUSH = 20;
int SW_COMBO_JEDI_CRUSH = 21;
int SW_COMBO_SITH_BRUTALIZE = 22;
int SW_COMBO_SITH_DRAIN = 23;
int SW_COMBO_SITH_ESCAPE = 24;
int SW_COMBO_JEDI_BLITZ = 25;
int SW_COMBO_SITH_SPIKE = 26;
int SW_COMBO_SITH_SCYTHE = 27;
int SW_COMBO_SITH_FURY = 28;
int SW_COMBO_JEDI_FOCUS = 29;
int SW_COMBO_DROID_UTILITIES = 30;
int SW_COMBO_DROID_UTILITIES_2 = 31;
int SW_COMBO_INVALID = 32;

// DJS-OEI 3/31/2004
// Modified to make room for designer-reserved values.
//int SW_FLAG_TARGET_FRIEND = 59;
int SW_FLAG_TARGET_FRIEND = 84;

//****SUPPORT FUNCTIONS FOR THE GENERICS**************************************************************************
//Returns the number targets attacking the passed in object
int GN_GetAttackers(object oTarget);
//Returns the index of the party member passed in or false if the object is not a party member.
int GN_CheckNPCIsInParty(object oNPC);
//Checks whether the attempted spell or attack targets are true
int GN_CheckAttemptedSpellAttackTarget();
//Determines if the object has a valid attempted spell or attack target or a valid attack target.
int GN_GetIsFighting(object oFighting);
//Compares to talent codes to see if specific bits are true.
int GN_CompareTalents(int nTalent1, int nTalent2);
// Returns the talent code for the previous round.
int GN_GetPreviousTalentCode();
//Takes a spell constant and passes back the code
int GN_GetSpellTalentCode(int nSpell);
//Takes a feat constant and passes back the code
int GN_GetFeatTalentCode(int nFeat);
//Searchs for viable talents that can be used by the user and passes back yes or no according to whether one is found.
int GN_GetHasViableTalent(int nTalentCode);
//Returns the exclusion code for the talent based on the racial type of the creature passed in.
int GN_GetExclusionCode(object oTarget);
//This takes a combo constant and returns a talent.
talent GN_GetNextTalentInCombo(int nCombo);
//Determines if a combo is valid for the object in question
int GN_GetIsComboValid(int nComboType);
//Does the Jedi have a damaging Force Power
int GN_GetHasDamagingForcePower();
//Gets a random combo for a default AI Jedi
int GN_GetStandardJediCombo(int nBoss = FALSE);
//Gets a random combo for a default AI Droid
int GN_GetStandardDroidCombo(int nBoss = FALSE);
//Gets a random combo for a default AI NPC
int GN_GetStandardNPCCombo(int nBoss = FALSE);
// Returns 2 for Ranged and 1 for Melee weapons, checking the basetype
int GN_GetWeaponType(object oTarget = OBJECT_SELF);
//RWT-OEI 08/28/04
//Returns 1 if base item is ranged, returns 2 if base item
//is melee, returns 0 if item is not a weapon
int GN_GetWeaponTypeFromBaseItem(int nBaseType);
//Gets the NPC to eqyuip a melee = 1 or ranged = 2 weapon.
int GN_EquipAppropriateWeapon();
//Returns a talent for the boss to perform in combat.
talent GN_GetBossCombatMove(int nBossAttackType, int nDroid = FALSE);
//Get Boss AOE Force Powers
talent GN_GetAOEForcePower(int nDroid = FALSE);
//Get Boss Single Target Force Powers
talent GN_GetTargetedForcePower(int nDroid = FALSE);
//Returns the number of party members who are active
int GN_GetActivePartyMemberCount();
//Returns the active party member who is not Member(0)
object GN_GetActivePartyMember(int nDrainTarget = FALSE);
//This function returns an active party member. They must not be dead.  The debilitated parameter will
//ignore those party members already debilitated.
object GN_ReturnActivePartyMember(int nDebil = FALSE);

//****VERIFICATION FOR COMMANDS FOR COMBOS**************************************************************************

//Check Push Series
int GN_CheckSeriesForcePush();
//Check Armor Series
int GN_CheckSeriesArmor();
//Check Fear Series
int GN_CheckSeriesFear();
//Check Hold Series
int GN_CheckSeriesHold();
//Check Poison Series
int GN_CheckSeriesAfflict();
//Check Saber Throw Series
int GN_CheckSeriesSaberThrow();
//Check Lightning Series
int GN_CheckSeriesLightning();
//Check Jump Series
int GN_CheckSeriesJump();
//Check Choke Series
int GN_CheckSeriesChoke();
//Check Drain Life Series
int GN_CheckSeriesDrainLife();
//Check Speed Series
int GN_CheckSeriesSpeed();
//Checks if the droid has utility items
int GN_CheckSeriesDroidUtilities();
//Checks Mind Series
int GN_CheckSeriesMind();
//Checks Resist Series
int GN_CheckSeriesResist();
//Checks Force Immunity Series();
int GN_CheckSeriesForceImmunity();
//Checks the Breach Series
int GN_CheckSeriesBreach();

// DJS-OEI 8/19/2004
//Checks the Heal Series
int GN_CheckSeriesHeal();
//Checks the Barrier Series
int GN_CheckSeriesBarrier();
//Checks the Battle Meditation Series
int GN_CheckSeriesBattleMeditation();
//Checks the Drain Force Series
int GN_CheckSeriesDrainForce();
//Checks the Scream Series
int GN_CheckSeriesScream();
//Checks the Fury series
int GN_CheckSeriesFury();
//Checks the revitalize series
int GN_CheckSeriesRevitalize();

//****GET COMMANDS FOR COMBOS**************************************************************************

//Fetch Series Force Push Power
int GN_GetSeriesForcePush();
//Fetch Series Force Armor Power
int GN_GetSeriesForceArmor();
//Fetch Series Fear Power
int GN_GetSeriesFear();
//Fetch Series Hold Power
int GN_GetSeriesHold();
//Fetch Series Afflict Power
int GN_GetSeriesAfflict();
//Fetch Series Saber Throw Power
int GN_GetSeriesSaberThrow();
//Fetch Series Lightning Power
int GN_GetSeriesLightning();
//Fetch Series Jump Power
int GN_GetSeriesJump();
//Fetch Series Choke Power
int GN_GetSeriesChoke();
//Fetch Series Drain Life Power
int GN_GetSeriesDrainLife();
//Fetch Series Speed Power
int GN_GetSeriesSpeed();
//Fetch Melee Feat
int GN_GetSeriesMeleeFeat();
//Fetch Ranged Feat
int GN_GetSeriesRangedFeat();
//Fetch Mind Series
int GN_GetSeriesMind();
//Fetch Resist Series
int GN_GetSeriesResist();
//Fetch Force Immunity Series();
int GN_GetSeriesForceImmunity();
//Fetch the Breach Series
int GN_GetSeriesBreach();
//Fetch the Fury series
int GN_GetSeriesFury();
//Fetch the Revitalize series
int GN_GetSeriesRevitalize();

// DJS-OEI 8/19/2004
//Fetch the Heal Series
int GN_GetSeriesHeal();
//Fetch the Barrier Series
int GN_GetSeriesBarrier();
//Fetch the Battle Meditation Series
int GN_GetSeriesBattleMeditation();
//Fetch the Drain Force Series
int GN_GetSeriesDrainForce();
//Fetch the Scream Series
int GN_GetSeriesScream();

//****DEBUG COMMANDS FOR THE GENERICS**************************************************************************

//Basically, a wrapper for AurPostString
void GN_PostString(string sString = "",int x = 10,int y = 10,float fShow = 4.0);
//Makes the object running the script say a speak string.
void GN_MySpeakString(string sString);
//Makes the nearest PC say a speakstring.
void GN_AssignPCDebugString(string sString);
//Inserts a print string into the log file for debugging purposes.
void GN_MyPrintString(string sString);
//Prints to the log file the shout received by a target.
void GN_PrintShoutType(object oShouter, int nShout);
//Returns the object ID and name appended to each other.
string GN_ReturnDebugName(object oTarget);
//Returns a string of the combo being used.
string GN_FetchComboString(int nCombo);
//Checks the friendly fire on the target out to 3.5m by default.
int GN_CheckFriendlyFireOnTarget(object oTarget, float fDistance = 4.0);
//Checks the enemies around a target object.
int GN_CheckEnemyGroupingOnTarget(object oTarget, float fDistance = 4.0);
//Searches the area and marks a group as a viable target for a grenade
object GN_FindGrenadeTarget();
//Searches the area and marks a group as a viable target for a AOE force power
object GN_FindAOETarget();
//Returns a grenade appropriate to the target
talent GN_GetGrenadeTalent(int nDroid = FALSE);
//Returns the AI style in a string
string GN_ReturnAIStyle(object oTarget = OBJECT_SELF);
//Prints a string from a int
string GN_ITS(int sFutureString);
//These debug commands are used for debugging shouts only
void GN_PostShoutString(string sString = "",int x = 10,int y = 10,float fShow = 4.0);
//These debug commands are used for debugging shouts o
void GN_MyPrintShoutString(string sString);


//::///////////////////////////////////////////////
//:: Get Attackers
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the number objects attacking the object;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////

int GN_GetAttackers(object oTarget)
{
    int nCnt = 0;
    object oAttacker = GetFirstAttacker(oTarget);
    while(GetIsObjectValid(oAttacker))
    {
        nCnt++;
        oAttacker = GetNextAttacker(oTarget);
    }
    return nCnt;
}

//::///////////////////////////////////////////////
//:: Am I a party member
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

int GN_CheckNPCIsInParty(object oNPC)
{
    if(GetPartyMemberByIndex(0) == oNPC)
    {
        return 1;
    }
    else if(GetPartyMemberByIndex(1) == oNPC)
    {
        return 2;
    }
    else if(GetPartyMemberByIndex(2) == oNPC)
    {
        return 3;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: GetAttempted Spell or Attack Target State
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the spell or attack target is
    true
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 8, 2002
//:://////////////////////////////////////////////

int GN_CheckAttemptedSpellAttackTarget()
{
    object oAttack = GetAttemptedAttackTarget();
    object oSpell = GetAttemptedSpellTarget();
    if(GetIsObjectValid(oAttack) || GetIsObjectValid(oSpell))
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: GetIsFighting
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the passed object has an Attempted
    Attack or Spell Target
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 16, 2002
//:://////////////////////////////////////////////
int GN_GetIsFighting(object oFighting)
{
    object oAttack = GetAttemptedAttackTarget();
    object oSpellTarget = GetAttemptedSpellTarget();
    object oAttacking = GetAttackTarget();
    object oMove = GetAttemptedMovementTarget();

    if(GetTag(OBJECT_SELF) == "DEBUG")
    {
        GN_ReturnDebugName(OBJECT_SELF);
        GN_PostString("Attempted Attack Target = " + IntToString(GetIsObjectValid(oAttack)), 10,20, 4.0);
        GN_PostString("Attempted Spell Target = " + IntToString(GetIsObjectValid(oSpellTarget)), 10,22, 4.0);
        GN_PostString("Attack Target = " + IntToString(GetIsObjectValid(oAttacking)), 10,24, 4.0);
        GN_PostString("Move Target = " + IntToString(GetIsObjectValid(oMove)), 10,26, 4.0);
    }

    if(GetIsObjectValid(oAttack) || GetIsObjectValid(oSpellTarget) || GetIsObjectValid(oAttacking) ||
     (GetIsObjectValid(oMove) && GetIsEnemy(oMove)))
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Compare Talents
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the bits of Talent 1 against the bits
    of Talent 2 to see if 1 is true.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 12, 2002
//:://////////////////////////////////////////////

int GN_CompareTalents(int nTalent1, int nTalent2)
{
    if(nTalent1 & nTalent2)
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Comparison of " + IntToString(nTalent1) + " / " + IntToString(nTalent2));
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Get Last Talent Code
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the last talent that was used
    by OBJECT_SELF
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetPreviousTalentCode()
{
    int nAction = GetLastAttackAction();
    int nFeatSpell;
    if(nAction == ACTION_CASTSPELL)
    {
        nFeatSpell = GetLastForcePowerUsed();
        nFeatSpell = GN_GetSpellTalentCode(nFeatSpell);
    }
    else if(nAction == ACTION_ATTACKOBJECT)
    {
        nFeatSpell = GetLastCombatFeatUsed();
        nFeatSpell = GN_GetFeatTalentCode(nFeatSpell);
    }
    return nFeatSpell;
}

//::///////////////////////////////////////////////
//:: Get Spell Talent Code
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the talent code for a particular spell
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetSpellTalentCode(int nSpell)
{
    talent tSpell = TalentSpell(nSpell);
    return GetCategoryFromTalent(tSpell);
}

//::///////////////////////////////////////////////
//:: Get Feat Talent Code
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the talent code for a particular feat
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetFeatTalentCode(int nFeat)
{
    talent tFeat = TalentSpell(nFeat);
    return GetCategoryFromTalent(tFeat);
}

//::///////////////////////////////////////////////
//:: Get Has Viable Talent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes a talent code and searches for a viable
    talent from the bunch
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetHasViableTalent(int nTalentCode)
{
    talent tTest = GetCreatureTalentBest(nTalentCode, 20);
    if(GetIsTalentValid(tTest))
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Get Exclusion Code
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns an exclusion code based on the Racial
    Type of the target
    0x00 = None
    0x01 = Organic
    0x02 = Droid
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetExclusionCode(object oTarget)
{
    int nRacial = GetRacialType(oTarget);
    if(nRacial == RACIAL_TYPE_DROID)
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Exclusion Used: 0x01");
        return 0x01;
    }
    else if(nRacial == RACIAL_TYPE_HUMAN)
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Exclusion Used: 0x02");
        return 0x02;
    }
    //GN_MyPrintString("GENERIC DEBUG *************** Exclusion Used: 0x03");
    return 0x03;
}

//::///////////////////////////////////////////////
//:: Get Jedi Combo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a proper Jedi Combo for Standard AI

int SW_COMBO_RANGED_FEROCIOUS = 1;
int SW_COMBO_RANGED_AGGRESSIVE = 2;
int SW_COMBO_RANGED_DISCIPLINED = 3;
int SW_COMBO_RANGED_CAUTIOUS = 4;
int SW_COMBO_MELEE_FEROCIOUS = 5;
int SW_COMBO_MELEE_AGGRESSIVE = 6;
int SW_COMBO_MELEE_DISCIPLINED = 7;
int SW_COMBO_MELEE_CAUTIOUS = 8;
int SW_COMBO_BUFF_PARTY = 9;
int SW_COMBO_BUFF_DEBILITATE = 10;
int SW_COMBO_BUFF_DAMAGE = 11;
int SW_COMBO_BUFF_DEBILITATE_DESTROY = 12;
int SW_COMBO_SUPRESS_DEBILITATE_DESTROY = 13;
int SW_COMBO_SITH_ATTACK = 14;
int SW_COMBO_BUFF_ATTACK = 15;
int SW_COMBO_SITH_CONFOUND = 16;
int SW_COMBO_JEDI_SMITE = 17;
int SW_COMBO_SITH_TAUNT = 18;
int SW_COMBO_SITH_BLADE = 19;
int SW_COMBO_SITH_CRUSH = 20;
int SW_COMBO_JEDI_CRUSH = 21;
int SW_COMBO_SITH_BRUTALIZE = 22;
int SW_COMBO_SITH_DRAIN = 23;
int SW_COMBO_SITH_ESCAPE = 24;
int SW_COMBO_JEDI_BLITZ = 25;
int SW_COMBO_SITH_SPIKE = 26;
int SW_COMBO_SITH_SCYTHE = 27;
int SW_COMBO_SITH_FURY = 28;
int SW_COMBO_JEDI_FOCUS = 29;
int SW_COMBO_DROID_UTILITIES = 30;
int SW_COMBO_DROID_UTILITIES_2 = 31;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 28, 2002
//:://////////////////////////////////////////////
int GN_GetStandardJediCombo(int nBoss = FALSE)
{
    int nBool;
    int nRand;
    while(nBool == FALSE)
    {
        if(nBoss == FALSE)
        {
            nRand = Random(25)+1; //RWT-OEI 09/03/04 - Changed from 23->25

            if(nRand == 1 || nRand == 2) {return SW_COMBO_MELEE_FEROCIOUS;}
            else if(nRand == 3 || nRand == 4) {return SW_COMBO_MELEE_AGGRESSIVE;}
            else if(nRand == 5 || nRand == 6) {return SW_COMBO_MELEE_DISCIPLINED;}
            else if(nRand == 7 || nRand == 8 || nRand == 9) {return SW_COMBO_MELEE_CAUTIOUS;}
            else if(nRand >= 10 || nRand <= 26)
            {
                nRand = nRand+3;
            }
        }
        else
        {
            nRand = Random(15);
            nRand = nRand + 14;//RWT-OEI 09/03/04 - Changed from 13->14
        }

        nBool = GN_GetIsComboValid(nRand);
        //GN_MyPrintString("GENERIC DEBUG *************** Jedi Combo " + GN_FetchComboString(nRand) + " is " + IntToString(nBool));
    }
    return nRand;
}
//::///////////////////////////////////////////////
//:: Get Droid Combo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a proper Droid Combo for Standard AI
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 28, 2002
//:://////////////////////////////////////////////
int GN_GetStandardDroidCombo(int nBoss = FALSE)
{
    //GN_MyPrintString("GENERIC DEBUG *************** Droid Combo Selection Started");
    int nBool = FALSE;
    int nRand = d6();
    while(nBool == FALSE)
    {
        if(nRand == 1){nRand = SW_COMBO_RANGED_AGGRESSIVE;}
        else if(nRand == 2){nRand = SW_COMBO_RANGED_CAUTIOUS;}
        else if(nRand == 3){nRand = SW_COMBO_RANGED_DISCIPLINED;}
        else if(nRand == 4){nRand = SW_COMBO_RANGED_FEROCIOUS;}
        else if(nRand == 5 || nRand == 6)
        {
            if((IsObjectPartyMember(OBJECT_SELF) && GetNPCAIStyle(OBJECT_SELF) == NPC_AISTYLE_JEDI_SUPPORT) ||
                !IsObjectPartyMember(OBJECT_SELF))
            {
                if(nRand == 5)
                {
                    nRand = SW_COMBO_DROID_UTILITIES;
                }
                else if(nRand == 6)
                {
                    nRand = SW_COMBO_DROID_UTILITIES_2;
                }
            }
            else
            {
                nRand = SW_COMBO_INVALID;
            }
        }

        nBool = GN_GetIsComboValid(nRand);
        //GN_MyPrintString("GENERIC DEBUG *************** Droid Combo Picked " + GN_FetchComboString(nRand) + " is " + IntToString(nBool));
        if(nBool == FALSE)
        {
            nRand = d6();
        }
    }
    //GN_MyPrintString("GENERIC DEBUG *************** Returning Combo Returned = " + GN_FetchComboString(nRand));
    return nRand;
}

//::///////////////////////////////////////////////
//:: Get NPC Combo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a proper NPC Combo for Standard AI
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 28, 2002
//:://////////////////////////////////////////////
int GN_GetStandardNPCCombo(int nBoss = FALSE)
{
    int nBool;
    int nRand = d4();
    if(GN_GetWeaponType() != 0)
    {
        while(nBool == FALSE)
        {
            if(GN_GetWeaponType() == 1)
            {
                if(nRand == 1){nRand = SW_COMBO_MELEE_AGGRESSIVE;}
                else if(nRand == 2){nRand = SW_COMBO_MELEE_CAUTIOUS;}
                else if(nRand == 3){nRand = SW_COMBO_MELEE_DISCIPLINED;}
                else if(nRand == 4){nRand = SW_COMBO_MELEE_FEROCIOUS;}
            }
            else if(GN_GetWeaponType() == 2)
            {
                if(nRand == 1){nRand = SW_COMBO_RANGED_AGGRESSIVE;}
                else if(nRand == 2){nRand = SW_COMBO_RANGED_CAUTIOUS;}
                else if(nRand == 3){nRand = SW_COMBO_RANGED_DISCIPLINED;}
                else if(nRand == 4){nRand = SW_COMBO_RANGED_FEROCIOUS;}
            }
            nBool = GN_GetIsComboValid(nRand);
            if(nBool == FALSE)
            {
                //nRand = d6();
                nRand = d4();//RWT-OEI 09/03/04 - Pretty sure this is supposed to be d4()
            }
        }
    }
    else
    {
        // DJS-OEI 9/28/2004
        // For some reason, if the caller is unarmed, it would resort
        // to SW_COMBO_RANGED_AGGRESSIVE, which seems very odd. Since CNPCs
        // will never auto-equip weapons (since GN_EquipAppropriateWeapon())
        // always drops out for party members, we were getting a crash with
        // the new Sniper Shot feat when someone tried to use it unarmed.
        // I have fixed that crash, but we will try to choose melee feats
        // in this case instead of ranged.
        //nRand = 2;
        if(nRand == 1) {nRand = SW_COMBO_MELEE_AGGRESSIVE;}
        else if(nRand == 2) {nRand = SW_COMBO_MELEE_CAUTIOUS;}
        else if(nRand == 3) {nRand = SW_COMBO_MELEE_DISCIPLINED;}
        else if(nRand == 4) {nRand = SW_COMBO_MELEE_FEROCIOUS;}
    }
    //GN_MyPrintString("GENERIC DEBUG *************** NPC Combo " + GN_FetchComboString(nRand) + " is " + IntToString(nBool));
    return nRand;
}

//::///////////////////////////////////////////////
//:: Get Next Talent In Combo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Looks at the combo id and returns an ability
    usable by the NPC which matches the next
    feat in the combo.
*/

//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////
talent GN_GetNextTalentInCombo(int nCombo)
{
    SetLocalBoolean(OBJECT_SELF, SW_FLAG_TARGET_FRIEND, FALSE);
    int nLocal = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX);
    //GN_MyPrintString("GENERIC DEBUG *************** Combo Index " + IntToString(nLocal));
    talent tUse, tInvalid;
    int nID = -1;
    int nFeat = FALSE;
    int nBuff = FALSE;
    //Sith Attack(PUSH, CHOKE, JUMP)

    if(nCombo == SW_COMBO_SITH_ATTACK)
    {
        if(nLocal == 1)
        {
            //nID = GN_GetSeriesChoke();
            GN_GetSeriesScream();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesForcePush();
        }
        else
        {
            //nID = GN_GetSeriesJump();
            nID = GN_GetSeriesJump();
        }
    }
    //Buff Attack(ARMOR, SPEED, FEAT)
    else if(nCombo == SW_COMBO_BUFF_ATTACK)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesForceArmor();
            nBuff = TRUE;
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesSpeed();
            nBuff = TRUE;
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    //Sith Confound (FEAR, FEAT, FEAT)
    else if(nCombo == SW_COMBO_SITH_CONFOUND)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesLightning();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    //Jedi Smite (HOLD, FEAT, FEAT)
    else if(nCombo == SW_COMBO_JEDI_SMITE)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesHold();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    //Sith Taunt (CHOKE, POISON, FEAT)
    else if(nCombo == SW_COMBO_SITH_TAUNT)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesChoke();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesAfflict();
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    //Sith Blade (SLOW, PUSH, THROW)
    else if(nCombo == SW_COMBO_SITH_BLADE)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesAfflict();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesForcePush();
        }
        else
        {
            nID = GN_GetSeriesSaberThrow();
        }
    }
    //Sith Crush (PUSH, SHOCK, JUMP)
    else if(nCombo == SW_COMBO_SITH_CRUSH)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesLightning();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesForcePush();
        }
        else
        {
            nID = GN_GetSeriesJump();
        }
    }
    //Jedi Crush (HOLD, THROW, JUMP)
    else if(nCombo == SW_COMBO_JEDI_CRUSH)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesHold();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesForcePush();
        }
        else
        {
            nID = GN_GetSeriesJump();
        }
    }
    //Sith Brutalize (CHOKE, DRAIN, PUSH)
    else if(nCombo == SW_COMBO_SITH_BRUTALIZE)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesChoke();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesDrainLife();
        }
        else
        {
            nID = GN_GetSeriesForcePush();
        }
    }
    //Sith Drain (FEAT, DRAIN, FEAT)
    else if(nCombo == SW_COMBO_SITH_DRAIN)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesDrainLife();
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    //Sith Escape (DRAIN, PUSH, THROW)
    else if(nCombo == SW_COMBO_SITH_ESCAPE)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesDrainLife();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesForcePush();
        }
        else
        {
            nID = GN_GetSeriesSaberThrow();
        }
    }
    //Jedi Blitz (FEAT, FEAT, PUSH)
    else if(nCombo == SW_COMBO_JEDI_BLITZ)
    {
        if(nLocal == 1)
        {
            //nID = GN_GetSeriesMeleeFeat();
            //RWT-OEI 09/02/04 - Since this one has no series, just give
            //the ID directly.
            nID = FORCE_POWER_FORCE_CRUSH;
            nFeat = TRUE;
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            nID = GN_GetSeriesForcePush();
        }
    }
    //Sith Spike (PUSH, SLOW, FEAT)
    else if(nCombo == SW_COMBO_SITH_SPIKE)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesAfflict();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            nID = GN_GetSeriesForcePush();
        }
    }
    //Sith Scythe (DRAIN, FEAR, FEAT)
    else if(nCombo == SW_COMBO_SITH_SCYTHE)
    {
        if(nLocal == 1)
        {
            //nID = GN_GetSeriesDrainLife();
            nID = GN_GetSeriesDrainForce();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesBreach();
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    else if ( nCombo == SW_COMBO_SITH_FURY)
    {
        if ( nLocal == 1 )
        {
            nID = GN_GetSeriesFury();
        }
        else if (nLocal == 2)
        {
            nID = GN_GetSeriesScream();
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    else if ( nCombo == SW_COMBO_JEDI_FOCUS )
    {
        if ( nLocal == 1 )
        {
            nID = GN_GetSeriesBattleMeditation();
        }
        else if ( nLocal == 2 )
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
    }
    //Melee Ferocious (USE 3 FEATS)
    else if(nCombo == SW_COMBO_MELEE_FEROCIOUS)
    {
        nID = GN_GetSeriesMeleeFeat();
        nFeat = TRUE;
    }
    //Melee Aggressive (USE 2 FEATS)
    else if(nCombo == SW_COMBO_MELEE_AGGRESSIVE)
    {
        if(nLocal == 1 || nLocal == 2)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Melee/Ranged Breather");
        }
    }
    //Melee Discipline (USE 1 FEAT)
    else if(nCombo == SW_COMBO_MELEE_DISCIPLINED)
    {
        if(nLocal == 1 || nLocal == 2)
        {
            nID = GN_GetSeriesMeleeFeat();
            nFeat = TRUE;
        }
        else
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Melee/Ranged Breather");
        }
    }
    else if(nCombo == SW_COMBO_MELEE_CAUTIOUS || nCombo == SW_COMBO_RANGED_CAUTIOUS)
    {
        GN_MyPrintString("GENERIC DEBUG *************** Melee/Ranged Breather");
    }
    //Melee Cautious (USE NO FEATS) //This does not require a check. It will return an invalid talent
    //Ranged Cautious (USE NO FEATS) //This does not require a check. It will return an invalid talent
    //Ranged Ferocious (USE 3 FEATS)
    else if(nCombo == SW_COMBO_RANGED_FEROCIOUS)
    {
        nID = GN_GetSeriesRangedFeat();
        nFeat = TRUE;
    }
    //Ranged Aggressive (USE 2 FEATS)
    else if(nCombo == SW_COMBO_RANGED_AGGRESSIVE)
    {
        if(nLocal == 1 || nLocal == 2)
        {
            nID = GN_GetSeriesRangedFeat();
            nFeat = TRUE;
        }
        else
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Melee/Ranged Breather");
        }
    }
    //Ranged Discipline (USE 1 FEAT)
    else if(nCombo == SW_COMBO_RANGED_DISCIPLINED)
    {
        if(nLocal == 1 || nLocal == 2)
        {
            nID = GN_GetSeriesRangedFeat();
            nFeat = TRUE;
        }
        else
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Melee/Ranged Breather");
        }
    }
    //Buff Party
    else if(nCombo == SW_COMBO_BUFF_PARTY)
    {
        tUse = GetCreatureTalentRandom(0xf8ff);
    }
    //Buff & Debilitate (BUFF & 2 DEBILITATE ENEMY)
    else if(nCombo == SW_COMBO_BUFF_DEBILITATE)
    {
        if(nLocal == 1)
        {
            tUse = GetCreatureTalentRandom(0xf8ff);
        }
        else
        {
            tUse = GetCreatureTalentRandom(0xf2ff);
        }
    }
    //Buff & Damage (BUFF  & 2 DAMAGE ENEMY)
    else if(nCombo == SW_COMBO_BUFF_DAMAGE)
    {
        if(nLocal == 1)
        {
            tUse = GetCreatureTalentRandom(0xf8ff);
        }
        else
        {
            tUse = GetCreatureTalentRandom(0xf1ff);
        }
    }
    //Buff, Debilitate & Destroy (1 BUFF, 1 DEBILITATE, 1 DESTROY)
    else if(nCombo == SW_COMBO_BUFF_DEBILITATE_DESTROY)
    {
        if(nLocal == 1)
        {
            tUse = GetCreatureTalentRandom(0xf8ff);
        }
        if(nLocal == 2)
        {
            tUse = GetCreatureTalentRandom(0xf2ff);
        }
        if(nLocal == 3)
        {
            tUse = GetCreatureTalentRandom(0x1101);
        }
    }
    //Supress, Debilitate & Destroy (1 Supress, 1 DEBILITATE, 1 DESTROY)
    else if(nCombo == SW_COMBO_SUPRESS_DEBILITATE_DESTROY)
    {
        if(nLocal == 1)
        {
            tUse = GetCreatureTalentRandom(0xf1ff);
        }
        if(nLocal == 2)
        {
            tUse = GetCreatureTalentRandom(0xf2ff);
        }
        if(nLocal == 3)
        {
            tUse = GetCreatureTalentRandom(0x1101);
        }
    }
    else if(nCombo == SW_COMBO_DROID_UTILITIES)
    {
        if(nLocal == 1)
        {
            nID = GN_GetSeriesRangedFeat();
            nFeat = TRUE;
        }
        if(nLocal == 2)
        {
            nID = GN_GetSeriesRangedFeat();
            nFeat = TRUE;
        }
        if(nLocal == 3)
        {
            tUse = GetCreatureTalentRandom(0x8000);
        }
    }
    else if(nCombo == SW_COMBO_DROID_UTILITIES_2)
    {
        if(nLocal == 1)
        {
            tUse = GetCreatureTalentRandom(0x8000);
        }
        if(nLocal == 2)
        {
            nID = GN_GetSeriesRangedFeat();
            nFeat = TRUE;
        }
        if(nLocal == 3)
        {
            tUse = GetCreatureTalentRandom(0x8000);
        }
    }

    //Increments the Local number so that the progression through the Combo continues even if the talent fails
    nLocal++;
    SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, nLocal);
    if(!GetIsTalentValid(tUse) || !GetCreatureHasTalent(tUse))
    {
        //GN_MyPrintString("GENERIC DEBUG *************** ID = " + IntToString(nID));
        if(nID != -1 && nFeat == FALSE)
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Spell ID = " + IntToString(nID));
            tUse = TalentSpell(nID);
        }
        else if(nID != -1 && nFeat == TRUE)
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Feat ID = " + IntToString(nID));
            tUse = TalentFeat(nID);
        }
    }
    else
    {
        nID = GetIdFromTalent(tUse);
        //GN_MyPrintString("GENERIC DEBUG *************** Preselected ID = " + IntToString(nID));
    }
    //Use GetCreatureHasTalent here to make the talent is currently usable - ie enough force points.
    //Currently it terminates the script, so do not use it.
    if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Returning Valid Talent");
        return tUse;
    }
    //GN_MyPrintString("GENERIC DEBUG *************** Returning Invalid Talent");
    return tInvalid;
}

//::///////////////////////////////////////////////
//:: Force Power Get Functions
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns an ability based.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////
int GN_GetSeriesForcePush()
{
    if(GetHasSpell(FORCE_POWER_FORCE_WAVE))
    {
        return FORCE_POWER_FORCE_WAVE;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_WHIRLWIND))
    {
        return FORCE_POWER_FORCE_WHIRLWIND;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_PUSH))
    {
        return FORCE_POWER_FORCE_PUSH;
    }
    return -1;
}
int GN_GetSeriesForceArmor()
{
    if(GetHasSpell(FORCE_POWER_FORCE_ARMOR))
    {
        return FORCE_POWER_FORCE_ARMOR;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_SHIELD))
    {
        return FORCE_POWER_FORCE_SHIELD;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_AURA))
    {
        return FORCE_POWER_FORCE_AURA;
    }
    return -1;
}
int GN_GetSeriesFear()
{
    if(GetHasSpell(FORCE_POWER_INSANITY))
    {
        return FORCE_POWER_INSANITY;
    }
    else if(GetHasSpell(FORCE_POWER_HORROR))
    {
        return FORCE_POWER_HORROR;
    }
    else if(GetHasSpell(FORCE_POWER_FEAR))
    {
        return FORCE_POWER_FEAR;
    }
    return -1;
}
int GN_GetSeriesHold()
{
    if(GetHasSpell(FORCE_POWER_SLEEP))
    {
        return FORCE_POWER_SLEEP;
    }
    else if(GetHasSpell(FORCE_POWER_HOLD))
    {
        return FORCE_POWER_HOLD;
    }
    else if(GetHasSpell(FORCE_POWER_STUN))
    {
        return FORCE_POWER_STUN;
    }
    return -1;
}
int GN_GetSeriesAfflict()
{
    if(GetHasSpell(FORCE_POWER_PLAGUE))
    {
        return FORCE_POWER_PLAGUE;
    }
    else if(GetHasSpell(FORCE_POWER_AFFLICTION))
    {
        return FORCE_POWER_AFFLICTION;
    }
    else if(GetHasSpell(FORCE_POWER_SLOW))
    {
        return FORCE_POWER_SLOW;
    }
    return -1;
}
int GN_GetSeriesSaberThrow()
{
    if(GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW_ADVANCED))
    {
        return FORCE_POWER_LIGHT_SABER_THROW_ADVANCED;
    }
    else if(GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW))
    {
        return FORCE_POWER_LIGHT_SABER_THROW;
    }
    return -1;
}
int GN_GetSeriesLightning()
{
    if(GetHasSpell(FORCE_POWER_FORCE_STORM))
    {
        return FORCE_POWER_FORCE_STORM;
    }
    else if(GetHasSpell(FORCE_POWER_LIGHTNING))
    {
        return FORCE_POWER_LIGHTNING;
    }
    else if(GetHasSpell(FORCE_POWER_SHOCK))
    {
        return FORCE_POWER_SHOCK;
    }
    return -1;
}
int GN_GetSeriesJump()
{
    if(GetHasSpell(FORCE_POWER_FORCE_JUMP_ADVANCED))
    {
        return FORCE_POWER_FORCE_JUMP_ADVANCED;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_JUMP))
    {
        return FORCE_POWER_FORCE_JUMP;
    }
    return -1;
}
int GN_GetSeriesChoke()
{
    if(GetHasSpell(FORCE_POWER_KILL))
    {
        return FORCE_POWER_KILL;
    }
    else if(GetHasSpell(FORCE_POWER_CHOKE))
    {
        return FORCE_POWER_CHOKE;
    }
    else if(GetHasSpell(FORCE_POWER_WOUND))
    {
        return FORCE_POWER_WOUND;
    }
    return -1;
}
int GN_GetSeriesDrainLife()
{
    if(GetHasSpell(FORCE_POWER_DEATH_FIELD))
    {
        return FORCE_POWER_DEATH_FIELD;
    }
    else if(GetHasSpell(FORCE_POWER_DRAIN_LIFE))
    {
        return FORCE_POWER_DRAIN_LIFE;
    }
    return -1;
}
int GN_GetSeriesSpeed()
{
    if(GetHasSpell(FORCE_POWER_SPEED_MASTERY))
    {
        return FORCE_POWER_SPEED_MASTERY;
    }
    else if(GetHasSpell(FORCE_POWER_KNIGHT_SPEED))
    {
        return FORCE_POWER_KNIGHT_SPEED;
    }
    else if(GetHasSpell(FORCE_POWER_SPEED_BURST))
    {
        return FORCE_POWER_SPEED_BURST;
    }
    return -1;
}
int GN_GetSeriesMeleeFeat()
{
    //RWT-OEI 10/12/04 - If the character has a ranged weapon
    //equipped give them a ranged feat no matter what.
    if ( GN_GetWeaponType() == 2 )
    {
        talent tUse = GetCreatureTalentBest(0x1111,20);
        if ( GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse) )
        {
            int nID = GetIdFromTalent(tUse);
            return nID;
        }
    }
    else
    {
        talent tUse = GetCreatureTalentBest(0x1104, 20);
        if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
        {
            int nID = GetIdFromTalent(tUse);
            return nID;
        }
    }
    return -1;
}
int GN_GetSeriesRangedFeat()
{
    // DJS-OEI 4/26/2004
    // All of the Ranged combat Feats are 0x1111, not
    // 0x1181. This was causing droids, for instance,
    // to never use their Ranged Feats.
    //talent tUse = GetCreatureTalentBest(0x1181, 20);

    //RWT-OEI 10/12/04 - If the character doesn't have a ranged weapon
    //equipped, give them a melee feat no matter what
    if ( GN_GetWeaponType() != 2 )
    {
        talent tUse = GetCreatureTalentBest(0x1104, 20);
        if ( GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse) )
        {
            int nID = GetIdFromTalent(tUse);
            return nID;
        }
    }
    else
    {
        talent tUse = GetCreatureTalentBest(0x1111, 20);
        if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
        {
            int nID = GetIdFromTalent(tUse);
            return nID;
        }
    }
    return -1;
}
int GN_GetSeriesMind()
{
    if(GetHasSpell(FORCE_POWER_MIND_MASTERY))
    {
        return FORCE_POWER_MIND_MASTERY;
    }
    else if(GetHasSpell(FORCE_POWER_KNIGHT_MIND))
    {
        return FORCE_POWER_KNIGHT_MIND;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_MIND))
    {
        return FORCE_POWER_FORCE_MIND;
    }
    return -1;
}
int GN_GetSeriesResist()
{
    // DJS-OEI 12/9/2003
    if(GetHasSpell(FORCE_POWER_MASTER_ENERGY_RESISTANCE))
    {
        return FORCE_POWER_MASTER_ENERGY_RESISTANCE;
    }
    else if(GetHasSpell(FORCE_POWER_RESIST_COLD_HEAT_ENERGY))
    {
        return FORCE_POWER_RESIST_COLD_HEAT_ENERGY;
    }
    else if(GetHasSpell(FORCE_POWER_RESIST_POISON_DISEASE_SONIC))
    {
        return FORCE_POWER_RESIST_POISON_DISEASE_SONIC;
    }

    return -1;
}
int GN_GetSeriesForceImmunity()
{
    if(GetHasSpell(FORCE_POWER_FORCE_IMMUNITY))
    {
        return FORCE_POWER_FORCE_IMMUNITY;
    }
    else if(GetHasSpell(FORCE_POWER_RESIST_FORCE))
    {
        return FORCE_POWER_RESIST_FORCE;
    }
    return -1;
}
int GN_GetSeriesBreach()
{
    if(GetHasSpell(FORCE_POWER_FORCE_BREACH))
    {
        return FORCE_POWER_FORCE_BREACH;
    }
    else if(GetHasSpell(FORCE_POWER_SUPRESS_FORCE))
    {
        return FORCE_POWER_SUPRESS_FORCE;
    }
    return -1;
}

// DJS-OEI 8/19/2004
int GN_GetSeriesHeal() {
    if(GetHasSpell(FORCE_POWER_MASTER_HEAL))
    {
        return FORCE_POWER_MASTER_HEAL;
    }
    else if(GetHasSpell(FORCE_POWER_HEAL))
    {
        return FORCE_POWER_HEAL;
    }
    else if(GetHasSpell(FORCE_POWER_CURE))
    {
        return FORCE_POWER_CURE;
    }

    return -1;
}

// DJS-OEI 8/19/2004
int GN_GetSeriesBarrier() {
    if(GetHasSpell(FORCE_POWER_MASTER_FORCE_BARRIER))
    {
        return FORCE_POWER_MASTER_FORCE_BARRIER;
    }
    else if(GetHasSpell(FORCE_POWER_IMPROVED_FORCE_BARRIER))
    {
        return FORCE_POWER_IMPROVED_FORCE_BARRIER;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_BARRIER))
    {
        return FORCE_POWER_FORCE_BARRIER;
    }

    return -1;
}

// DJS-OEI 8/19/2004
int GN_GetSeriesBattleMeditation() {
    if(GetHasSpell(FORCE_POWER_MASTER_BATTLE_MEDITATION_PC))
    {
        return FORCE_POWER_MASTER_BATTLE_MEDITATION_PC;
    }
    else if(GetHasSpell(FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC))
    {
        return FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC;
    }
    else if(GetHasSpell(FORCE_POWER_BATTLE_MEDITATION_PC))
    {
        return FORCE_POWER_BATTLE_MEDITATION_PC;
    }

    if(GetHasSpell(FORCE_POWER_MAS_BAT_MED_ENEMY))
    {
        return FORCE_POWER_MAS_BAT_MED_ENEMY;
    }
    else if(GetHasSpell(FORCE_POWER_IMP_BAT_MED_ENEMY))
    {
        return FORCE_POWER_IMP_BAT_MED_ENEMY;
    }
    else if(GetHasSpell(FORCE_POWER_BAT_MED_ENEMY))
    {
        return FORCE_POWER_BAT_MED_ENEMY;
    }

    return -1;
}

//RWT-OEI 09/03/04
int GN_GetSeriesFury()
{
    if ( GetHasSpell(FORCE_POWER_MASTER_FURY) )
    {
        return FORCE_POWER_MASTER_FURY;
    }
    else if ( GetHasSpell(FORCE_POWER_IMPROVED_FURY) )
    {
        return FORCE_POWER_IMPROVED_FURY;
    }
    else if ( GetHasSpell(FORCE_POWER_FURY))
    {
        return FORCE_POWER_FURY;
    }
    return -1;
}

//RWT-OEI 09/03/04
int GN_GetSeriesRevitalize()
{
    if ( GetHasSpell(FORCE_POWER_MASTER_REVITALIZE) )
    {
        return FORCE_POWER_MASTER_REVITALIZE;
    }
    else if ( GetHasSpell(FORCE_POWER_IMPROVED_REVITALIZE) )
    {
        return FORCE_POWER_IMPROVED_REVITALIZE;
    }
    else if ( GetHasSpell(FORCE_POWER_REVITALIZE) )
    {
        return FORCE_POWER_REVITALIZE;
    }
    return -1;
}

// DJS-OEI 8/19/2004
int GN_GetSeriesDrainForce() {
    if(GetHasSpell(FORCE_POWER_MASTER_DRAIN_FORCE))
    {
        return FORCE_POWER_MASTER_DRAIN_FORCE;
    }
    else if(GetHasSpell(FORCE_POWER_IMPROVED_DRAIN_FORCE))
    {
        return FORCE_POWER_IMPROVED_DRAIN_FORCE;
    }
    else if(GetHasSpell(FORCE_POWER_DRAIN_FORCE))
    {
        return FORCE_POWER_DRAIN_FORCE;
    }

    return -1;
}

// DJS-OEI 8/19/2004
int GN_GetSeriesScream() {
    if(GetHasSpell(FORCE_POWER_MASTER_FORCE_SCREAM))
    {
        return FORCE_POWER_MASTER_FORCE_SCREAM;
    }
    else if(GetHasSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM))
    {
        return FORCE_POWER_IMPROVED_FORCE_SCREAM;
    }
    else if(GetHasSpell(FORCE_POWER_FORCE_SCREAM))
    {
        return FORCE_POWER_FORCE_SCREAM;
    }

    return -1;
}

//::///////////////////////////////////////////////
//:: Force Power Series Checks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if a Jedi has 1 in a force power series
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////

int GN_CheckSeriesForcePush()
{
    if(GetHasSpell(FORCE_POWER_FORCE_PUSH) || GetHasSpell(FORCE_POWER_FORCE_WHIRLWIND) || GetHasSpell(FORCE_POWER_FORCE_WAVE))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesArmor()
{
    if(GetHasSpell(FORCE_POWER_FORCE_ARMOR) || GetHasSpell(FORCE_POWER_FORCE_SHIELD) || GetHasSpell(FORCE_POWER_FORCE_AURA))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesFear()
{
    if(GetHasSpell(FORCE_POWER_FEAR) || GetHasSpell(FORCE_POWER_HORROR) || GetHasSpell(FORCE_POWER_INSANITY))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesHold()
{
    if(GetHasSpell(FORCE_POWER_STUN) || GetHasSpell(FORCE_POWER_HOLD) || GetHasSpell(FORCE_POWER_SLEEP))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesAfflict()
{
    if(GetHasSpell(FORCE_POWER_SLOW) || GetHasSpell(FORCE_POWER_AFFLICTION) || GetHasSpell(FORCE_POWER_PLAGUE))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesSaberThrow()
{
    if(GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW) || GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW_ADVANCED))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesLightning()
{
    if(GetHasSpell(FORCE_POWER_SHOCK) || GetHasSpell(FORCE_POWER_LIGHTNING) || GetHasSpell(FORCE_POWER_FORCE_STORM))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesJump()
{
    if(GetHasSpell(FORCE_POWER_FORCE_JUMP) || GetHasSpell(FORCE_POWER_FORCE_JUMP_ADVANCED))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesChoke()
{
    if(GetHasSpell(FORCE_POWER_CHOKE) || GetHasSpell(FORCE_POWER_WOUND) || GetHasSpell(FORCE_POWER_KILL))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesDrainLife()
{
    if(GetHasSpell(FORCE_POWER_DRAIN_LIFE) || GetHasSpell(FORCE_POWER_DEATH_FIELD))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesSpeed()
{
    if(GetHasSpell(FORCE_POWER_SPEED_BURST) || GetHasSpell(FORCE_POWER_SPEED_MASTERY) || GetHasSpell(FORCE_POWER_KNIGHT_SPEED))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesMind()
{
    if(GetHasSpell(FORCE_POWER_MIND_MASTERY) || GetHasSpell(FORCE_POWER_KNIGHT_MIND) || GetHasSpell(FORCE_POWER_FORCE_MIND))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesResist()
{
    // DJS-OEI 12/9/2003
    // Added Master Energy Resistance
    if( GetHasSpell(FORCE_POWER_RESIST_COLD_HEAT_ENERGY) ||
        GetHasSpell(FORCE_POWER_RESIST_POISON_DISEASE_SONIC) ||
        GetHasSpell(FORCE_POWER_MASTER_ENERGY_RESISTANCE) )
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesForceImmunity()
{
    if(GetHasSpell(FORCE_POWER_RESIST_FORCE) || GetHasSpell(FORCE_POWER_FORCE_IMMUNITY))
    {
        return TRUE;
    }
    return FALSE;
}
int GN_CheckSeriesBreach()
{
    if(GetHasSpell(FORCE_POWER_SUPRESS_FORCE) || GetHasSpell(FORCE_POWER_FORCE_BREACH))
    {
        return TRUE;
    }
    return FALSE;
}

// DJS-OEI 8/19/2004
int GN_CheckSeriesHeal()
{
    if(GetHasSpell(FORCE_POWER_CURE) || GetHasSpell(FORCE_POWER_HEAL) || GetHasSpell(FORCE_POWER_MASTER_HEAL))
    {
        return TRUE;
    }
    return FALSE;
}

// DJS-OEI 8/19/2004
int GN_CheckSeriesBarrier() {
    if(GetHasSpell(FORCE_POWER_FORCE_BARRIER) ||
       GetHasSpell(FORCE_POWER_IMPROVED_FORCE_BARRIER) ||
       GetHasSpell(FORCE_POWER_MASTER_FORCE_BARRIER))
    {
        return TRUE;
    }
    return FALSE;
}

// DJS-OEI 8/19/2004
int GN_CheckSeriesBattleMeditation() {
    if(GetHasSpell(FORCE_POWER_BATTLE_MEDITATION_PC) ||
       GetHasSpell(FORCE_POWER_IMPROVED_BATTLE_MEDITATION_PC) ||
       GetHasSpell(FORCE_POWER_MASTER_BATTLE_MEDITATION_PC) ||
       GetHasSpell(FORCE_POWER_BAT_MED_ENEMY) ||
       GetHasSpell(FORCE_POWER_IMP_BAT_MED_ENEMY) ||
       GetHasSpell(FORCE_POWER_MAS_BAT_MED_ENEMY))
    {
        return TRUE;
    }
    return FALSE;
}

// DJS-OEI 8/19/2004
int GN_CheckSeriesDrainForce() {
    if(GetHasSpell(FORCE_POWER_DRAIN_FORCE) ||
       GetHasSpell(FORCE_POWER_IMPROVED_DRAIN_FORCE) ||
       GetHasSpell(FORCE_POWER_MASTER_DRAIN_FORCE))
    {
        return TRUE;
    }
    return FALSE;
}

// DJS-OEI 8/19/2004
int GN_CheckSeriesScream() {
    if(GetHasSpell(FORCE_POWER_FORCE_SCREAM) ||
       GetHasSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM) ||
       GetHasSpell(FORCE_POWER_MASTER_FORCE_SCREAM))
    {
        return TRUE;
    }
    return FALSE;
}

//RWT-OEI 09/03/04
int GN_CheckSeriesFury()
{
    if (GetHasSpell(FORCE_POWER_FURY) ||
        GetHasSpell(FORCE_POWER_IMPROVED_FURY) ||
        GetHasSpell(FORCE_POWER_MASTER_FURY) )
    {
        return TRUE;
    }
    return FALSE;
}

//RWT-OEI 09/03/04
int GN_CheckSeriesRevitalize()
{
    if ( GetHasSpell(FORCE_POWER_REVITALIZE) ||
         GetHasSpell(FORCE_POWER_IMPROVED_REVITALIZE) ||
         GetHasSpell(FORCE_POWER_MASTER_REVITALIZE) )
    {
        return TRUE;
    }
    return FALSE;
}

int GN_CheckSeriesDroidUtilities()
{
    talent tUse = GetCreatureTalentRandom(0x8000);
    /*
    if(GetHasSpell(116) || GetHasSpell(117) || GetHasSpell(118) ||
       GetHasSpell(119) || GetHasSpell(120) || GetHasSpell(121) ||
       GetHasSpell(121) || GetHasSpell(122) || GetHasSpell(123) ||
       GetHasSpell(124) || GetHasSpell(125))
    */
    if(GetIsTalentValid(tUse))
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Is Combo Valid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets a combo constant and determines if the
    NPC can perform the stated combo
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////

int GN_GetIsComboValid(int nComboType)
{
    //P.W (May 27, 2003) - Made allowances for an invalid effect to be passed in.
    if(nComboType == SW_COMBO_INVALID)
    {
        return FALSE;
    }

    talent tTest, tTest2;
    if(nComboType == SW_COMBO_MELEE_FEROCIOUS ||
            nComboType == SW_COMBO_MELEE_AGGRESSIVE ||
            nComboType == SW_COMBO_MELEE_DISCIPLINED)
    {
        tTest = GetCreatureTalentRandom(0x1104); //Only Melee feats use this code
        if(GetIsTalentValid(tTest) && GetCreatureHasTalent(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_RANGED_CAUTIOUS)
    {
        return TRUE;
    }
    else if(nComboType == SW_COMBO_RANGED_FEROCIOUS ||
       nComboType == SW_COMBO_RANGED_AGGRESSIVE ||
       nComboType == SW_COMBO_RANGED_DISCIPLINED)
    {
        //These are the only ranged feats in the game and therefore it is better to use a feat constant not a talent code
        //given that 0x1101 is also used by some force powers.
        if(GetHasFeat(FEAT_SNIPER_SHOT) || GetHasFeat(FEAT_IMPROVED_SNIPER_SHOT) || GetHasFeat(FEAT_MASTER_SNIPER_SHOT) ||
           GetHasFeat(FEAT_POWER_BLAST) || GetHasFeat(FEAT_IMPROVED_POWER_BLAST) || GetHasFeat(82) || //Master Power Blast
           GetHasFeat(FEAT_RAPID_SHOT) || GetHasFeat(FEAT_MULTI_SHOT) || GetHasFeat(92))//92 = IMRPOVED_RAPID_SHOT
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_MELEE_CAUTIOUS)
    {
        return TRUE;
    }
    else if(nComboType == SW_COMBO_BUFF_PARTY)
    {
        tTest = GetCreatureTalentRandom(0xf8ff);
        if(GetIsTalentValid(tTest) && GetCreatureHasTalent(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_BUFF_DEBILITATE)
    {
        tTest = GetCreatureTalentRandom(0xf8ff);
        tTest2 = GetCreatureTalentRandom(0xf2ff);
        if(GetIsTalentValid(tTest) && GetIsTalentValid(tTest2)
           && GetCreatureHasTalent(tTest)
           && GetCreatureHasTalent(tTest2))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_BUFF_DAMAGE)
    {
        tTest = GetCreatureTalentRandom(0xf8ff);
        if(GetIsTalentValid(tTest) && GN_GetHasDamagingForcePower())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_BUFF_DEBILITATE_DESTROY)
    {
        tTest = GetCreatureTalentRandom(0xf8ff);
        tTest2 = GetCreatureTalentRandom(0xf2ff);
        if(GetIsTalentValid(tTest) && GetIsTalentValid(tTest2) && GN_GetHasDamagingForcePower())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SUPRESS_DEBILITATE_DESTROY)
    {
        tTest = GetCreatureTalentRandom(0xff2f);
        tTest2 = GetCreatureTalentRandom(0xf2ff);
        if(GetIsTalentValid(tTest) && GetIsTalentValid(tTest2) && GN_GetHasDamagingForcePower())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_ATTACK)
    {
        if(GN_CheckSeriesForcePush() && GN_CheckSeriesChoke() && GN_CheckSeriesJump())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_BUFF_ATTACK)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if(GN_CheckSeriesArmor() && GN_CheckSeriesSpeed() && GetIsTalentValid(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_CONFOUND)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if(GN_CheckSeriesLightning() && GetIsTalentValid(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_JEDI_SMITE)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if(GN_CheckSeriesHold() && GetIsTalentValid(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_TAUNT)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if(GN_CheckSeriesChoke() && GN_CheckSeriesAfflict() && GetIsTalentValid(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_BLADE)
    {
        if(GN_CheckSeriesAfflict() && GN_CheckSeriesForcePush() && GN_CheckSeriesSaberThrow())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_CRUSH)
    {
        if(GN_CheckSeriesLightning() && GN_CheckSeriesForcePush() && GN_CheckSeriesJump())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_JEDI_CRUSH)
    {
        if(GN_CheckSeriesHold() && GN_CheckSeriesForcePush() && GN_CheckSeriesJump())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_JEDI_CRUSH)
    {
        if(GN_CheckSeriesChoke() && GN_CheckSeriesDrainLife() && GN_CheckSeriesForcePush())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_DRAIN)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if(GN_CheckSeriesDrainLife() && GetIsTalentValid(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_ESCAPE)
    {
        if(GN_CheckSeriesDrainLife() && GN_CheckSeriesForcePush() && GN_CheckSeriesSaberThrow())
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_JEDI_BLITZ)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        //if(GN_CheckSeriesForcePush() && GetIsTalentValid(tTest))
        if ( GN_CheckSeriesForcePush() && GetIsTalentValid(tTest) && GetHasSpell(FORCE_POWER_FORCE_CRUSH) )
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_SPIKE)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if(GN_CheckSeriesForcePush() && GN_CheckSeriesAfflict() && GetIsTalentValid(tTest))
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_SCYTHE)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        //if(GN_CheckSeriesDrainLife() && GN_CheckSeriesBreach() && GetIsTalentValid(tTest))
        if ( GN_CheckSeriesDrainForce() && GN_CheckSeriesBreach() && GetIsTalentValid(tTest) )
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_SITH_FURY)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if ( GN_CheckSeriesFury() && GN_CheckSeriesScream() && GetIsTalentValid(tTest) )
        {
            return TRUE;
        }
    }
    else if ( nComboType == SW_COMBO_JEDI_FOCUS)
    {
        tTest = GetCreatureTalentRandom(0x1104);
        if ( GN_CheckSeriesBattleMeditation() && GetIsTalentValid(tTest) )
        {
            return TRUE;
        }
    }
    else if(nComboType == SW_COMBO_DROID_UTILITIES || nComboType == SW_COMBO_DROID_UTILITIES_2)
    {
        object oItem1 = GetItemInSlot(INVENTORY_SLOT_LEFTARM);
        object oItem2 = GetItemInSlot(INVENTORY_SLOT_RIGHTARM);

        GN_MyPrintString("GENERIC DEBUG *************** Droid Items = " + GN_ReturnDebugName(oItem1) + " / " + GN_ReturnDebugName(oItem2));

        if(GN_CheckSeriesDroidUtilities())
        {
            GN_MyPrintString("GENERIC DEBUG *************** Droid Utility Check is TRUE");
            return TRUE;
        }
        GN_MyPrintString("GENERIC DEBUG *************** Droid Utility Check is FALSE");
    }
    return FALSE;
}

int GN_GetHasDamagingForcePower()
{
    if(GetHasSpell(FORCE_POWER_CHOKE) ||
       GetHasSpell(FORCE_POWER_DEATH_FIELD) ||
       GetHasSpell(FORCE_POWER_DRAIN_LIFE) ||
       GetHasSpell(FORCE_POWER_DROID_DESTROY) ||
       GetHasSpell(FORCE_POWER_DROID_DISABLE) ||
       GetHasSpell(FORCE_POWER_FORCE_PUSH) ||
       GetHasSpell(FORCE_POWER_FORCE_STORM) ||
       GetHasSpell(FORCE_POWER_FORCE_WAVE) ||
       GetHasSpell(FORCE_POWER_FORCE_WHIRLWIND) ||
       GetHasSpell(FORCE_POWER_KILL) ||
       GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW) ||
       GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW_ADVANCED) ||
       GetHasSpell(FORCE_POWER_LIGHTNING) ||
       GetHasSpell(FORCE_POWER_SHOCK) ||
       GetHasSpell(FORCE_POWER_WOUND) ||
       GetHasSpell(FORCE_POWER_DRAIN_FORCE) || // DJS-OEI 8/19/2004
       GetHasSpell(FORCE_POWER_IMPROVED_DRAIN_FORCE) || // DJS-OEI 8/19/2004
       GetHasSpell(FORCE_POWER_MASTER_DRAIN_FORCE) ||   // DJS-OEI 8/19/2004
       GetHasSpell(FORCE_POWER_FORCE_SCREAM) ||         // DJS-OEI 8/19/2004
       GetHasSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM) ||    // DJS-OEI 8/19/2004
       GetHasSpell(FORCE_POWER_MASTER_FORCE_SCREAM) ||  // DJS-OEI 8/19/2004
       GetHasSpell(FORCE_POWER_FORCE_CRUSH) )   // DJS-OEI 8/19/2004
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Get Weapon Type
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return 1 if the object is a Melee Weapon and
    2 if the weapon is a Ranged Weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 2, 2002
//:://////////////////////////////////////////////

int GN_GetWeaponType(object oTarget = OBJECT_SELF)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON,oTarget);
    //GN_MyPrintString("GENERIC DEBUG *************** Valid Weapon = " + GN_ITS(GetIsObjectValid(oItem)));
    //RWT-OEI 08/28/04 - Took out all those calls to GetBaseItemType() and
    //cached the value here instead.
    int nBaseType = GetBaseItemType(oItem);

    if(GetIsObjectValid(oItem))
    {
        if( nBaseType == BASE_ITEM_BLASTER_CARBINE ||
           nBaseType == BASE_ITEM_BLASTER_PISTOL ||
           nBaseType == BASE_ITEM_BLASTER_RIFLE ||
           nBaseType == BASE_ITEM_BOWCASTER ||
           nBaseType == BASE_ITEM_DISRUPTER_PISTOL ||
           nBaseType == BASE_ITEM_DISRUPTER_RIFLE ||
           nBaseType == BASE_ITEM_HEAVY_BLASTER ||
           nBaseType == BASE_ITEM_HEAVY_REPEATING_BLASTER ||
           nBaseType == BASE_ITEM_HOLD_OUT_BLASTER ||
           nBaseType == BASE_ITEM_ION_BLASTER ||
           nBaseType == BASE_ITEM_ION_RIFLE ||
           nBaseType == BASE_ITEM_REPEATING_BLASTER ||
           nBaseType == BASE_ITEM_SONIC_PISTOL ||
           nBaseType == BASE_ITEM_SONIC_RIFLE )
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Ranged Weapon Equipped");
            return 2;
        }
        else if( nBaseType == BASE_ITEM_DOUBLE_BLADED_LIGHTSABER ||
           nBaseType == BASE_ITEM_DOUBLE_BLADED_SWORD ||
           nBaseType == BASE_ITEM_GAMMOREAN_BATTLEAXE ||
           nBaseType == BASE_ITEM_GHAFFI_STICK ||
           nBaseType == BASE_ITEM_LIGHTSABER ||
           nBaseType == BASE_ITEM_LONG_SWORD ||
           nBaseType == BASE_ITEM_QUARTER_STAFF ||
           nBaseType == BASE_ITEM_SHORT_LIGHTSABER ||
           nBaseType == BASE_ITEM_SHORT_SWORD ||
           nBaseType == BASE_ITEM_STUN_BATON ||
           nBaseType == BASE_ITEM_VIBRO_BLADE ||
           nBaseType == BASE_ITEM_VIBRO_DOUBLE_BLADE ||
           nBaseType == BASE_ITEM_VIBRO_SWORD ||
           nBaseType == BASE_ITEM_WOOKIE_WARBLADE ||
           nBaseType == BASE_ITEM_FORCE_PIKE ) // DJS-OEi 8/19/2004
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Melee Weapon Equipped");
            return 1;
        }
    }


    /*
    if(GetIsObjectValid(oItem))
    {
        if( GetBaseItemType(oItem) == BASE_ITEM_BLASTER_CARBINE ||
           GetBaseItemType(oItem) == BASE_ITEM_BLASTER_PISTOL ||
           GetBaseItemType(oItem) == BASE_ITEM_BLASTER_RIFLE ||
           GetBaseItemType(oItem) == BASE_ITEM_BOWCASTER ||
           GetBaseItemType(oItem) == BASE_ITEM_DISRUPTER_PISTOL ||
           GetBaseItemType(oItem) == BASE_ITEM_DISRUPTER_RIFLE ||
           GetBaseItemType(oItem) == BASE_ITEM_HEAVY_BLASTER ||
           GetBaseItemType(oItem) == BASE_ITEM_HEAVY_REPEATING_BLASTER ||
           GetBaseItemType(oItem) == BASE_ITEM_HOLD_OUT_BLASTER ||
           GetBaseItemType(oItem) == BASE_ITEM_ION_BLASTER ||
           GetBaseItemType(oItem) == BASE_ITEM_ION_RIFLE ||
           GetBaseItemType(oItem) == BASE_ITEM_REPEATING_BLASTER ||
           GetBaseItemType(oItem) == BASE_ITEM_SONIC_PISTOL ||
           GetBaseItemType(oItem) == BASE_ITEM_SONIC_RIFLE )
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Ranged Weapon Equipped");
            return 2;
        }
        else if( GetBaseItemType(oItem) == BASE_ITEM_DOUBLE_BLADED_LIGHTSABER ||
           GetBaseItemType(oItem) == BASE_ITEM_DOUBLE_BLADED_SWORD ||
           GetBaseItemType(oItem) == BASE_ITEM_GAMMOREAN_BATTLEAXE ||
           GetBaseItemType(oItem) == BASE_ITEM_GHAFFI_STICK ||
           GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER ||
           GetBaseItemType(oItem) == BASE_ITEM_LONG_SWORD ||
           GetBaseItemType(oItem) == BASE_ITEM_QUARTER_STAFF ||
           GetBaseItemType(oItem) == BASE_ITEM_SHORT_LIGHTSABER ||
           GetBaseItemType(oItem) == BASE_ITEM_SHORT_SWORD ||
           GetBaseItemType(oItem) == BASE_ITEM_STUN_BATON ||
           GetBaseItemType(oItem) == BASE_ITEM_VIBRO_BLADE ||
           GetBaseItemType(oItem) == BASE_ITEM_VIBRO_DOUBLE_BLADE ||
           GetBaseItemType(oItem) == BASE_ITEM_VIBRO_SWORD ||
           GetBaseItemType(oItem) == BASE_ITEM_WOOKIE_WARBLADE ||
           GetBaseItemType(oItem) == BASE_ITEM_FORCE_PIKE ) // DJS-OEi 8/19/2004
        {
            //GN_MyPrintString("GENERIC DEBUG *************** Melee Weapon Equipped");
            return 1;
        }
    }
    */
    GN_MyPrintString("GENERIC DEBUG *************** Return No Weapon Type");
    return 0;
}

//RWT-OEI 08/28/04
//Just pass in the base item number and determine if it is
//ranged or melee weapon.
int GN_GetWeaponTypeFromBaseItem(int nBaseType)
{
    if( nBaseType == BASE_ITEM_BLASTER_CARBINE ||
       nBaseType == BASE_ITEM_BLASTER_PISTOL ||
       nBaseType == BASE_ITEM_BLASTER_RIFLE ||
       nBaseType == BASE_ITEM_BOWCASTER ||
       nBaseType == BASE_ITEM_DISRUPTER_PISTOL ||
       nBaseType == BASE_ITEM_DISRUPTER_RIFLE ||
       nBaseType == BASE_ITEM_HEAVY_BLASTER ||
       nBaseType == BASE_ITEM_HEAVY_REPEATING_BLASTER ||
       nBaseType == BASE_ITEM_HOLD_OUT_BLASTER ||
       nBaseType == BASE_ITEM_ION_BLASTER ||
       nBaseType == BASE_ITEM_ION_RIFLE ||
       nBaseType == BASE_ITEM_REPEATING_BLASTER ||
       nBaseType == BASE_ITEM_SONIC_PISTOL ||
       nBaseType == BASE_ITEM_SONIC_RIFLE )
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Ranged Weapon Equipped");
        return 2;
    }
    else if( nBaseType == BASE_ITEM_DOUBLE_BLADED_LIGHTSABER ||
       nBaseType == BASE_ITEM_DOUBLE_BLADED_SWORD ||
       nBaseType == BASE_ITEM_GAMMOREAN_BATTLEAXE ||
       nBaseType == BASE_ITEM_GHAFFI_STICK ||
       nBaseType == BASE_ITEM_LIGHTSABER ||
       nBaseType == BASE_ITEM_LONG_SWORD ||
       nBaseType == BASE_ITEM_QUARTER_STAFF ||
       nBaseType == BASE_ITEM_SHORT_LIGHTSABER ||
       nBaseType == BASE_ITEM_SHORT_SWORD ||
       nBaseType == BASE_ITEM_STUN_BATON ||
       nBaseType == BASE_ITEM_VIBRO_BLADE ||
       nBaseType == BASE_ITEM_VIBRO_DOUBLE_BLADE ||
       nBaseType == BASE_ITEM_VIBRO_SWORD ||
       nBaseType == BASE_ITEM_WOOKIE_WARBLADE ||
       nBaseType == BASE_ITEM_FORCE_PIKE ) // DJS-OEi 8/19/2004
    {
        //GN_MyPrintString("GENERIC DEBUG *************** Melee Weapon Equipped");
        return 1;
    }
    else
    {
        return 0;//Return 0 by default.
    }
}

//
//::///////////////////////////////////////////////
//:: Equip Appropriate Weapon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the NPC to eqyuip a melee = 1 or
    ranged = 2 weapon.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////

int GN_EquipAppropriateWeapon()
{
    object oItem;
    if(GetIsObjectValid(GetAttackTarget()) &&
       GetDistanceBetween(GetAttackTarget(), OBJECT_SELF) <= 3.0 &&
       GN_GetWeaponType() != 1 &&
       GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMAN &&
       !IsObjectPartyMember(OBJECT_SELF))
    {
        oItem = GetFirstItemInInventory();
        while(GetIsObjectValid(oItem))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Checking Melee Weapon");
            if( GetBaseItemType(oItem) == BASE_ITEM_DOUBLE_BLADED_LIGHTSABER ||
               GetBaseItemType(oItem) == BASE_ITEM_DOUBLE_BLADED_SWORD ||
               GetBaseItemType(oItem) == BASE_ITEM_GAMMOREAN_BATTLEAXE ||
               GetBaseItemType(oItem) == BASE_ITEM_GHAFFI_STICK ||
               GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER ||
               GetBaseItemType(oItem) == BASE_ITEM_LONG_SWORD ||
               GetBaseItemType(oItem) == BASE_ITEM_QUARTER_STAFF ||
               GetBaseItemType(oItem) == BASE_ITEM_SHORT_LIGHTSABER ||
               GetBaseItemType(oItem) == BASE_ITEM_SHORT_SWORD ||
               GetBaseItemType(oItem) == BASE_ITEM_STUN_BATON ||
               GetBaseItemType(oItem) == BASE_ITEM_VIBRO_BLADE ||
               GetBaseItemType(oItem) == BASE_ITEM_VIBRO_DOUBLE_BLADE ||
               GetBaseItemType(oItem) == BASE_ITEM_VIBRO_SWORD ||
               GetBaseItemType(oItem) == BASE_ITEM_WOOKIE_WARBLADE ||
               GetBaseItemType(oItem) == BASE_ITEM_FORCE_PIKE ) // DJS-OEI 8/19/2004
            {
                GN_MyPrintString("GENERIC DEBUG *************** Equipping Melee Weapon");
                //ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTWEAPON, TRUE);
                ActionEquipMostDamagingMelee();
                return TRUE;
            }
            else
            {
              oItem = GetNextItemInInventory();
            }
        }
    }
    else if(GN_GetWeaponType() != 2 &&
            GetLevelByClass(CLASS_TYPE_JEDICONSULAR) == 0 &&
            GetLevelByClass(CLASS_TYPE_JEDIGUARDIAN) == 0 &&
            GetLevelByClass(CLASS_TYPE_JEDISENTINEL) == 0 &&
            GetLevelByClass(CLASS_TYPE_JEDIWEAPONMASTER) == 0 &&    // DJS-OEI 8/19/2004
            GetLevelByClass(CLASS_TYPE_JEDIMASTER) == 0 &&          // DJS-OEI 8/19/2004
            GetLevelByClass(CLASS_TYPE_JEDIWATCHMAN) == 0 &&        // DJS-OEI 8/19/2004
            GetLevelByClass(CLASS_TYPE_SITHMARAUDER) == 0 &&        // DJS-OEI 8/19/2004
            GetLevelByClass(CLASS_TYPE_SITHLORD) == 0 &&            // DJS-OEI 8/19/2004
            GetLevelByClass(CLASS_TYPE_SITHASSASSIN) == 0 &&        // DJS-OEI 8/19/2004
            //GetIsObjectValid(GetAttackTarget()) &&
            GetDistanceBetween(GetAttemptedAttackTarget(), OBJECT_SELF) > 3.0 &&
            !IsObjectPartyMember(OBJECT_SELF))
    {
        oItem = GetFirstItemInInventory();
        while(GetIsObjectValid(oItem))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Checking Ranged Weapon");
            if( GetBaseItemType(oItem) == BASE_ITEM_BLASTER_CARBINE ||
               GetBaseItemType(oItem) == BASE_ITEM_BLASTER_PISTOL ||
               GetBaseItemType(oItem) == BASE_ITEM_BLASTER_RIFLE ||
               GetBaseItemType(oItem) == BASE_ITEM_BOWCASTER ||
               GetBaseItemType(oItem) == BASE_ITEM_DISRUPTER_PISTOL ||
               GetBaseItemType(oItem) == BASE_ITEM_DISRUPTER_RIFLE ||
               GetBaseItemType(oItem) == BASE_ITEM_HEAVY_BLASTER ||
               GetBaseItemType(oItem) == BASE_ITEM_HEAVY_REPEATING_BLASTER ||
               GetBaseItemType(oItem) == BASE_ITEM_HOLD_OUT_BLASTER ||
               GetBaseItemType(oItem) == BASE_ITEM_ION_BLASTER ||
               GetBaseItemType(oItem) == BASE_ITEM_ION_RIFLE ||
               GetBaseItemType(oItem) == BASE_ITEM_REPEATING_BLASTER ||
               GetBaseItemType(oItem) == BASE_ITEM_SONIC_PISTOL ||
               GetBaseItemType(oItem) == BASE_ITEM_SONIC_RIFLE )
              {
                GN_MyPrintString("GENERIC DEBUG *************** Equipping Ranged Weapon");
                //ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTWEAPON, TRUE);
                ActionEquipMostDamagingRanged();
                return TRUE;
              }
              else
              {
                oItem = GetNextItemInInventory();
              }
         }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Should not currently change weapons");
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Check Friendly Fire on Target
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes a target object and a radius and
    returns how many friendly targets
    are in that zone.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////

int GN_CheckFriendlyFireOnTarget(object oTarget, float fDistance = 4.0)
{
    int nCnt, nHD, nMyHD;
    nMyHD = GetHitDice(OBJECT_SELF);
    object oCheck = GetFirstObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oTarget));
    while(GetIsObjectValid(oCheck))
    {
        //P.W.(May 20, 2003) - Put a dead check here for whether the person being checked is dead.
        if(GetIsFriend(oCheck) && !GetIsDead(oCheck))
        {
            nCnt++;
        }
        oCheck = GetNextObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oTarget));
    }
    return nCnt;
}

//::///////////////////////////////////////////////
//:: Check For Enemies Around Target
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes a target object and a radius and
    returns how many targets of the enemy faction
    are in that zone.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////
int GN_CheckEnemyGroupingOnTarget(object oTarget, float fDistance = 4.0)
{
    int nCnt;
    object oCheck = GetFirstObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oTarget));
    while(GetIsObjectValid(oCheck))
    {
        //P.W.(May 20, 2003) - Put a dead check here for whether the person being checked is dead.
        if(GetIsEnemy(oCheck) && !GetIsDead(oCheck))
        {
            nCnt++;
        }
        oCheck = GetNextObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oTarget));
    }
    return nCnt;
}

//::///////////////////////////////////////////////
//:: Find Grenade Target
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and marks a group as a viable
    target for a grenade
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17m 2003
//:://////////////////////////////////////////////

object GN_FindGrenadeTarget()
{
    int nMinimum = 0;
    if(IsObjectPartyMember(OBJECT_SELF))
    {
        nMinimum = 1;
    }
    int nFriend = 0;
    int nEnemy = 0;
    int nEnemyCnt = 0;
    object oFinal;
    object oCheck = GetFirstObjectInShape(SHAPE_SPHERE, 40.0, GetLocation(OBJECT_SELF));
    while(GetIsObjectValid(oCheck))
    {
        if(GetObjectSeen(oCheck) && !GetIsDead(oCheck))
        {
            nFriend = GN_CheckFriendlyFireOnTarget(oCheck);
            nEnemy = GN_CheckEnemyGroupingOnTarget(oCheck);
            //GN_MyPrintString("GENERIC DEBUG *************** Friends " + GN_ITS(nFriend) + "Enemies" + GN_ITS(nEnemy));
            if(nEnemy > nMinimum && nFriend == 0 && nEnemyCnt < nEnemy)
            {
                oFinal = oCheck;
                nEnemyCnt = nEnemy;
            }
        }
        oCheck = GetNextObjectInShape(SHAPE_SPHERE, 40.0, GetLocation(OBJECT_SELF));
    }
    return oFinal;
}

//::///////////////////////////////////////////////
//:: Find Grenade Target
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Searches the area and marks a group as a
    viable target for a AOE force power
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17m 2003
//:://////////////////////////////////////////////

object GN_FindAOETarget()
{
    int nEnemy = 0;
    int nEnemyCnt = 0;
    object oFinal;
    object oCheck = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF));
    while(GetIsObjectValid(oCheck))
    {
        nEnemy = GN_CheckEnemyGroupingOnTarget(oCheck,4.0);
        if(nEnemy > 2 && nEnemyCnt < nEnemy)
        {
            oFinal = oCheck;
            nEnemyCnt = nEnemy;
        }
        oCheck = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF));
    }
    return oFinal;
}

//::///////////////////////////////////////////////
//:: Get Grenade Talent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a talent based on the target.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////

talent GN_GetGrenadeTalent(int nDroid = FALSE)
{
    // DJS-OEI 8/19/2004
    // Had to rewrite this function a bit
    // since we added new grenades as well as
    // wrist-fired rockets/darts.

    // Determine if this creature has a Wrist Launcher
    // equipped. If so, they will be able to use rockets.
    int bHasWristLauncher = 0;
    object oItem = GetItemInSlot( INVENTORY_SLOT_LEFTARM );
    if( GetIsObjectValid( oItem ) &&
        GetBaseItemType( oItem ) == BASE_ITEM_WRIST_LAUNCHER ) {
        bHasWristLauncher = 1;
    }
    else {
        oItem = GetItemInSlot( INVENTORY_SLOT_RIGHTARM );
        if( GetIsObjectValid( oItem ) &&
            GetBaseItemType( oItem ) == BASE_ITEM_WRIST_LAUNCHER ) {
            bHasWristLauncher = 1;
        }
    }

    talent tUse;
    talent tNull;
    // Grenades
    int n87, n88, n89, n90, n91, n92, n93, n94, n95, n186, n187;
    // Rockets and Darts
    int n185, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199;
    int nRand = 0;

    // Now, set the flags for the grenades we have on us that
    // would be effective against our target.
    // Perform a loop of 87 - 95.
    int nCnt = 87;
    for(nCnt; nCnt < 96; nCnt++)
    {
        tUse = TalentSpell(nCnt);
        if(GetCreatureHasTalent(tUse))
        {
            switch(nCnt)
            {
                case 87:    // Frag Grenade
                {
                    n87 = TRUE;
                    nRand++;
                }
                break;
                case 88:    // Stun Grenade
                {
                    if(nDroid == FALSE)
                    {
                        n88 = TRUE;
                        nRand++;
                    }
                }
                break;
                case 89:    // Thermal Detonator
                {
                    n89 = TRUE;
                    nRand++;
                }
                break;
                case 90:    // Poison Grenade
                {
                    if(nDroid == FALSE)
                    {
                        n90 = TRUE;
                        nRand++;
                    }
                }
                break;
                case 91:    // Sonic Grenade
                {
                    if(nDroid == FALSE)
                    {
                        n91 = TRUE;
                        nRand++;
                    }
                }
                break;
                case 92:    // Adhesive Grenade
                {
                    if(nDroid == FALSE)
                    {
                        n92 = TRUE;
                        nRand++;
                    }
                }
                break;
                case 93:    // Cryoban Grenade
                {
                    if(nDroid == FALSE)
                    {
                        n93 = TRUE;
                        nRand++;
                    }
                }
                break;
                case 94:    // Fire Grenade
                {
                    n94 = TRUE;
                    nRand++;
                }
                break;
                case 95:    // Ion Grenade
                {
                    if(nDroid == TRUE)
                    {
                        n95 = TRUE;
                        nRand++;
                    }
                }
                break;
            }
        }
    }
    // Manually handle 186 and 187.
    tUse = TalentSpell(186);    // Sonic Grenade 2
    if(GetCreatureHasTalent(tUse)) {
        if(nDroid == FALSE)
        {
            n186 = TRUE;
            nRand++;
        }
    }
    tUse = TalentSpell(187);    // Sonic Grenade 3
    if(GetCreatureHasTalent(tUse)) {
        if(nDroid == FALSE)
        {
            n187 = TRUE;
            nRand++;
        }
    }

    // Next, set the flags for the rockets/darts we have on us that
    // would be effective against our target. These only work if
    // we have a wrist launcher equipped.
    if( bHasWristLauncher ) {
        // Manually handle 185.
        tUse = TalentSpell(185);    // Explosive Rocket
        if(GetCreatureHasTalent(tUse)) {
            n185 = TRUE;
            nRand++;
        }

        // Perform a loop of 190 - 199.
        int nCnt = 190;
        for(nCnt; nCnt < 200; nCnt++)
        {
            tUse = TalentSpell(nCnt);
            if(GetCreatureHasTalent(tUse))
            {
                switch(nCnt)
                {
                    case 190:    // Piercing (Buster) Rocket
                    {
                        n190 = TRUE;
                        nRand++;
                    }
                    break;
                    case 191:    // Poison Rocket
                    {
                        if(nDroid == FALSE)
                        {
                            n191 = TRUE;
                            nRand++;
                        }
                    }
                    break;
                    case 192:    // Ion Rocket
                    {
                        if(nDroid == TRUE)
                        {
                            n192 = TRUE;
                            nRand++;
                        }
                    }
                    break;
                    case 193:    // Plasma Rocket
                    {
                        n193 = TRUE;
                        nRand++;
                    }
                    break;
                    case 194:    // Concussion Rocket
                    {
                        n194 = TRUE;
                        nRand++;
                    }
                    break;
                    case 195:    // Poison Dart
                    {
                        if(nDroid == FALSE)
                        {
                            n195 = TRUE;
                            nRand++;
                        }
                    }
                    break;
                    case 196:    // Kyber Dart
                    {
                        if(nDroid == FALSE)
                        {
                            n196 = TRUE;
                            nRand++;
                        }
                    }
                    break;
                    case 197:    // Paralysis Rocket
                    {
                        if(nDroid == FALSE)
                        {
                            n197 = TRUE;
                            nRand++;
                        }
                    }
                    break;
                    case 198:    // Tranquilizer Dart
                    {
                        if(nDroid == FALSE)
                        {
                            n198 = TRUE;
                            nRand++;
                        }
                    }
                    break;
                    case 199:    // Lawn Dart
                    {
                        n199 = TRUE;
                        nRand++;
                    }
                    break;
                }
            }
        }
    }

    // We now have a number (nRand) representing the number
    // of various grenades/rockets/darts we can use. Randomly
    // choose one of these to use starting with the rockets
    // since they are cooler than grenades.
    int nRoll;
    if(nRand > 0)
    {
        nRoll = Random(nRand) + 1;
    }
    else
    {
        nRoll = 0;
    }
    //GN_MyPrintString("GENERIC DEBUG *************** Roll = " + GN_ITS(nRoll));
    if(nRand > 0)
    {
        //EXPLOSIVE ROCKET
        if(nRoll == 1 && n185 == TRUE)
        {
            return tUse = TalentSpell(185);
        }
        if(nRoll > 1 && n185 == TRUE)
        {
            nRoll--;
        }

        //PIERCING (BUSTER) ROCKET
        if(nRoll == 1 && n190 == TRUE)
        {
            return tUse = TalentSpell(190);
        }
        if(nRoll > 1 && n190 == TRUE)
        {
            nRoll--;
        }

        //POISON ROCKET
        if(nRoll == 1 && n191 == TRUE)
        {
            return tUse = TalentSpell(191);
        }
        if(nRoll > 1 && n191 == TRUE)
        {
            nRoll--;
        }

        //ION ROCKET
        if(nRoll == 1 && n192 == TRUE)
        {
            return tUse = TalentSpell(192);
        }
        if(nRoll > 1 && n192 == TRUE)
        {
            nRoll--;
        }

        //PLASMA ROCKET
        if(nRoll == 1 && n193 == TRUE)
        {
            return tUse = TalentSpell(193);
        }
        if(nRoll > 1 && n193 == TRUE)
        {
            nRoll--;
        }

        //CONCUSSION ROCKET
        if(nRoll == 1 && n194 == TRUE)
        {
            return tUse = TalentSpell(194);
        }
        if(nRoll > 1 && n194 == TRUE)
        {
            nRoll--;
        }

        //POISON DART
        if(nRoll == 1 && n195 == TRUE)
        {
            return tUse = TalentSpell(195);
        }
        if(nRoll > 1 && n195 == TRUE)
        {
            nRoll--;
        }

        //KYBER DART
        if(nRoll == 1 && n196 == TRUE)
        {
            return tUse = TalentSpell(196);
        }
        if(nRoll > 1 && n196 == TRUE)
        {
            nRoll--;
        }

        //PARALYSIS DART
        if(nRoll == 1 && n197 == TRUE)
        {
            return tUse = TalentSpell(197);
        }
        if(nRoll > 1 && n197 == TRUE)
        {
            nRoll--;
        }

        //TRANQUILIZER DART
        if(nRoll == 1 && n198 == TRUE)
        {
            return tUse = TalentSpell(198);
        }
        if(nRoll > 1 && n198 == TRUE)
        {
            nRoll--;
        }

        //LAWN DART
        if(nRoll == 1 && n199 == TRUE)
        {
            return tUse = TalentSpell(199);
        }
        if(nRoll > 1 && n199 == TRUE)
        {
            nRoll--;
        }

        //FRAG GRENADE
        if(nRoll == 1 && n87 == TRUE)
        {
            return tUse = TalentSpell(87);
        }
        if(nRoll > 1 && n87 == TRUE)
        {
            nRoll--;
        }
        //STUN GRENADE
        if(nRoll == 1 && n88 == TRUE)
        {
            return tUse = TalentSpell(88);
        }
        if(nRoll > 1 && n88 == TRUE)
        {
            nRoll--;
        }
        //THERMAL DETONATOR
        if(nRoll == 1 && n89 == TRUE)
        {
            return tUse = TalentSpell(89);
        }
        if(nRoll > 1 && n89 == TRUE)
        {
            nRoll--;
        }
        //POISON
        if(nRoll == 1 && n90 == TRUE)
        {
            return tUse = TalentSpell(90);
        }
        if(nRoll > 1 && n90 == TRUE)
        {
            nRoll--;
        }
        //SONIC
        if(nRoll == 1 && n91 == TRUE)
        {
            return tUse = TalentSpell(91);
        }
        if(nRoll > 1 && n91 == TRUE)
        {
            nRoll--;
        }
        //ADHESIVE
        if(nRoll == 1 && n92 == TRUE)
        {
            return tUse = TalentSpell(92);
        }
        if(nRoll > 1 && n92 == TRUE)
        {
            nRoll--;
        }
        //CRYOBAN
        if(nRoll == 1 && n93 == TRUE)
        {
            return tUse = TalentSpell(93);
        }
        if(nRoll > 1 && n93 == TRUE)
        {
            nRoll--;
        }
        //PLASMA
        if(nRoll == 1 && n94 == TRUE)
        {
            return tUse = TalentSpell(94);
        }
        if(nRoll > 1 && n94 == TRUE)
        {
            nRoll--;
        }

        // DJS-OEI 2/26/2004
        //SONIC 2
        if(nRoll == 1 && n186 == TRUE)
        {
            return tUse = TalentSpell(186);
        }
        if(nRoll > 1 && n186 == TRUE)
        {
            nRoll--;
        }
        //SONIC 3
        if(nRoll == 1 && n187 == TRUE)
        {
            return tUse = TalentSpell(187);
        }
        if(nRoll > 1 && n187 == TRUE)
        {
            nRoll--;
        }
    }
    GN_MyPrintString("GENERIC DEBUG *************** Grenade Selection Failure");

    return tNull;
}

//::///////////////////////////////////////////////
//:: Get Boss Combat Move
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a talent for the boss to perform
    in combat.  This function will try and pick a
    talent which will inflict maximum damage
    on the party via area of effect spells, grenades
    and debilitating effects.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 2, 2003
//:://////////////////////////////////////////////
talent GN_GetBossCombatMove(int nBossAttackType, int nDroid = FALSE)
{
    talent tInvalid;
    talent tUse;
    int bValid = FALSE;
    if(nBossAttackType == SW_BOSS_ATTACK_TYPE_GRENADE || nBossAttackType == SW_BOSS_ATTACK_ANY)
    {
        tUse = GN_GetGrenadeTalent(nDroid);
        if(GetIsTalentValid(tUse))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Grenade Talent Chosen");
            return tUse;
        }
    }
    if(nBossAttackType == SW_BOSS_ATTACK_TYPE_FORCE_POWER || nBossAttackType == SW_BOSS_ATTACK_ANY)
    {
        tUse = GN_GetAOEForcePower(nDroid);
        if(GetIsTalentValid(tUse))
        {
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Force Power Talent Chosen");
            return tUse;
        }
    }
    if(nBossAttackType == SW_BOSS_ATTACK_TYPE_NPC || nBossAttackType == SW_BOSS_ATTACK_ANY)
    {
        if(d100() > 50)
        {
            tUse = GN_GetTargetedForcePower(nDroid);
            if(GetIsTalentValid(tUse))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Targeted Force Power Talent Chosen");
                return tUse;
            }
            tUse = GN_GetAOEForcePower(nDroid);
            if(GetIsTalentValid(tUse))
            {
                GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Force Power Talent Chosen");
                return tUse;
            }
        }
        if(GN_GetWeaponType() == 1)
        {
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Melee Feat Talent Chosen");
            tUse = GetCreatureTalentRandom(0x1104); //Only melee feats use this code
        }
        else
        {
            GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Range Feat Talent Chosen");
            tUse = GetCreatureTalentRandom(0x1111); //Only ranged feats use this code
        }
        if(GetIsTalentValid(tUse))
        {
            return tUse;
        }
    }
    else if(nBossAttackType == SW_BOSS_ATTACK_TYPE_PC || nBossAttackType == SW_BOSS_ATTACK_ANY)
    {
        if(d100() > 70)
        {
            tUse = GN_GetTargetedForcePower(nDroid);
            if(GetIsTalentValid(tUse))
            {
                return tUse;
            }
            tUse = GN_GetAOEForcePower(nDroid);
            if(GetIsTalentValid(tUse))
            {
                return tUse;
            }
        }
        tUse = GetCreatureTalentRandom(0x1104); //Only melee feats use this code
        if(GetIsTalentValid(tUse))
        {
            return tUse;
        }
        GN_MyPrintString("GENERIC DEBUG *************** Boss AI: No Feats Available");
    }
    //Comment this out so that the boss AI handles the failure not this function.
    /*
    if(!GetIsTalentValid(tUse) && nBossAttackType != SW_BOSS_ATTACK_ANY)
    {
        tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_ANY);
    }
    */
    return tUse;
}

//::///////////////////////////////////////////////
//:: Get AOE Force Power
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks and returns a random force power that
    can effect more than 1 target.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 2, 2003
//:://////////////////////////////////////////////
talent GN_GetAOEForcePower(int nDroid = FALSE)
{
    talent tUse;
    int nHorror, nInsanity, nStorm, nWave, nSaber, nLightning, nSleep, nStunDroid, nKillDroid, nHowl, nCnt;
    // DJS-OEI 8/19/2004
    // New spells.
    int nScream1, nScream2, nScream3;

    //MODIFIED by Preston Watamaniuk on April 27, 2003
    //Removed Death Field so that it would be used exlusively for Healing.

    //MODIFIED by Preston Watamaniuk on May 14, 2003
    //Put a check into make sure that the same AOE power is not used over and over.
    int nLastForcePower = GetLastForcePowerUsed(OBJECT_SELF);
    GN_MyPrintString("GENERIC DEBUG *************** Last Force Power Used = " + GN_ITS(nLastForcePower));

    //THIS SECTION DETERMINES WHICH POWERS ARE APPLICABLE
    if(GetHasSpell(FORCE_POWER_HORROR) && nDroid == FALSE && nLastForcePower != FORCE_POWER_HORROR)
    {
        nHorror = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_INSANITY) && nDroid == FALSE && nLastForcePower != FORCE_POWER_INSANITY)
    {
        nInsanity = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_FORCE_STORM) && nLastForcePower != FORCE_POWER_FORCE_STORM)
    {
        nStorm = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_FORCE_WAVE) && nLastForcePower != FORCE_POWER_FORCE_WAVE)
    {
        nWave = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_LIGHT_SABER_THROW_ADVANCED) && nLastForcePower != FORCE_POWER_LIGHT_SABER_THROW_ADVANCED)
    {
        nSaber = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_LIGHTNING) && nLastForcePower != FORCE_POWER_LIGHTNING)
    {
        nLightning = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_SLEEP) && nDroid == FALSE && nLastForcePower != FORCE_POWER_SLEEP)//Now Mass Stasis
    {
        nSleep = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_DROID_STUN) && nDroid == TRUE && nLastForcePower != FORCE_POWER_DROID_STUN)
    {
        nStunDroid = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_DROID_DESTROY) && nDroid == TRUE && nLastForcePower != FORCE_POWER_DROID_DESTROY)
    {
        nKillDroid = 1;
        nCnt++;
    }
    talent tHowl  = TalentSpell(131);
    if(GetCreatureHasTalent(tHowl)) //Sonic Howl
    {
        nHowl = 1;
        nCnt++;
    }

    // DJS-OEI 8/19/2004
    if(GetHasSpell(FORCE_POWER_FORCE_SCREAM) && nDroid == FALSE && nLastForcePower != FORCE_POWER_FORCE_SCREAM)
    {
        nScream1 = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM) && nDroid == FALSE && nLastForcePower != FORCE_POWER_IMPROVED_FORCE_SCREAM)
    {
        nScream2 = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_MASTER_FORCE_SCREAM) && nDroid == FALSE && nLastForcePower != FORCE_POWER_MASTER_FORCE_SCREAM)
    {
        nScream3 = 1;
        nCnt++;
    }

    //THIS SECTION DETERMINES WHICH POWER TO USE
    int nRoll;
    if(nCnt > 0)
    {
        nRoll = Random(nCnt) + 1;
    }
    else
    {
        nRoll = 0;
    }

    //Horror
    if(nHorror == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_HORROR);
        nRoll--;
    }
    if(nHorror == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Insanity
    if(nInsanity == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_INSANITY);
        nRoll--;
    }
    if(nHorror == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Force Storm
    if(nStorm == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_FORCE_STORM);
        nRoll--;
    }
    if(nStorm == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Force Wave
    if(nWave == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_FORCE_WAVE);
        nRoll--;
    }
    if(nWave == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Advanced Saber Throw
    if(nSaber == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_LIGHT_SABER_THROW_ADVANCED);
        nRoll--;
    }
    if(nSaber == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Lightning
    if(nLightning == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_LIGHTNING);
        nRoll--;
    }
    if(nLightning == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Mass Stasis
    if(nSleep == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_SLEEP);
        nRoll--;
    }
    if(nSleep == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Stun Droid
    if(nStunDroid == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_DROID_STUN);
        nRoll--;
    }
    if(nStunDroid == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Destroy Droid
    if(nKillDroid == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_DROID_DESTROY);
        nRoll--;
    }
    if(nKillDroid == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Sonic Howl
    if(nKillDroid == 1 && nRoll == 1)
    {
        tUse = TalentSpell(131);
        nRoll--;
    }
    if(nHowl == 1 && nRoll > 1)
    {
        nRoll--;
    }
    // DJS-OEI 8/19/2004
    //Scream 1
    if(nScream1 == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_FORCE_SCREAM);
        nRoll--;
    }
    if(nScream1 == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Scream 2
    if(nScream2 == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM);
        nRoll--;
    }
    if(nScream2 == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Scream 3
    if(nScream3 == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_MASTER_FORCE_SCREAM);
        nRoll--;
    }
    if(nScream3 == 1 && nRoll > 1)
    {
        nRoll--;
    }
    GN_MyPrintString("GENERIC DEBUG *************** Force Power Returned = " + GN_ITS(GetIdFromTalent(tUse)));
    return tUse;
}

//::///////////////////////////////////////////////
//:: Get Targeted Force Power
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks and returns a random force power that
    can effect 1 target.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 2, 2003
//:://////////////////////////////////////////////
talent GN_GetTargetedForcePower(int nDroid = FALSE)
{
    talent tUse;
    int nChoke, nAfflict, nPlague, nPush, nWind, nLightning, nKill, nHorror, nWound, nStasis, nDroid, nKnock, nHowl, nCnt;
    // DJS-OEI 8/19/2004
    int nScream1, nScream2, nScream3;

    if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
    {
        tUse = GetCreatureTalentRandom(0x8000);
        if(GetIsTalentValid(tUse))
        {
            return tUse;
        }
    }
    //MODIFIED by Preston Watamaniuk on April 27, 2003
    //Removed Drain Life so that it would be used exlusively for Healing.

    if(GetHasSpell(FORCE_POWER_CHOKE) && nDroid == FALSE)
    {
        nChoke = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_AFFLICTION) && nDroid == FALSE)
    {
        nAfflict = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_PLAGUE) && nDroid == FALSE)
    {
        nPlague = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_FORCE_PUSH))
    {
        nPush = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_FORCE_WHIRLWIND))
    {
        nWind = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_LIGHTNING))
    {
        nLightning = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_KILL) && nDroid == FALSE)
    {
        nKill = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_HORROR) && nDroid == FALSE)
    {
        nHorror = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_WOUND) && nDroid == FALSE)
    {
        nWound = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_HOLD))
    {
        nStasis = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_DROID_DISABLE) && nDroid == TRUE)
    {
        nDroid = 1;
        nCnt++;
    }
    talent tSlam  = TalentSpell(83);
    if(GetCreatureHasTalent(tSlam)) //Monster Slam
    {
        nKnock = 1;
        nCnt++;
    }

    // DJS-OEI 8/19/2004
    if(GetHasSpell(FORCE_POWER_FORCE_SCREAM) && nDroid == FALSE)
    {
        nScream1 = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM) && nDroid == FALSE)
    {
        nScream2 = 1;
        nCnt++;
    }
    if(GetHasSpell(FORCE_POWER_MASTER_FORCE_SCREAM) && nDroid == FALSE)
    {
        nScream3 = 1;
        nCnt++;
    }

    //THIS SECTION DETERMINES WHICH POWER TO USE
    int nRoll;
    if(nCnt > 0)
    {
        nRoll = Random(nCnt) + 1;
    }
    else
    {
        nRoll = 0;
    }
    //Choke
    if(nChoke == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_CHOKE);
        nRoll--;
    }
    if(nChoke == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Affliction
    if(nAfflict == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_AFFLICTION);
        nRoll--;
    }
    if(nAfflict == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Plague
    if(nPlague == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_PLAGUE);
        nRoll--;
    }
    if(nPlague == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Force Push
    if(nPush == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_FORCE_PUSH);
        nRoll--;
    }
    if(nPush == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Force Whirlwind
    if(nWind == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_FORCE_WHIRLWIND);
        nRoll--;
    }
    if(nWind == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Lightning
    if(nLightning == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_LIGHTNING);
        nRoll--;
    }
    if(nLightning == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Kill
    if(nKill == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_KILL);
        nRoll--;
    }
    if(nKill == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Horror
    if(nHorror == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_HORROR);
        nRoll--;
    }
    if(nHorror == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Wound
    if(nWound== 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_WOUND);
        nRoll--;
    }
    if(nWound == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Stasis
    if(nStasis== 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_HOLD);
        nRoll--;
    }
    if(nStasis == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Disable Droid
    if(nDroid== 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_DROID_DISABLE);
        nRoll--;
    }
    if(nDroid == 1 && nRoll > 1)
    {
        nRoll--;
    }
    //Monster Slam
    if(nKnock == 1 && nRoll == 1)
    {
        tUse = TalentSpell(83);
        nRoll--;
    }
    if(nKnock == 1 && nRoll > 1)
    {
        nRoll--;
    }
    // DJS-OEI 8/19/2004
    // Scream 1
    if(nScream1 == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_FORCE_SCREAM);
        nRoll--;
    }
    if(nScream1 == 1 && nRoll > 1)
    {
        nRoll--;
    }
    // Scream 2
    if(nScream2 == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_IMPROVED_FORCE_SCREAM);
        nRoll--;
    }
    if(nScream2 == 1 && nRoll > 1)
    {
        nRoll--;
    }
    // Scream 3
    if(nScream3 == 1 && nRoll == 1)
    {
        tUse = TalentSpell(FORCE_POWER_MASTER_FORCE_SCREAM);
        nRoll--;
    }
    if(nScream3 == 1 && nRoll > 1)
    {
        nRoll--;
    }

    return tUse;
}

//::///////////////////////////////////////////////
//:: Get Active Party Member Count
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the number of party members who
    are active
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 2, 2003
//:://////////////////////////////////////////////
int GN_GetActivePartyMemberCount()
{
    object oNPC1 = GetPartyMemberByIndex(0);
    object oNPC2 = GetPartyMemberByIndex(1);
    object oNPC3 = GetPartyMemberByIndex(2);

    int nCnt = 0;

    if(GetIsObjectValid(oNPC1) && GetCurrentHitPoints(oNPC1) > 0 && GetObjectSeen(oNPC1))
    {
        nCnt++;
    }
    if(GetIsObjectValid(oNPC2) && GetCurrentHitPoints(oNPC2) > 0 && GetObjectSeen(oNPC2))
    {
        nCnt++;
    }
    if(GetIsObjectValid(oNPC3) && GetCurrentHitPoints(oNPC3) > 0 && GetObjectSeen(oNPC3))
    {
        nCnt++;
    }
    return nCnt;
}

//::///////////////////////////////////////////////
//:: Get Active Party Member
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns a party member who is active a not
    currently controlled by the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 2, 2003
//:://////////////////////////////////////////////
/*
    MODIFIED by Preston Watamaniuk on March 8, 2003

    Added some functionality so that the Drain Life
    will be targeted on the 0 Index as well as the
    other party members. Also if Drain = TRUE then
    no droids will be returned.

    This function will return the nearest non-droid
    enemy if the party is freindly.
*/
//:://////////////////////////////////////////////
object GN_GetActivePartyMember(int nDrainTarget = FALSE)
{
    object oNPC1 = GetPartyMemberByIndex(0);
    object oNPC2 = GetPartyMemberByIndex(1);
    object oNPC3 = GetPartyMemberByIndex(2);
    object oTarget;

    int nCnt = 0;
    int nRoll;
    int nNPC1 = FALSE;
    int nNPC2 = FALSE;
    int nNPC3 = FALSE;

    if(GetIsObjectValid(oNPC2) && GetCurrentHitPoints(oNPC2) > 0 && GetObjectSeen(oNPC2))
    {
        if(GetRacialType(oNPC2) != RACIAL_TYPE_DROID || nDrainTarget == FALSE)
        {
            nCnt++;
            nNPC2 = TRUE;
        }
    }
    if(GetIsObjectValid(oNPC3) && GetCurrentHitPoints(oNPC3) > 0 && GetObjectSeen(oNPC3))
    {
        if(GetRacialType(oNPC3) != RACIAL_TYPE_DROID || nDrainTarget == FALSE)
        {
            nCnt++;
            nNPC3 = TRUE;
        }
    }

    if(nDrainTarget == TRUE)
    {
        if(GetIsObjectValid(oNPC1) && GetCurrentHitPoints(oNPC1) > 0 && GetObjectSeen(oNPC1))
        {
            if(GetRacialType(oNPC1) != RACIAL_TYPE_DROID)
            {
                nCnt++;
                nNPC1 = TRUE;
            }
        }
    }

    if(nCnt == 0)
    {
        oTarget = OBJECT_INVALID;
    }
    else if(nCnt == 1)
    {
        if(nNPC2 == TRUE){oTarget = oNPC2;}
        else if(nNPC3 == TRUE){oTarget = oNPC3;}
        else if(nNPC1 == TRUE){oTarget = oNPC1;}
    }
    else if(nCnt == 2)
    {
        nRoll = d100();
        if(nNPC1 == TRUE && nNPC2 == TRUE)
        {
            if(nRoll > 50){oTarget = oNPC1;}
            else{oTarget = oNPC2;}
        }
        else if(nNPC1 == TRUE && nNPC3 == TRUE)
        {
            if(nRoll > 50){oTarget = oNPC1;}
            else{oTarget = oNPC3;}
        }
        else if(nNPC2 == TRUE && nNPC3 == TRUE)
        {
            if(nRoll > 50){oTarget = oNPC2;}
            else{oTarget = oNPC3;}
        }
    }
    else if(nCnt == 3)
    {
        nRoll = d100();
        if(nRoll <= 33){oTarget = oNPC1;}
        else if(nRoll > 33 && nRoll <= 66) {oTarget = oNPC2;}
        else if(nRoll > 66 && nRoll <= 100) {oTarget = oNPC3;}
    }

    //MODIFIED by Preston Watamaniuk on May 18, 2003
    //Changed the racial type to Human from Droid.
    if(!GetIsEnemy(oTarget, OBJECT_SELF) && nDrainTarget == TRUE)
    {
        GN_MyPrintString("GENERIC DEBUG *************** Searching for Alternate Target");
        oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMAN);
        GN_MyPrintString("GENERIC DEBUG *************** Alternate Target = " + GN_ReturnDebugName(oTarget));
    }
    GN_MyPrintString("GENERIC DEBUG *************** Heal Drain Target = " + GN_ITS(nDrainTarget));
    GN_MyPrintString("GENERIC DEBUG *************** Get Active Party Member: " + GN_ReturnDebugName(oTarget));
    return oTarget;
}

//::///////////////////////////////////////////////
//:: Return Active Party Member
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This function returns an active party member.
    They must not be dead.  The debilitated
    parameter will ignore those party members
    already debilitated.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2003
//:://////////////////////////////////////////////
object GN_ReturnActivePartyMember(int nDebil = FALSE)
{
    object oNPC1 = GetPartyMemberByIndex(0);
    object oNPC2 = GetPartyMemberByIndex(1);
    object oNPC3 = GetPartyMemberByIndex(2);
    object oTarget;

    int nCnt = 0;
    int nRoll;
    int nNPC1 = FALSE;
    int nNPC2 = FALSE;
    int nNPC3 = FALSE;

    if(GetIsObjectValid(oNPC2) && GetCurrentHitPoints(oNPC2) > 0 && GetObjectSeen(oNPC2))
    {
        if(nDebil == FALSE || !GetIsDebilitated(oNPC2))
        {
            nCnt++;
            nNPC2 = TRUE;
        }
    }
    if(GetIsObjectValid(oNPC3) && GetCurrentHitPoints(oNPC3) > 0 && GetObjectSeen(oNPC3))
    {
        if(nDebil == FALSE || !GetIsDebilitated(oNPC2))
        {
            nCnt++;
            nNPC3 = TRUE;
        }
    }

    if(GetIsObjectValid(oNPC1) && GetCurrentHitPoints(oNPC1) > 0 && GetObjectSeen(oNPC1))
    {
        if(nDebil == FALSE || !GetIsDebilitated(oNPC2))
        {
            nCnt++;
            nNPC1 = TRUE;
        }
    }
    if(nCnt == 0)
    {
        oTarget = OBJECT_INVALID;
    }
    else if(nCnt == 1)
    {
        if(nNPC2 == TRUE){oTarget = oNPC2;}
        else if(nNPC3 == TRUE){oTarget = oNPC3;}
        else if(nNPC1 == TRUE){oTarget = oNPC1;}
    }
    else if(nCnt == 2)
    {
        nRoll = d100();
        if(nNPC1 == TRUE && nNPC2 == TRUE)
        {
            if(nRoll > 50){oTarget = oNPC1;}
            else{oTarget = oNPC2;}
        }
        else if(nNPC1 == TRUE && nNPC3 == TRUE)
        {
            if(nRoll > 50){oTarget = oNPC1;}
            else{oTarget = oNPC3;}
        }
        else if(nNPC2 == TRUE && nNPC3 == TRUE)
        {
            if(nRoll > 50){oTarget = oNPC2;}
            else{oTarget = oNPC3;}
        }
    }
    else if(nCnt == 3)
    {
        nRoll = d100();
        if(nRoll <= 33){oTarget = oNPC1;}
        else if(nRoll > 33 && nRoll <= 66) {oTarget = oNPC2;}
        else if(nRoll > 66 && nRoll <= 100) {oTarget = oNPC3;}
    }

    return oTarget;
}

//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Generic Include Debug Commands
//:: Copyright (c) 2001 Bioware Corp.
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void GN_MySpeakString(string sString)
{
    //SpeakString(sString);
}

void GN_AssignPCDebugString(string sString)
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetIsObjectValid(oPC))
    {
        AssignCommand(oPC, SpeakString(sString));
    }
}
void GN_PostString(string sString = "",int x = 10,int y = 10,float fShow = 4.0)
{
    //AurPostString(sString,x,y,fShow);
}

void GN_MyPrintString(string sString)
{
    if(!ShipBuild())
    {
        PrintString(sString);
    }
}

void GN_PostShoutString(string sString = "",int x = 10,int y = 10,float fShow = 4.0)
{
    //AurPostString(sString,x,y,fShow);
}

void GN_MyPrintShoutString(string sString)
{
    if(!ShipBuild())
    {
        //PrintString(sString);
    }
}


void GN_PrintShoutType(object oShouter, int nShout)
{
    /*
    //I WAS ATTACKED
    if(nShout == 1)
    {
        GN_MyPrintString("GENERIC DEBUG *************** " + GetName(oShouter) + "/" + ObjectToString(oShouter) + " ATTACKED");
    }
    //I WAS KILLED
    else if(nShout == 3)
    {
        GN_MyPrintString("GENERIC DEBUG *************** " + GetName(oShouter) + "/" + ObjectToString(oShouter) + " KILLED");
    }
    //CALL TO ARMS
    else if(nShout == 6)
    {
        GN_MyPrintString("GENERIC DEBUG *************** " + GetName(oShouter) + "/" + ObjectToString(oShouter) + " CALL TO ARMS");
    }
    //SUPRESS FORCE
    else if(nShout == 9)
    {
        GN_MyPrintString("GENERIC DEBUG *************** " + GetName(oShouter) + "/" + ObjectToString(oShouter) + " WANTS FORCE SUPPRESSED");
    }
    //FLEE FROM GRENADES
    else if(nShout == 12)
    {
        GN_MyPrintString("GENERIC DEBUG *************** " + GetName(oShouter) + "/" + ObjectToString(oShouter) + " GRENADE THROWN");
    }
    //I SEE AN ENEMY
    else if(nShout == 15)
    {
        GN_MyPrintString("GENERIC DEBUG *************** " + GetName(oShouter) + "/" + ObjectToString(oShouter) + " SEES AN ENEMY");
    }
    */
}

string GN_ReturnDebugName(object oTarget)
{
    string sName = GetName(oTarget) + "_" + ObjectToString(oTarget);
    return sName;
}

string GN_FetchComboString(int nCombo)
{
    if(nCombo == SW_COMBO_RANGED_FEROCIOUS){return "SW_COMBO_RANGED_FEROCIOUS";}
    else if(nCombo == SW_COMBO_RANGED_AGGRESSIVE){return "SW_COMBO_RANGED_AGGRESSIVE";}
    else if(nCombo == SW_COMBO_RANGED_DISCIPLINED){return "SW_COMBO_RANGED_DISCIPLINED";}
    else if(nCombo == SW_COMBO_RANGED_CAUTIOUS){return "SW_COMBO_RANGED_CAUTIOUS";}
    else if(nCombo == SW_COMBO_MELEE_FEROCIOUS){return "SW_COMBO_MELEE_FEROCIOUS";}
    else if(nCombo == SW_COMBO_MELEE_AGGRESSIVE){return "SW_COMBO_MELEE_AGGRESSIVE";}
    else if(nCombo == SW_COMBO_MELEE_DISCIPLINED){return "SW_COMBO_MELEE_DISCIPLINED";}
    else if(nCombo == SW_COMBO_MELEE_CAUTIOUS){return "SW_COMBO_MELEE_CAUTIOUS";}
    else if(nCombo == SW_COMBO_BUFF_PARTY){return "SW_COMBO_BUFF_PARTY";}
    else if(nCombo == SW_COMBO_BUFF_DEBILITATE){return "SW_COMBO_BUFF_DEBILITATE";}
    else if(nCombo == SW_COMBO_BUFF_DAMAGE){return "SW_COMBO_BUFF_DAMAGE";}
    else if(nCombo == SW_COMBO_BUFF_DEBILITATE_DESTROY){return "SW_COMBO_BUFF_DEBILITATE_DESTROY";}
    else if(nCombo == SW_COMBO_SUPRESS_DEBILITATE_DESTROY){return "SW_COMBO_SUPRESS_DEBILITATE_DESTROY";}
    else if(nCombo == SW_COMBO_SITH_ATTACK){return "SW_COMBO_SITH_ATTACK";}
    else if(nCombo == SW_COMBO_BUFF_ATTACK){return "SW_COMBO_BUFF_ATTACK";}
    else if(nCombo == SW_COMBO_SITH_CONFOUND){return "SW_COMBO_SITH_CONFOUND";}
    else if(nCombo == SW_COMBO_JEDI_SMITE){return "SW_COMBO_JEDI_SMITE";}
    else if(nCombo == SW_COMBO_SITH_TAUNT){return "SW_COMBO_SITH_TAUNT";}
    else if(nCombo == SW_COMBO_SITH_BLADE){return "SW_COMBO_SITH_BLADE";}
    else if(nCombo == SW_COMBO_SITH_CRUSH){return "SW_COMBO_SITH_CRUSH";}
    else if(nCombo == SW_COMBO_JEDI_CRUSH){return "SW_COMBO_JEDI_CRUSH";}
    else if(nCombo == SW_COMBO_SITH_BRUTALIZE){return "SW_COMBO_SITH_BRUTALIZE";}
    else if(nCombo == SW_COMBO_SITH_DRAIN){return "SW_COMBO_SITH_DRAIN";}
    else if(nCombo == SW_COMBO_SITH_ESCAPE){return "SW_COMBO_SITH_ESCAPE";}
    else if(nCombo == SW_COMBO_JEDI_BLITZ){return "SW_COMBO_JEDI_BLITZ";}
    else if(nCombo == SW_COMBO_SITH_SPIKE){return "SW_COMBO_SITH_SPIKE";}
    else if(nCombo == SW_COMBO_SITH_SCYTHE){return "SW_COMBO_SITH_SCYTHE";}
    else if(nCombo == SW_COMBO_DROID_UTILITIES){return "SW_COMBO_DROID_UTILITIES";}
    return "NO COMBO SELECTED";
}


//::///////////////////////////////////////////////
//:: Return AI Style
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the AI style in a string
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 28, 2003
//:://////////////////////////////////////////////

string GN_ReturnAIStyle(object oTarget = OBJECT_SELF)
{
    if(GetNPCAIStyle(oTarget) == NPC_AISTYLE_AID)
    {
        return "NPC_AISTYLE_AID";
    }
    else if(GetNPCAIStyle(oTarget) == NPC_AISTYLE_GRENADE_THROWER)
    {
        return "NPC_AISTYLE_GRENADE_THROWER";
    }
    else if(GetNPCAIStyle(oTarget) == NPC_AISTYLE_JEDI_SUPPORT)
    {
        return "NPC_AISTYLE_JEDI_SUPPORT";
    }
    else if(GetNPCAIStyle(oTarget) == NPC_AISTYLE_DEFAULT_ATTACK)
    {
        return "NPC_AISTYLE_DEFAULT_ATTACK";
    }
    int nAI = GetNPCAIStyle(oTarget);
    string sAI = IntToString(nAI);
    sAI = "No Valid AI Set, state = " + sAI;
    return sAI;
}

string GN_ITS(int sFutureString)
{
    return IntToString(sFutureString);
}

