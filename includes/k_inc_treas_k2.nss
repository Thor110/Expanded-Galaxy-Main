#include "k_inc_q_crystal"
#include "k_inc_treasure"

/*

This include files contains the functions used to randomly generate item treasure
based upon the players' level.

Item classifications

hundreds digit = item class
tens digit = item sub-class
ones digit = specifies specific item resref


(* = these items have been created through at least level 10)
Weapons 100
*  111 - Blaster
*  121 - Blaster Rifle
*  131 - Melee
*  141 - Lightsaber (regular)
*  142 - Lightsaber (short)
*  143 - Lightsaber (Double)

Upgrades 200
Upgrade - Ranged 210
*  211 - Targeting scope
*  212 - Firing Chamber
*  213 - Power Pack

Upgrade - Melee 220
*  221 - Grip
*  222 - Edge
*  223 - Energy Cell

Upgrade - Armor 230
*  231 - Overlay
*  232 - Underlay

Upgrades - Lightsaber 240
  241 - Emitter
*  242 - Lens
  243 - Energy Cell
  244 - Crystals
  245 - Color Crystals

Equipment - 300
*  311 - Belts
*  321 - Gloves
*  331 - Head Gear
   Implants - 340
*   341 - Level 1
*   342 - Level 2
*   343 - Level 3
*   344 - Level 4

Armor - 400
*  411 - Light armor
*  421 - Medium armor
*  431 - Heavy armor
*  441 - Jedi Robes

Droid Items - 500
511 - Interface
521 - Utility
531 - Armor
541 - Shielding
551 - Special weapons

Disposables - 900
*  911 - credits
*  921 - components
*  922 - chemicals
*  930 - shields
*  941 - medpac
*  942 - repair kit
*  951 - stim - str
*  952 - stim - dex
*  953 - stim - con
*  954 - medpac
*  961 - credits
*  970 - grenades
*  981 - parts
*  982 - program spikes
*  983 - security spike
   990 - rockets for mira

*/


// generates the base item tag; allows item tags to be descriptive instead of just numbers
string GetItemPrefix (int nItemType)

{
switch (nItemType)
{
        case 111: return("w_blaste_");
        case 121: return("w_brifle_");
        case 131: return("w_melee_");
        // lightsabers are left out of random treasure
        case 141: return("g_w_lghtsbr");
        case 142: return("g_w_shortsbr");
        case 143: return("g_w_dblsbr0");
        case 211: return("u_r_targ_");
        case 212: return("u_r_firi_");
        case 213: return("u_r_powe_");
        case 221: return("u_m_grip_");
        case 222: return("u_m_edge_");
        case 223: return("u_m_cell_");
        case 231: return("u_a_over_");
        case 232: return("u_a_unde_");
        case 241: return("u_l_emit_");
        case 242: return("u_l_lens_");
        case 243: return("u_l_cell_");
        case 244: return("u_l_crys_");
        case 245: return("u_l_colo_");
        case 311: return("a_belt_");
        case 321: return("a_gloves_");
        case 331: return("a_helmet_");
        case 341: return("e_imp1_");
        case 342: return("e_imp2_");
        case 343: return("e_imp3_");
        case 344: return("e_imp4_");
        case 411: return("a_heavy_");
        case 421: return("a_medium_");
        case 431: return("a_light_");
        case 441: return("a_robe_");
        case 511: return("d_utility_");
        case 521: return("d_interface_");
        case 531: return("d_armor_");
        case 541: return("d_shield_");
        case 551: return("d_device_");

}
return("");
}

