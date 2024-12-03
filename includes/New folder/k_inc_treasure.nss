//:: k_inc_treasure
/*
     contains code for filling containers using treasure tables
*/
//:: Created By:  Jason Booth
//:: Copyright (c) 2002 Bioware Corp.
//
//  March 15, 2003  J.B.
//      removed parts and spikes from tables
//

//constants for container types
int SWTR_DEBUG = TRUE;  //set to false to disable console/file logging
int SWTR_TABLE_CIVILIAN_CONTAINER = 1;
int SWTR_TABLE_MILITARY_CONTAINER_LOW = 2;
int SWTR_TABLE_MILITARY_CONTAINER_MID = 3;
int SWTR_TABLE_MILITARY_CONTAINER_HIGH = 4;
int SWTR_TABLE_CORPSE_CONTAINER_LOW = 5;
int SWTR_TABLE_CORPSE_CONTAINER_MID = 6;
int SWTR_TABLE_CORPSE_CONTAINER_HIGH = 7;
int SWTR_TABLE_SHADOWLANDS_CONTAINER_LOW = 8;
int SWTR_TABLE_SHADOWLANDS_CONTAINER_MID = 9;
int SWTR_TABLE_SHADOWLANDS_CONTAINER_HIGH = 10;
int SWTR_TABLE_DROID_CONTAINER_LOW = 11;
int SWTR_TABLE_DROID_CONTAINER_MID = 12;
int SWTR_TABLE_DROID_CONTAINER_HIGH = 13;
int SWTR_TABLE_RAKATAN_CONTAINER = 14;
int SWTR_TABLE_SANDPERSON_CONTAINER = 15;

//Fill an object with treasure from the specified table
//This is the only function that should be used outside this include file
void SWTR_PopulateTreasure(object oContainer,int iTable,int iItems = 1,int bUnique = TRUE);

//for internal debugging use only, output string to the log file and console if desired
void SWTR_Debug_PostString(string sStr,int bConsole = TRUE,int x = 5,int y = 5,float fTime = 5.0)
{
  if(SWTR_DEBUG)
  {
    if(bConsole)
    {
      AurPostString("SWTR_DEBUG - " + sStr,x,y,fTime);
    }
    PrintString("SWTR_DEBUG - " + sStr);
  }
}

//return whether i>=iLow and i<=iHigh
int SWTR_InRange(int i,int iLow,int iHigh)
{
  if(i >= iLow && i <= iHigh)
  {
    return(TRUE);
  }
  else
  {
    return(FALSE);
  }
}

//returns whether sTemplate is not in sFilter
int SWTR_IsUnique(string sTemplate,string sFilter)
{
  if(sFilter == "")
  {
    return(TRUE);
  }
  
  if(FindSubString(sFilter,sTemplate) >= 0)
  {
    return(FALSE);
  }
  else
  {
    return(TRUE);
  }
}

//turn a given quantity into appropriate format for a treasure blob (string)
string SWTR_GetQuantity(int iCount)
{
  string str = IntToString(iCount);
  string pad = "0";
  int length = 4;
  
  while(GetStringLength(str) < length)
  {
    str = pad + str;
  }
  return("[" + str + "]");
}

