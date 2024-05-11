// Gives the player the next component needed for the HK quest.
// kds, 09/06/04

#include "k_inc_treas_k2"

void GiveHKPart(string sString)
{

    int k = 1;
    string sHKpart = "hkpart0";
    string sItem;
    object oItem = OBJECT_SELF;
    object oRecipient;
    if(sString != "") oRecipient = GetObjectByTag(sString);
        else oRecipient = OBJECT_SELF;

if(GetJournalEntry("RebuildHK47") < 80)
{
    for(k; GetIsObjectValid(oItem); k++)
    {

    sItem = sHKpart + IntToString(k);
    oItem = GetItemPossessedBy (GetPartyLeader(),sItem);
    }
    //AddJournalQuestEntry("LightsaberQuest",10*i);
}

CreateItemOnObject( sItem, oRecipient, 1 );

}