// returns the tag of the item found.  the first part of the string is the base
// item, the second is the item's power level.
string GetTreasureSpecific (int nItemLevel, int nItemType = 0)
{
    int nItemRandom = 0;
    int nRoll;
    int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
    string sItemLevel = IntToString(nItemLevel);
    string sTemplate = "";

    if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;

    if(nItemType == 0)
        //no item class was specified, so we generate item class randomly
        {
    //prevent player from finding armor on Peragus (supposed to be undressed at beginning).
        if(nPCLevel < 4) nRoll = Random(3)+1;
        else
               nRoll = Random(4)+1;

        // equipment is more common than upgrades.
        if(nRoll == 2 && Random(100) < 50) nRoll = 3;
        sTemplate = GetTreasureSpecific(nItemLevel, nRoll*100);
        }
        else
            {
            if((nItemType % 100) == 0)
            // item class is known, but sub-class isn't, so we generate it randomly
            {
                switch (nItemType / 100)
                {
                    // lightsabers left out
                    case 1: {nItemRandom = 3; break;}
                    // lightsaber upgrades left out if item level < 6 or player level < 10
                    case 2: {if(nItemLevel < 6 ||
                                nPCLevel < 10)
                                nItemRandom = 3;
                                else nItemRandom = 4;
                                break;}
                    case 3: {nItemRandom = 4; break;}
                    case 4: {nItemRandom = 4; break;}
                    case 5: {nItemRandom = 5; break;}
                }
                nRoll = Random(nItemRandom) + 1;
                sTemplate = GetTreasureSpecific(nItemLevel, nItemType + 10*nRoll);
            }
            else
                if((nItemType % 10) == 0)
                // item class and sub-class known; generate the base item tag
                    {
                        switch (nItemType / 10)

                        {
                // lightsabers use a different curve
                            case 14: {nItemRandom = 3;
                                      break;}
                            case 21: {nItemRandom = 3;
                                      break;}
                            case 22: {nItemRandom = 3;
                                      break;}
                            case 23: {nItemRandom = 2;
                                      break;}
                            case 24: {nItemRandom = 5;
                                      break;}
                            case 34: {nItemRandom =
                                            GetAbilityModifier(ABILITY_CONSTITUTION, GetFirstPC())+Random(2);
                                      if(nItemRandom > 4) nItemRandom = 4;
                                      break;}
                        }
                        nRoll = (Random(nItemRandom) + 1);
                        sTemplate = GetTreasureSpecific(nItemLevel, nItemType + nRoll);
                     }
                        else
                        {
                            switch (nItemType)
                            {
                                case 141:
                                      nItemLevel = (nItemLevel - 3)/3;
				      // no number 6
				      if(nItemLevel == 6) nItemLevel = 5;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 142:
                                      nItemLevel = (nItemLevel - 3)/3;
				      // no number 6
				      if(nItemLevel == 6) nItemLevel = 5;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 143:
                                      nItemLevel = (nItemLevel - 3)/3;
				      // no number 6
				      if(nItemLevel == 6) nItemLevel = 5;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 211:
                                      nItemLevel = nItemLevel / 2;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 212:
                                      nItemLevel = nItemLevel / 2;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 213:
                                      nItemLevel = nItemLevel / 2;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 221:
                                      nItemLevel = nItemLevel / 2;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 222:
                                      nItemLevel = nItemLevel / 2;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 223:
                                      nItemLevel = nItemLevel / 2;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                // lightsaber lenses, emitters, and energy cells use a different curve
                                case 241:
                                      nItemLevel = (nItemLevel-6) / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 242:
                                      nItemLevel = (nItemLevel-6) / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 243:
                                      nItemLevel = (nItemLevel-6) / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 244:
                                      nItemLevel = nItemLevel - 5;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 245:
                                      nItemLevel = (nItemLevel - 5)/3 + 2;
                                      if(nItemLevel<4) nItemLevel = 4;
                      //no cyan
                      if(nItemLevel == 6) nItemLevel = 5;
                                      if(nItemLevel>9) nItemLevel = 9;
                                      nItemLevel = Random(nItemLevel) + 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 341:
                                      nItemLevel = nItemLevel / 3;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 342:
                                      nItemLevel = nItemLevel / 3;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 343:
                                      nItemLevel = nItemLevel / 3;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                case 344:
                                      nItemLevel = nItemLevel / 3;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;

                                // except for robes, armor uses a different level curve
                                // since there are fewer items per class
                                case 411:
                                {
                                    nItemLevel = nItemLevel / 2;
                                    if(nItemLevel < 1) nItemLevel = 1;
                                    sItemLevel = IntToString(nItemLevel);
                                    if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                    break;
                                }
                                case 421:
                                {
                                    nItemLevel = nItemLevel / 2;
                                    if(nItemLevel < 1) nItemLevel = 1;
                                    sItemLevel = IntToString(nItemLevel);
                                    if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                    break;
                                }
                                case 431:
                                {
                                    nItemLevel = nItemLevel / 2;
                                    if(nItemLevel < 1) nItemLevel = 1;
                                    sItemLevel = IntToString(nItemLevel);
                                    if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                    break;
                                }
                                case 441:
                                {
                                    nItemLevel = nItemLevel / 2;
                                    if(nItemLevel < 1) nItemLevel = 1;
                                    sItemLevel = IntToString(nItemLevel);
                                    if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                    break;
                                }
                                case 511:
                                {
                                      nItemLevel = nItemLevel / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                }
                                case 521:
                                {
                                      nItemLevel = nItemLevel / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                }
                                case 531:
                                {
                                      nItemLevel = nItemLevel / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                }
                                case 541:
                                {
                                      nItemLevel = nItemLevel / 3;
                                      if(nItemLevel<1) nItemLevel = 1;
                      // only six types of shields; adding some variety if item level is high
                      if(nItemLevel>6) nItemLevel = nItemLevel - 4;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                }
                                case 551:
                                {
                                      nItemLevel = nItemLevel / 2;
                                      if(nItemLevel<1) nItemLevel = 1;
                                      sItemLevel = IntToString(nItemLevel);
                                      if(nItemLevel < 10) sItemLevel = "0" + sItemLevel;
                                      break;
                                }
                            }
                            sTemplate = GetItemPrefix(nItemType) + sItemLevel;
                        }
             }
        return sTemplate;

}

