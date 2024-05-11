
//:: k_inc_item_gen.nss
/*
    Global script used to generate items on the PC based on the
    NPC being spoken to.
*/
//:: Created By:
//:: Copyright (c) 2002 Bioware Corp.
#include "k_inc_debug"

//Checks the Player's inventory and determines based on OBJECT_SELF
//whether the Player needs equipment.
//Returns TRUE if the Player needs equipment.
//Returns FALSE if the Player does NOT equipment.
int  GetIsEquipmentNeeded();

//Creates equipment on the PC based on the NPC they are talking to.
void CreateEquipmentOnPC();

//Counts and totals up to four different items within the Player's inventory.
int  CheckInventoryNumbers(string sTag1, string sTag2 = "", string sTag3 = "", string sTag4 = "");


//Checks the Player's inventory and determines based on OBJECT_SELF
//whether the Player needs equipment.
//Returns TRUE if the Player needs equipment.
//Returns FALSE if the Player does NOT equipment.
//Global and modified version of EBO_GetIsEquipmentNeeded() from Kotor1
int GetIsEquipmentNeeded()
{
    int nNumber, nGlobal;
    string sTag = GetTag(OBJECT_SELF);
    int nJediFound = (GetGlobalNumber("000_Jedi_Found")*2) + 10;

    if(sTag == "mira")//Mira
    {
        int bMakeLethalGrenades = GetLocalBoolean( OBJECT_SELF, 31 );
        if(bMakeLethalGrenades)
        {//lethals only
            nNumber = CheckInventoryNumbers("g_w_fraggren01","G_W_FIREGREN001");
            nGlobal = GetGlobalNumber("K_MIRA_ITEMS");
            if((nNumber <= 10 && nGlobal < nJediFound) || nGlobal == 0)
            {
                return TRUE;
            }
            return FALSE;
        }
        else
        {//non lethal grenades only, stuns and adhesives
            nNumber = CheckInventoryNumbers("G_w_StunGren01","g_w_adhsvgren001","G_W_CRYOBGREN001","g_w_iongren01");
            nGlobal = GetGlobalNumber("K_MIRA_ITEMS");
            if((nNumber <= 10 && nGlobal < nJediFound) || nGlobal == 0)
            {
                return TRUE;
            }
            return FALSE;
        }
    }
    else if(sTag == "disciple")//Disciple
    {
        nNumber = CheckInventoryNumbers("g_I_medeqpmnt01","G_I_MEDEQPMNT02","g_I_medeqpmnt03");
        nGlobal = GetGlobalNumber("K_DISCIPLE_ITEMS");
        if((nNumber <= 10 && nGlobal < nJediFound) || nGlobal == 0)
        {
            return TRUE;
        }
        return FALSE;
    }
    else if(sTag == "atton")//Atton
    {
        nNumber = CheckInventoryNumbers("g_i_secspike01","G_I_SECSPIKE02");
        nGlobal = GetGlobalNumber("K_ATTON_ITEMS");
        if((nNumber <= 10 && nGlobal <= nJediFound) || nGlobal == 0)
        {
            return TRUE;
        }
        return FALSE;
    }
    else if(sTag == "mand")//Canderous
    {
        nNumber = CheckInventoryNumbers("g_i_adrnaline001","G_I_ADRNALINE002","g_i_adrnaline003", "g_i_cmbtshot001");
        nGlobal = GetGlobalNumber("K_MAND_ITEMS");

        PrintString("Number = " + IntToString(nNumber));
        PrintString("Global = " + IntToString(nGlobal));
        PrintString("Jedi Found = " + IntToString(nJediFound));

        if((nNumber <= 10 && nGlobal <= nJediFound) || nGlobal == 0)
        {
            return TRUE;
        }
        return FALSE;
    }
    else if(sTag == "t3m4")//T3M4
    {
        nNumber = CheckInventoryNumbers("K_COMPUTER_SPIKE");
        nGlobal = GetGlobalNumber("K_T3M4_ITEMS");

        if((nNumber <= 10 && nGlobal <= nJediFound) || nGlobal == 0)
        {
            return TRUE;
        }
        return FALSE;
    }
    else if(sTag == "baodur")//Bao-Dur
    {
        nGlobal = GetGlobalNumber("K_BAODUR_ITEMS");
        return FALSE;
    }
    else if(sTag == "hanharr")//Hanharr
    {
        nGlobal = GetGlobalNumber("K_HANHARR_ITEMS");
        return FALSE;
    }
    return FALSE;
}


