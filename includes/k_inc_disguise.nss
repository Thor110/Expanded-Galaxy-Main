//:: k_inc_disguise
/*
    This script contains all functions necessary to add and
    remove disguises on all party members.
*/

void DonEnvironmentSuit() {

    object oPC;
    int nMax = GetPartyMemberCount();
    int nIdx;
    effect eChange = EffectDisguise(DISGUISE_TYPE_ENVIRONMENTSUIT);
    for(nIdx = 0;nIdx < nMax; nIdx++)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eChange,GetPartyMemberByIndex(nIdx));
    }
}

void DonSpaceSuit() {
    int nMax = GetPartyMemberCount();
    int nIdx;
    effect eChange = EffectDisguise(DISGUISE_TYPE_ENVIRONMENTSUIT_02);
    for(nIdx = 0;nIdx < nMax; nIdx++)
    {
        object oPartyMember = GetPartyMemberByIndex(nIdx);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eChange,oPartyMember);
    }
}

void RemoveDisguises() {

    int nDisguise = EFFECT_TYPE_DISGUISE;
    object oPC;
    effect eEffect;
    int nMax = GetPartyMemberCount();
    int nIdx;
    for(nIdx = 0;nIdx < nMax; nIdx++)
    {
        oPC = GetPartyMemberByIndex(nIdx);
        eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
        {
            if(GetEffectType(eEffect) == nDisguise)
            {
                RemoveEffect(oPC,eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }
    }
}