// determines the exact bundle (disposable) item that is found
string GetBundlePrefix (int nItemLevel, int nItemType)
{

    // as a default, 1 of the selected item is used
    int nItemQuantity = 1;
    string sTemplate;
    string sModule = GetModuleName();

    //in late game, med pacs and grenades only.
    if(sModule == "851NIH" ||
        sModule == "852NIH" ||
        sModule == "901MAL" ||
        sModule == "902MAL" ||
        sModule == "903MAL" ||
        sModule == "904MAL" ||
        sModule == "905MAL" ||
        sModule == "906MAL")
        {
            if(Random(3) == 0) nItemType = 941;
            else if(Random(3) == 0) nItemType = 971+Random(9);
                else if (Random(3) == 0) nItemType = 931;
                    else if (Random(3) == 0) nItemType = 921;
                        else nItemType = 922;
        }

    switch (nItemType)
    {
        // credits
        case 911:
        {
            nItemQuantity = Random(10*nItemLevel) + Random(50) + 20;
            sTemplate = "g_i_credits015";
            break;
        }
        // chemicals and components
        case 921:
        {
            nItemQuantity = Random(nItemLevel) + Random(nItemLevel) +1;
            sTemplate = "compont_00001";
            break;
        }
        case 922:
        {
            nItemQuantity = Random(nItemLevel) + Random(nItemLevel) + 1;
            sTemplate = "chem_00001";
            break;
        }
        case 931:
        {
            nItemLevel = nItemLevel / 4+1;
            if(nItemLevel > 7) nItemLevel = 7;
            sTemplate = "a_shield_" + "0" + IntToString(nItemLevel);
            break;
        }
        // medpacs and repair kits
        case 941:
        {
            if(nItemLevel < 9)
                sTemplate = "g_i_medeqpmnt01";
                else if(nItemLevel < 16)
                    sTemplate = "g_i_medeqpmnt02";
                    else sTemplate = "g_i_medeqpmnt03";
            break;
        }
        case 942:
        {
            if(nItemLevel < 9)
                sTemplate = "g_i_drdrepeqp001";
                else if(nItemLevel < 16)
                    sTemplate = "g_i_drdrepeqp002";
                    else sTemplate = "g_i_drdrepeqp003";
            break;
        }
        // combat stims
        case 951:
        {
            nItemQuantity = 1;
            if(nItemLevel < 12)
                sTemplate = "g_i_adrnaline001";
                else sTemplate = "g_i_adrnaline004";
            break;
        }
        case 952:
        {
            nItemQuantity = 1;
            if(nItemLevel < 12)
                sTemplate = "g_i_adrnaline002";
                else sTemplate = "g_i_adrnaline005";
            break;
        }
        case 953:
        {
            nItemQuantity = 1;
            if(nItemLevel < 12)
                sTemplate = "g_i_adrnaline003";
                else sTemplate = "g_i_adrnaline006";
            break;
        }
        //medpacs are needed often, so they are a possibility here, too
        case 954:
        {
            if(nItemLevel < 9)
                sTemplate = "g_i_medeqpmnt01";
                else if(nItemLevel < 16)
                    sTemplate = "g_i_medeqpmnt02";
                    else sTemplate = "g_i_medeqpmnt03";
            break;
        }
        // credits should be common, so they appear twice
        case 961:
        {
            nItemQuantity = Random(2*nItemLevel) + Random(50) + 10;
            sTemplate = "g_i_credits014";
            break;
        }
        // grenades are a special case. if the player's level is too low for the
        // type of grenade rolled, then a lesser grenade is substituted instead
        case 971:
        {
            nItemQuantity = Random(2)+1;
            sTemplate = "g_w_adhsvgren001";
            break;
        }
        case 972:
        {
            if(nItemLevel < 4)
                sTemplate = "g_w_fraggren01";
                else
                {
                    sTemplate = "g_w_stungren01";
                }
            break;
        }
        case 973:
        {
            if(nItemLevel < 11)
                sTemplate = "g_w_fraggren01";
                else
                {
                    nItemQuantity = Random(2)+1;
                    sTemplate = "g_w_cryobgren001";
                }
            break;
        }
        case 974:
        {
            if(nItemLevel < 15)
                {
                    sTemplate = "g_w_firegren001";
                    nItemQuantity = Random(2)+1;
                }
                else
                {
                    nItemQuantity = 1;
                    sTemplate = "g_w_thermldet01";
                }
            break;
        }
        case 975:
        {
            if(nItemLevel < 9)
                sTemplate = "g_w_fraggren01";
                else
                {
                    nItemQuantity = Random(2)+1;
                    sTemplate = "g_w_firegren001";
                }
            break;
        }
        case 976:
        {
            sTemplate = "g_w_iongren01";
            break;
        }
        case 977:
        {
            if(nItemLevel < 7)
                sTemplate = "g_w_fraggren01";
                else
                {
                    nItemQuantity = Random(2)+1;
                    sTemplate = "g_w_poisngren01";
                }
            break;
        }
        case 978:
        {
            if(nItemLevel < 6)
                sTemplate = "g_w_sonicgren01";
                else
                {
                    nItemQuantity = Random(2)+1;
                    sTemplate = "g_w_sonicgren01";
                }
            break;
        }
        case 979:
        {
            nItemQuantity = Random(4)+1;
            sTemplate = "g_w_fraggren01";
            break;
        }
        // shields use a different level curve since there are only 7.
        // security spikes, computer spikes, and repair parts
        case 981:
        {
            sTemplate = "g_i_parts01";
            break;
        }
        case 982:
        {
            sTemplate = "g_i_progspike01";
            break;
        }
        case 983:
        {
            sTemplate = "g_i_secspike01";
            break;
        }
        case 991:
        {
            sTemplate = "w_rocket_01";
            break;
        }
        case 992:
        {
            sTemplate = "w_rocket_02";
            break;
        }
        case 993:
        {
            sTemplate = "w_rocket_03";
            break;
        }
        case 994:
        {
            sTemplate = "w_rocket_04";
            break;
        }
        case 995:
        {
            sTemplate = "w_rocket_05";
            break;
        }
    }
    //AurPostString(sTemplate+SWTR_GetQuantity(nItemQuantity),10,15,2.5);
    return(sTemplate + SWTR_GetQuantity(nItemQuantity));
}