//get a single treasure blob (string) from specified table
//use sFilter to maintain uniqueness
string SWTR_GetTreasure(int iTable,string sFilter = "")
{
  int iRoll;
  string sTemplate;
  int bFound = FALSE;
  string sObjDesc = "";
  string sQuantity;
  
  //first, generate a random number (0-99) and then, using the specified table
  //lookup the treasure
  do {
    iRoll = Random(100);
    switch(iTable)
    {
    case 1:  //civilian container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,84) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(20)+1);
        bFound = TRUE;
      }
      /*
      sTemplate = "G_A_CLOTHES01";
      if(SWTR_InRange(iRoll,25,34) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_A_CLOTHES02";
      if(SWTR_InRange(iRoll,35,44) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_A_CLOTHES03";
      if(SWTR_InRange(iRoll,45,54) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_A_CLOTHES04";
      if(SWTR_InRange(iRoll,55,64) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_A_CLOTHES05";
      if(SWTR_InRange(iRoll,65,74) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_A_CLOTHES06";
      if(SWTR_InRange(iRoll,75,84) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,85,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,90,94) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      */
      sTemplate = "g_i_medeqpmnt01";
      if(SWTR_InRange(iRoll,85,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 2:  //low level military container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,9) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(20)+1);
        bFound = TRUE;
      }
      sTemplate = "g_w_fraggren01";
      if(SWTR_InRange(iRoll,10,29) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_w_StunGren01";
      if(SWTR_InRange(iRoll,30,39) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_w_SonicGren01";
      if(SWTR_InRange(iRoll,40,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "g_w_iongren01";
      if(SWTR_InRange(iRoll,60,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,50,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,60,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      */
      sTemplate = "g_i_medeqpmnt01";
      if(SWTR_InRange(iRoll,70,84) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_MEDEQPMNT04";
      if(SWTR_InRange(iRoll,85,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_DRDREPEQP001";
      if(SWTR_InRange(iRoll,90,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 3:  //mid level military container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,3) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(30)+10);
        bFound = TRUE;
      }
      sTemplate = "g_w_fraggren01";
      if(SWTR_InRange(iRoll,4,17) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "G_w_StunGren01";
      if(SWTR_InRange(iRoll,18,21) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "G_w_SonicGren01";
      if(SWTR_InRange(iRoll,22,27) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "g_w_iongren01";
      if(SWTR_InRange(iRoll,28,33) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,20,23) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,24,33) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_MEDEQPMNT02";
      if(SWTR_InRange(iRoll,34,48) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_MEDEQPMNT04";
      if(SWTR_InRange(iRoll,49,53) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "G_I_DRDREPEQP002";
      if(SWTR_InRange(iRoll,54,63) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE001";
      if(SWTR_InRange(iRoll,64,75) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE002";
      if(SWTR_InRange(iRoll,76,87) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE003";
      if(SWTR_InRange(iRoll,88,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 4:  //high level military container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,3) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(60)+ 40);
        bFound = TRUE;
      }
      sTemplate = "g_w_fraggren01";
      if(SWTR_InRange(iRoll,4,17) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "G_w_StunGren01";
      if(SWTR_InRange(iRoll,18,21) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "G_w_SonicGren01";
      if(SWTR_InRange(iRoll,22,27) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "g_w_iongren01";
      if(SWTR_InRange(iRoll,28,33) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,20,23) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,24,33) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_MEDEQPMNT03";
      if(SWTR_InRange(iRoll,34,48) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_MEDEQPMNT04";
      if(SWTR_InRange(iRoll,49,53) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "G_I_DRDREPEQP003";
      if(SWTR_InRange(iRoll,54,63) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE004";
      if(SWTR_InRange(iRoll,64,75) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE005";
      if(SWTR_InRange(iRoll,76,87) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE006";
      if(SWTR_InRange(iRoll,88,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 5:  //low level corpse container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(20)+ 1);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,70,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,80,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      */
      sTemplate = "g_i_medeqpmnt01";
      if(SWTR_InRange(iRoll,80,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 6:  //mid level corpse container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,49) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(30)+ 10);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,40,49) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,50,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_MEDEQPMNT02";
      if(SWTR_InRange(iRoll,50,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE001";
      if(SWTR_InRange(iRoll,70,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE002";
      if(SWTR_InRange(iRoll,80,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE003";
      if(SWTR_InRange(iRoll,90,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 7:  //high level corpse container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,49) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(60)+ 40);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,40,49) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,50,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_MEDEQPMNT03";
      if(SWTR_InRange(iRoll,50,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE004";
      if(SWTR_InRange(iRoll,70,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE005";
      if(SWTR_InRange(iRoll,80,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE006";
      if(SWTR_InRange(iRoll,90,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 8:  //low level shadowlands container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(20)+ 1);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,60,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      */
      sTemplate = "g_i_medeqpmnt01";
      if(SWTR_InRange(iRoll,70,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 9:  //mid level shadowlands container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(30)+ 10);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,50,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      */
      sTemplate = "g_i_medeqpmnt02";
      if(SWTR_InRange(iRoll,60,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE001";
      if(SWTR_InRange(iRoll,70,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE002";
      if(SWTR_InRange(iRoll,80,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE003";
      if(SWTR_InRange(iRoll,90,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 10:  //high level shadowlands container
      sTemplate = "G_I_CREDITS001";
      if(SWTR_InRange(iRoll,0,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(60)+ 40);
        bFound = TRUE;
      }
      /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,50,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      */
      sTemplate = "g_i_medeqpmnt03";
      if(SWTR_InRange(iRoll,60,69) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE004";
      if(SWTR_InRange(iRoll,70,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE005";
      if(SWTR_InRange(iRoll,80,89) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE006";
      if(SWTR_InRange(iRoll,90,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 11:  //low level droid container
      /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_DRDLTPLAT001";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_DRDMTNSEN001";
      if(SWTR_InRange(iRoll,80,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 12:  //mid level droid container
      /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_DRDLTPLAT002";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_DRDMTNSEN002";
      if(SWTR_InRange(iRoll,80,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 13:  //high level droid container
    /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_DRDLTPLAT003";
      if(SWTR_InRange(iRoll,0,79) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_DRDMTNSEN003";
      if(SWTR_InRange(iRoll,80,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 14:  //rakatan container
    /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,0,15) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      sTemplate = "g_i_progspike01";
      if(SWTR_InRange(iRoll,16,31) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(4)+ 3);
        bFound = TRUE;
      }
      */
      sTemplate = "G_I_DRDREPEQP003";
      if(SWTR_InRange(iRoll,0,24) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE004";
      if(SWTR_InRange(iRoll,25,49) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE005";
      if(SWTR_InRange(iRoll,50,74) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE006";
      if(SWTR_InRange(iRoll,75,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    case 15:  //sandperson container
    /*
      sTemplate = "g_i_parts01";
      if(SWTR_InRange(iRoll,0,11) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      */
      sTemplate = "g_w_fraggren01";
      if(SWTR_InRange(iRoll,0,23) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "G_w_StunGren01";
      if(SWTR_InRange(iRoll,24,35) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "G_w_SonicGren01";
      if(SWTR_InRange(iRoll,36,47) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "g_w_iongren01";
      if(SWTR_InRange(iRoll,48,59) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate + SWTR_GetQuantity(Random(3)+ 2);
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE001";
      if(SWTR_InRange(iRoll,60,71) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE002";
      if(SWTR_InRange(iRoll,72,83) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      sTemplate = "G_I_ADRNALINE003";
      if(SWTR_InRange(iRoll,84,99) && SWTR_IsUnique(sTemplate,sFilter))
      {
        sObjDesc = sTemplate;
        bFound = TRUE;
      }
      break;
    }
  } while(!bFound);
  return(sObjDesc);
}

//Fill an object with treasure from the specified table
//This is the only function that should be used outside this include file
void SWTR_PopulateTreasure(object oContainer,int iTable,int iItems = 1,int bUnique = TRUE)
{
  string sFilter = "";  //maintains list of item templates already retrieved
  string sItem,sTemplate;
  int iQuantity;
  int i;

  if(!GetIsObjectValid(oContainer))
  {
    SWTR_Debug_PostString("invalid container");
    return;
  }

  while(iItems > 0)
  {
    sItem = SWTR_GetTreasure(iTable,sFilter);
    if(sItem == "")
    {
      SWTR_Debug_PostString("bad table");
    }
    //parse the item description
    //treasure blobs (strings) consist of the item template followed by the quantity
    if((i = FindSubString(sItem,"[")) >= 0)
    {
      iQuantity = StringToInt(GetSubString(sItem,i+1,4));
      sTemplate = GetSubString(sItem,0,i);
    }
    else
    {
      iQuantity = 1;
      sTemplate = sItem;
    }
    //create item
    if(!GetIsObjectValid(CreateItemOnObject(sTemplate,oContainer,iQuantity)))
    {
      SWTR_Debug_PostString("item create failed (" + sTemplate + ")");
    }
    else
    {
      SWTR_Debug_PostString("container:" + GetTag(oContainer) + " item:" + sTemplate,FALSE);
    }
    //update our filter if we are maintaining uniqueness
    if(bUnique)
    {
      sFilter = sFilter + sTemplate;
    }
    iItems--;
  }
}