//Creates equipment on the PC based on the NPC they are talking to.
//Global and modified version of EBO_CreateEquipmentOnPC() from Kotor1
void CreateEquipmentOnPC()
{
    int nCount;
    string sTag = GetTag(OBJECT_SELF);
    object oProxy;
    if(sTag == "mira")//Mira
    {
        int nRand;
        int bMakeLethalGrenades = GetLocalBoolean( OBJECT_SELF, 31 );

        if(bMakeLethalGrenades)
        {//make only lethal grenades
            nRand = d2();
            if(nRand == 1)
            {
                oProxy = CreateItemOnObject("g_w_fraggren01", GetFirstPC());
            }
            else if(nRand == 2)
            {
                oProxy = CreateItemOnObject("G_W_FIREGREN001", GetFirstPC());
            }
        }
        else
        {//non-lethal grenades only
            nRand = d4();

            if(nRand == 1)
            {
                oProxy = CreateItemOnObject("G_W_CRYOBGREN001", GetFirstPC());
            }
            else if(nRand == 2)
            {
                oProxy = CreateItemOnObject("g_w_stungren01", GetFirstPC());
            }
            else if(nRand == 3)
            {
                oProxy = CreateItemOnObject("g_w_iongren01", GetFirstPC());
            }
            else if(nRand == 4)
            {
                oProxy = CreateItemOnObject("g_w_adhsvgren001", GetFirstPC());
            }
        }
        nCount = GetGlobalNumber("K_MIRA_ITEMS");
        nCount++;
        SetGlobalNumber("K_MIRA_ITEMS", nCount);
    }
    else if(sTag == "disciple")//Disciple
    {
        int nLevel = GetHitDice(GetFirstPC());
        if(nLevel <= 4)
        {
            oProxy = CreateItemOnObject("G_I_MEDEQPMNT01", GetFirstPC());
        }
        else if(nLevel > 4 && nLevel <= 10)
        {
            oProxy = CreateItemOnObject("G_I_MEDEQPMNT02", GetFirstPC());
        }
        else if(nLevel > 10)
        {
            oProxy = CreateItemOnObject("G_I_MEDEQPMNT03", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_DISCIPLE_ITEMS");
        nCount++;
        SetGlobalNumber("K_DISCIPLE_ITEMS", nCount);
    }
    else if(sTag == "atton")//Atton
    {
        int nLevel = GetHitDice(GetFirstPC());
        if(nLevel <= 7)
        {
            oProxy = CreateItemOnObject("g_i_secspike01", GetFirstPC());
        }
        else if(nLevel > 7)
        {
            oProxy = CreateItemOnObject("g_i_secspike02", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_ATTON_ITEMS");
        nCount++;
        SetGlobalNumber("K_ATTON_ITEMS", nCount);
    }
    else if(sTag == "mand")//Canderous
    {
        int nRand = d4();

        if(nRand == 1)
        {
            oProxy = CreateItemOnObject("G_I_ADRNALINE001", GetFirstPC());
        }
        else if(nRand == 2)
        {
            oProxy = CreateItemOnObject("G_I_ADRNALINE002", GetFirstPC());
        }
        else if(nRand == 3)
        {
            oProxy = CreateItemOnObject("G_I_ADRNALINE003", GetFirstPC());
        }
        else if(nRand == 4)
        {
            oProxy = CreateItemOnObject("G_I_CMBTSHOT001", GetFirstPC());
        }
        nCount = GetGlobalNumber("K_MAND_ITEMS");
        nCount++;
        SetGlobalNumber("K_MAND_ITEMS", nCount);
    }
    else if(sTag == "t3m4")//T3M4
    {
        oProxy = CreateItemOnObject("G_I_PROGSPIKE01", GetFirstPC());
        nCount = GetGlobalNumber("K_T3M4_ITEMS");
        nCount++;
        SetGlobalNumber("K_T3M4_ITEMS", nCount);
    }
    else if(sTag == "baodur")//Bao-Dur
    {
        nCount = GetGlobalNumber("K_BAODUR_ITEMS");
        nCount++;
        SetGlobalNumber("K_BAODUR_ITEMS", nCount);
    }
    else if(sTag == "hanharr")//Hanharr
    {
        nCount = GetGlobalNumber("K_HANHARR_ITEMS");
        nCount++;
        SetGlobalNumber("K_HANHARR_ITEMS", nCount);
    }
}


//Counts and totals up to four different items within the Player's inventory.
//Global and modified version of EBO_CheckInventoryNumbers() from Kotor1
int CheckInventoryNumbers(string sTag1, string sTag2 = "", string sTag3 = "", string sTag4 = "")
{
    int nNumber = 0;
    object oGrenade;
    if(sTag1 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag1);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    if(sTag2 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag2);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    if(sTag3 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag3);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    if(sTag4 != "")
    {
        oGrenade = GetItemPossessedBy(GetFirstPC(), sTag4);
        if(GetIsObjectValid(oGrenade))
        {
            nNumber += GetNumStackedItems(oGrenade);
        }
    }
    return nNumber;
}