// disposable items are handled different from normal/rare items
string GetTreasureBundle (int nItemLevel, int nItemType = 0)
{
    int nItemRandom = 0;
    int nRoll;
    int nPCLevel = GetGlobalNumber("G_PC_LEVEL");
    string sTemplate = "";

    // make sure player doesn't get rockets if no Mira

    if(nItemType == 990 && !IsAvailableCreature(NPC_MIRA)) nItemType = 980;

    // if the item class isn't specified, set the item class to be disposable items
    // (an item type hundreds digit of 9)

    if(nItemType == 0)
        {
            nRoll = Random(0)+9;
            sTemplate = GetTreasureBundle(nItemLevel, nRoll*100);
        }
        else
            {
            // if item sub-class isn't specified, determine the item sub-class (tens digit)
            if((nItemType % 100) == 0)
            {
                switch (nItemType / 100)
                {
                    case 9: {// only allow rockets to be found if mira has joined party
                    if(IsAvailableCreature(NPC_MIRA)) nItemRandom = 9;
                    // on Peragus (Level <6) security/computer spikes/parts/grenades must be prevented.
                    else if(nPCLevel < 6) nItemRandom = 6;
                        else nItemRandom = 8;
            break;}
                }
                nRoll = Random(nItemRandom) + 1;
                sTemplate = GetTreasureBundle(nItemLevel, nItemType + 10*nRoll);
            }
            else
                // item class and sub-class known; generate the base item tag
                if((nItemType % 10) == 0)
                    {
                        switch (nItemType / 10)

                        {
                            case 92: {nItemRandom = 2; break;}
                            case 94: {nItemRandom = 2; break;}
                            case 95: {nItemRandom = 4; break;}
                            case 97: {nItemRandom = 9; break;}
                            case 98: {nItemRandom = 3; break;}
                            // increase access to rockets as level increases
                            case 99: {nItemRandom = nItemLevel / 3;
                                      if(nItemRandom > 5) nItemRandom = 5;
                                      if(nItemRandom = 0) nItemRandom = 1;
                                      break;
                                      }

                        }
                        nRoll = (Random(nItemRandom) + 1);
                        sTemplate = GetBundlePrefix(nItemLevel, nItemType + nRoll);
                     }
                        else
                            sTemplate = GetBundlePrefix(nItemLevel, nItemType);
             }
        return sTemplate;

}



string GetTreasureNormal (int nItemLevel, int nItemType = 0)
{
    string sTemplate = GetTreasureSpecific(nItemLevel, nItemType);
    //AurPostString("Uncommon: "+sTemplate,2,2,2.0);
    return(sTemplate);
}


string GetTreasureRare (int nItemLevel, int nItemType = 0)
{
    string sTemplate = GetTreasureSpecific(nItemLevel + 5, nItemType);
    //AurPostString("Rare: "+sTemplate,2,3,2.0);
    return(sTemplate);
}


void PlaceTreasureDisposable(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 900)
{

    if(!GetLocalBoolean(oContainer,57))
    {
        SetLocalBoolean(oContainer,57,TRUE);
        int i;
        int nPCLevel = GetGlobalNumber("G_PC_LEVEL");


        if(nItemType < 900) nItemType = 0;

        int nItemLevel = nPCLevel + Random(6) - 4;
        if(nItemLevel < 1) nItemLevel = 1;
        if(nItemLevel >30) nItemLevel = 30;

        for (i = 1; i <= numberOfItems; i++)
        {
            string sItem;
            string sItemName;
            int nItemQuantity = 1;
            int j;

            sItem = GetTreasureBundle(nItemLevel, nItemType);

            //parse the item description
            //treasure blobs (strings) consist of the item template followed by the quantity
            if((j = FindSubString(sItem,"[")) >= 0)
            {
                nItemQuantity = StringToInt(GetSubString(sItem,j+1,4));
                sItemName = GetSubString(sItem,0,j);
            }
            else sItemName = sItem;

            //place the found item in the container
            CreateItemOnObject(sItemName,oContainer,nItemQuantity);
         }
    }
}


void PlaceTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0)
{

    if(!GetLocalBoolean(oContainer, 57))
    {
        SetLocalBoolean(oContainer,57,TRUE);
        int i;
        int nRoll;
        int nPCLevel = GetGlobalNumber("G_PC_LEVEL");

        // increases variety of normal items found for level 1 PC
        if(nPCLevel == 1) nPCLevel = 2;


        for (i = 1; i <= numberOfItems; i++)
        {
            int nItemLevel = nPCLevel + Random(8) - 5;
            if(nItemLevel < 1) nItemLevel = 1;
            if(nItemLevel >30) nItemLevel = 30 - Random(7);

            // the chance of finding a rare item increases with each attempt
            // until one is found.
            nRoll = Random(95) + GetGlobalNumber("000_RareItemChance");
            if(nItemType > 0 && nItemType < 900 && nRoll < 91) nRoll = 95;
            string sItem;
            string sItemName;
            int nItemQuantity = 1;
            int j;
            AurPostString("nRoll: " + IntToString(nRoll),9,9,2.0);

            if(nRoll > 100)
            {
                sItem = GetTreasureRare(nItemLevel, nItemType);
                // if a rare item is found, reset the chance of finding the next one
                SetGlobalNumber("000_RareItemChance",0);
            }
            else
            {
            // if no rare item was found, increase the chance of finding one next time
            IncrementGlobalNumber("000_RareItemChance", 3);
            if(SWTR_InRange(nRoll,0,85)) sItem = GetTreasureBundle(nItemLevel, nItemType);
                else if(SWTR_InRange(nRoll,86,100)) sItem = GetTreasureNormal(nItemLevel, nItemType);
            }

            //parse the item description
            //treasure blobs (strings) consist of the item template followed by the quantity
            if((j = FindSubString(sItem,"[")) >= 0)
            {
                nItemQuantity = StringToInt(GetSubString(sItem,j+1,4));
                sItemName = GetSubString(sItem,0,j);
            }
            else sItemName = sItem;


            AurPostString("Item: " + sItemName,10,10+i,2.0);
            //place the found item in the container
            CreateItemOnObject(sItemName,oContainer,nItemQuantity);
         }
    }
}






void PlaceCritterTreasure(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0)
{
    object oContainer = OBJECT_SELF;

    int i;
    int nRoll;
    int nPCLevel = GetGlobalNumber("G_PC_LEVEL");

    // increases variety of normal items found for level 1 PC
    if(nPCLevel == 1) nPCLevel = 2;

    int nItemLevel = nPCLevel + Random(8) - 5;
    if(nItemLevel < 1) nItemLevel = 1;
    if(nItemLevel >30) nItemLevel = 30 - Random(7);

    //AurPostString("nItemLevel: "+IntToString(nItemLevel),1,1,2.0);

    for (i = 1; i <= numberOfItems; i++)
    {
        // the chance of finding a rare item increases with each attempt
        // until one is found.
        nRoll = Random(95) + GetGlobalNumber("000_RareItemChance");
        string sItem;
        string sItemName;
        int nItemQuantity = 1;
        int j;


        //AurPostString("nRoll: "+IntToString(nRoll),2,2,2.0);
        if(nItemType > 0 && nItemType < 900 && nRoll < 91) nRoll = 95;
        if(nRoll > 100)
        {
            sItem = GetTreasureRare(nItemLevel, nItemType);
            // if a rare item is found, reset the chance of finding the next one
            SetGlobalNumber("000_RareItemChance",0);
        }
        else
        {
        // if no rare item was found, increase the chance of finding one next time
        IncrementGlobalNumber("000_RareItemChance", 3);
        if(SWTR_InRange(nRoll,0,85)) sItem = GetTreasureBundle(nItemLevel, nItemType);
            else if(SWTR_InRange(nRoll,86,100)) sItem = GetTreasureNormal(nItemLevel, nItemType);
        }

        //parse the item description
        //treasure blobs (strings) consist of the item template followed by the quantity
        if((j = FindSubString(sItem,"[")) >= 0)
        {
            nItemQuantity = StringToInt(GetSubString(sItem,j+1,4));
            sItemName = GetSubString(sItem,0,j);
        }
        else sItemName = sItem;

        //place the found item in the container
        //AurPostString("Item: "+sItemName,3,3,2.0);
        CreateItemOnObject(sItemName,oContainer,nItemQuantity);
    }
}


void PlaceTreasureJedi(object oContainer = OBJECT_SELF, int numberOfItems = 1)

{
int nRoll;
int i;
int nItemType;

for (i = 1; i <= numberOfItems; i++)
    {
        IncrementGlobalNumber("000_RareItemChance", 3);
        nRoll = Random(10)+1;
        if(nRoll == 1) nItemType = 240;
        else if(nRoll == 2) nItemType = 300;
        else if(nRoll == 3) nItemType = 440;
        else if(nRoll == 4) nItemType = 410;
        else nItemType = 900;

        PlaceCritterTreasure(oContainer, 1, nItemType);
    }
}

void PlaceTreasureDroid(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0)
{
PlaceTreasure(oContainer, numberOfItems, 500);
}

void PlaceTreasurePeragus(object oContainer = OBJECT_SELF, int numberOfItems = 1, int nItemType = 0)
{

int nRoll = Random(100) + GetGlobalNumber("000_RareItemChance");

if(nRoll > 90)
{
// Upgrades
PlaceTreasure(oContainer, numberOfItems, 200);
}
else if(nRoll > 80)
{
// equipment
PlaceTreasure(oContainer, numberOfItems, 300);
}
else
{
IncrementGlobalNumber("000_RareItemChance",3);
PlaceTreasureDisposable(oContainer, numberOfItems);
}
}
