// ST: k_003ebo_enter.nss (k_003_ebo_enter.ncs in 003EBO_s.rim)

#include "k_inc_hawk"

// ---------------------------------------------------------------
// ST: Globals used to identify cutscenes:
// ---------------------------------------------------------------
int CUTSCENE_NONE                   = 0;

int CUTSCENE_CUT_ATTON_T3_PAZAAK_1  = 1;
int CUTSCENE_CUT_ATTON_T3_PAZAAK_2  = 2;
int CUTSCENE_CUT_ATTON_T3_ARGUE     = 3;
int CUTSCENE_CUT_ATTON_MAID_FIGHT   = 4;
int CUTSCENE_CUT_ATTON_KREIA_OFF    = 5;
int CUTSCENE_CUT_ATTON_KREIA_GIVE   = 6;
int CUTSCENE_CUT_ATTON_KREIA_TAKE   = 7;
int CUTSCENE_CUT_ATTON_BAO_PLAYER   = 8;

int CUTSCENE_CUT_BAO_CONFRONT_KRE   = 10;
int CUTSCENE_CUT_BAO_REMOTE_1       = 11;
int CUTSCENE_CUT_BAO_REMOTE_2       = 12;
int CUTSCENE_CUT_BAO_REMOTE_3       = 13;
int CUTSCENE_CUT_BAO_T3             = 14;
int CUTSCENE_CUT_BAO_HK47_1         = 15;
int CUTSCENE_CUT_BAO_HK47_2         = 16;
int CUTSCENE_CUT_BAO_G0T0_1         = 17;
int CUTSCENE_CUT_BAO_G0T0_2         = 18;
int CUTSCENE_CUT_BAO_G0T0_3         = 19;
int CUTSCENE_CUT_BAO_MALACHOR       = 20;
int CUTSCENE_CUT_BAO_VS_MAND_1      = 21;
int CUTSCENE_CUT_BAO_VS_MAND_2      = 22;

int CUTSCENE_CUT_DISC_PLAYER_MED    = 30;
int CUTSCENE_CUT_ATTON_DISC_1       = 31;
int CUTSCENE_CUT_ATTON_DISC_2       = 32;
int CUTSCENE_CUT_ATTON_DISC_3       = 33;
int CUTSCENE_CUT_DISC_TELOS         = 34;
int CUTSCENE_CUT_DISC_WORLD_1       = 35;
int CUTSCENE_CUT_DISC_WORLD_2       = 36;
int CUTSCENE_CUT_DISC_FORCE         = 37;
int CUTSCENE_DISC_REVAN             = 38;

int CUTSCENE_CUT_G0T0_HK47_1        = 40;
int CUTSCENE_CUT_G0T0_REMOTE_1      = 41;
int CUTSCENE_CUT_G0T0_REMOTE_2      = 42;

int CUTSCENE_CUT_KREIA_VS_T3        = 50;
int CUTSCENE_CUT_KREIA_MAID_1       = 51;
int CUTSCENE_CUT_KREIA_MAID_2       = 52;
int CUTSCENE_CUT_KREIA_DISC_1       = 53;
int CUTSCENE_CUT_KREIA_DISC_2       = 54;
int CUTSCENE_CUT_KREIA_DISC_3       = 55;

int CUTSCENE_CUT_MIRA_MAID          = 60;

int CUTSCENE_CUT_T3_VS_HK47         = 71;
int CUTSCENE_CUT_T3_DISC_HOLO       = 72;

int CUTSCENE_CUT_VISAS_VS_MAID      = 80;
int CUTSCENE_VISAS_ARRIVES          = 81;
int CUTSCENE_CUT_HK47_VS_HK50       = 89;
int CUTSCENE_CUT_MSG_FROM_KELBORN   = 90;
int CUTSCENE_CUT_FIRST_ATTON        = 91;
int CUTSCENE_CUT_SECOND_ATTON       = 92;
int CUTSCENE_CUT_BAODUR_LIGHTSABER  = 93;
int CUTSCENE_CUT_DXUN_REPAIR		= 94;

// ---------------------------------------------------------------
// ST: Function prototypes:
// ---------------------------------------------------------------
void RunCutscene(int nScene);
void DoCutscenes();
void TriggerCutscenes();
void UpdateSomeNumbers();
void DelayedFadeIn(float fDelay, float fWait, float fLength);

int PlanetCount();
int GetIsAvailable(int nNPC);
int GetInfluenceDiff(int nNPC1, int nNPC2);
int CheckNPCLevel(int nNPC);
int CheckNPCSkill(int nNPC, int nType);

object GetAndMoveNPCToWaypoint(int nNPC, string sTag);
object GetAndMovePUPToWaypoint(int nPUP, string sTag);

// ---------------------------------------------------------------
// ST: Main function
// ---------------------------------------------------------------
void main() {
    object oEnter = GetEnteringObject();
    if (oEnter == GetFirstPC()) {
        // ST: Fix since 004EBO has a script with the same name :/
        if (GetTag(GetArea(oEnter)) == "004EBO") {
            SetBackground();
            return;
        }
    
        SetNPCSelectability(NPC_KREIA, TRUE);
        SetNPCSelectability(NPC_ATTON, TRUE);
        
        SetBackground();
        SetHologramWorld();
        
        if (GetLoadFromSaveGame()) {
            DelayCommand(1.0, RebuildPartyTable());
            return;
        }

        object oDoor = GetObjectByTag("CargoDoor");
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
                
        ClearPlayerParty();
        ClearEbonHawk();
        
        SetGlobalBoolean("003_cutscene_mode", TRUE);
        SetGlobalBoolean("003_PARTY_SPAWN", TRUE);
        
        SpawnAllAvailablePartyMembers();
        UpdateSomeNumbers();
        
        // ST: Fire this script to do extra unrelated things when entering the hawk.
        ExecuteScript("003_onenter_hook", OBJECT_SELF);     
        
        DelayCommand(1.0, DoCutscenes());
    }
}

// ---------------------------------------------------------------
// ST: Increase globals. Don't know why this is a separate function.
// ---------------------------------------------------------------
void UpdateSomeNumbers() {
    if (GetGlobalNumber("003EBO_G0T0_BAO_2") == 1) {
        SetGlobalNumber("003EBO_G0T0_BAO_2", 2);
    }
    if (GetGlobalNumber("003EBO_ATTDISC_COUNT") == 1) {
        SetGlobalNumber("003EBO_ATTDISC_COUNT", 2);
    }
}

// ---------------------------------------------------------------
// ST: Trigger Ebon Hawk cutscenes. Wrapper for Dxun arrival.
// ---------------------------------------------------------------
void DoCutscenes() {
    object oPC = GetFirstPC();
    if(GetGlobalBoolean("EH_REPAIR") == TRUE)
    {
        //Add Cutscene For Repairing The Ship ?.!
        DestroyObject(GetObjectByTag("baoplace"));
        DestroyObject(GetObjectByTag("baoplace2"));
    }
    if(GetGlobalBoolean("LEAVING_POLAR") == TRUE && GetGlobalBoolean("LEFT_POLAR") == FALSE)
    {
        SetGlobalNumber("003EBO_BACKGROUND", 10);
        SetGlobalNumber("003EBO_RETURN_DEST", 8);
		SetGlobalBoolean("LEFT_POLAR",TRUE);
    }
    if(GetGlobalNumber("852NIH_Nihilus_Dead") == 1)
    {
        if(GetGlobalBoolean("CARTH_SCENE") == TRUE)
        {
            SetGlobalNumber("003EBO_BACKGROUND", 10);
            SetGlobalNumber("003EBO_RETURN_DEST", 8);
            
            object oAtton = GetObjectByTag("Atton"); 
                object oExile = GetFirstPC(); 
		
            DelayCommand(0.2, AssignCommand(oAtton, ActionStartConversation(oExile, "pcdead2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));  
                return;
        // try and stop the malachor cutscene from happening every time
        }
    }
    else if (GetGlobalNumber("401DXN_STARTED") == 2) {
        SetGlobalNumber("401DXN_STARTED", 3);
        
        object oAtton = GetObjectByTag("Atton");
        object oKreia = GetObjectByTag("Kreia");
        object oMira  = GetObjectByTag("Mira"); 
        object oExile = GetFirstPC();           
        
        AssignCommand(oAtton, ClearAllActions());
        AssignCommand(oKreia, ClearAllActions());
        AssignCommand(oMira,  ClearAllActions());
        AssignCommand(oExile, ClearAllActions());
        
        AssignCommand(oKreia, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_kreia_dxn"))));
        AssignCommand(oExile, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_dxn"))));
        if (GetIsObjectValid(oMira)) 
            AssignCommand(oMira, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_mira_dxn"))));
            
        DelayCommand(0.2, AssignCommand(oAtton, ActionStartConversation(oExile, "attond", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));  
        return;
    }
    else if (GetGlobalNumber("401DXN_STARTED") == 4) {
        SetGlobalNumber("401DXN_STARTED", 5);
        
        object oAtton = GetObjectByTag("Atton");
        object oKreia = GetObjectByTag("Kreia");
        object oMira  = GetObjectByTag("Mira"); 
        object oExile = GetFirstPC();   
        
        AssignCommand(oAtton, ClearAllActions());
        AssignCommand(oKreia, ClearAllActions());
        AssignCommand(oMira,  ClearAllActions());
        AssignCommand(oExile, ClearAllActions());
        
        AssignCommand(oKreia, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_kreia_dxn"))));
        AssignCommand(oExile, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_dxn"))));
        if (GetIsObjectValid(oMira)) 
            AssignCommand(oMira, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_mira_dxn"))));     
        
        DelayCommand(0.2, AssignCommand(oAtton, ActionStartConversation(oExile, "attond", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));                  
        return;
    }
    else if (GetGlobalBoolean("003_PARTY_SPAWN") && GetGlobalBoolean("003_cutscene_mode")) {
        AssignCommand(oPC, ClearAllActions());
        
        if (GetGlobalNumber("003_IN_COMBAT") == 0) {
            AssignCommand(oPC, TriggerCutscenes());
        }
    }
    else {
        AurPostString("ON 003 ENTER: SHOULD NOT BE HITTING THIS!  REPORT TO ANTHONYD.", 5, 14, 10.0);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, TriggerCutscenes());
    }   
}


// ---------------------------------------------------------------
// ST: Determine which cutscene to trigger.
// ---------------------------------------------------------------
void TriggerCutscenes() {
    SetGlobalFadeOut();
    SetFadeUntilScript();
    
    int nScene;
    
    if (!GetGlobalBoolean("CUT_FIRST_ATTON")
        && (GetIsAvailable(NPC_T3_M4)
        && GetIsAvailable(NPC_ATTON) 
        && GetIsAvailable(NPC_KREIA))
        && (GetGlobalNumber("003EBO_Atton_Talk") == 0))
    {
        AurPostString("CS: 003EBO_Atton_Talk == 0", 5, 15, 5.0);
        SetGlobalBoolean("CUT_FIRST_ATTON", TRUE);
        nScene = CUTSCENE_CUT_FIRST_ATTON;
    }
    else if (GetIsAvailable(NPC_ATTON) 
        &&  !GetIsAvailable(NPC_VISAS)
        &&  GetGlobalBoolean("003EBO_VISAS_ARRIVES")
        &&  (GetGlobalNumber("262TEL_Escape_Telos") == 1)
        &&  (PlanetCount() >= 2)) 
    {
        AurPostString("CS: VISAS ARRIVES", 5, 15, 5.0);
        SetGlobalBoolean("003EBO_VISAS_ARRIVES", FALSE);
        SetGlobalBoolean("003EBO_CLEANUP_VISAS", TRUE);
        SetGlobalNumber("003_IN_COMBAT", 1);
        nScene = CUTSCENE_VISAS_ARRIVES;
    }
    else if (!GetGlobalBoolean("CUT_BAODUR_LIGHTSABER")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  (GetGlobalNumber("262TEL_Escape_Telos") == 1))
    {
        AurPostString("CS: BAODUR LIGHTSABER", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAODUR_LIGHTSABER", TRUE);
        nScene = CUTSCENE_CUT_BAODUR_LIGHTSABER;
    }
    else if (!GetGlobalBoolean("CUT_SECOND_ATTON")
        &&  GetGlobalBoolean("CUT_FIRST_ATTON")
        &&  GetIsAvailable(NPC_T3_M4)
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_KREIA)
        &&  (GetGlobalNumber("262TEL_CNPC_Freed") == 0)
        &&  ((GetGlobalNumber("003EBO_Atton_Talk") == 1) || (GetGlobalNumber("003EBO_Atton_Talk") == 2)))
    {
        AurPostString("CS: 262TEL_CNPC_Freed == 0", 5, 15, 5.0);
        SetGlobalBoolean("CUT_SECOND_ATTON", TRUE);
        nScene = CUTSCENE_CUT_SECOND_ATTON;
    }
    else if (!GetGlobalBoolean("CUT_MSG_FROM_KELBORN")
        &&  GetIsAvailable(NPC_T3_M4)
        &&  GetGlobalNumber("502OND_End_First")
        &&  ((GetGlobalNumber("403DXN_Return_Trigger") == 3) || (GetGlobalNumber("000_Jedi_Found") > GetGlobalNumber("403DXN_Return_Trigger"))))
    {
        AurPostString("CS: MESSAGE FROM KELBORN", 5, 15, 5.0);
        SetGlobalBoolean("CUT_MSG_FROM_KELBORN", TRUE);
        nScene = CUTSCENE_CUT_MSG_FROM_KELBORN;
    }
    else if (!GetGlobalBoolean("CUT_HK47_VS_HK50")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_HK_47)
        &&  (GetGlobalNumber("000_HK_Torture") == 1))
    {
        AurPostString("CS: HK47 VS HK50", 5, 15, 5.0);
        SetGlobalNumber("000_HK_Torture", 2);
        SetGlobalBoolean("CUT_HK47_VS_HK50", TRUE);
        nScene = CUTSCENE_CUT_HK47_VS_HK50;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_T3_PAZAAK_1")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_T3_M4)
        &&  (GetGlobalNumber("003EBO_T3_Pazaak") == 0))
    {
        AurPostString("CS: ATTON T3 PAZAAK", 5, 15, 5.0);
        SetGlobalNumber("003EBO_ATTON_T3_START", 2);
        SetGlobalBoolean("CUT_ATTON_T3_PAZAAK_1", TRUE);
        nScene = CUTSCENE_CUT_ATTON_T3_PAZAAK_1;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_T3_PAZAAK_2")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_T3_M4)
		&& 	GetIsAvailable(NPC_HK_47)
        &&  (GetGlobalNumber("003EBO_T3_Pazaak") == 1))
    {
        AurPostString("CS: ATTON T3 PAZAAK 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_T3_PAZAAK_2", TRUE);
        nScene = CUTSCENE_CUT_ATTON_T3_PAZAAK_2;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_T3_ARGUE")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_T3_M4)
        &&  ((GetInfluence(NPC_T3_M4) >= 75) || (GetInfluence(NPC_T3_M4) <= 25)))
    {
        AurPostString("CS: ATTON T3 ARGUE", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_T3_ARGUE", TRUE);
        SetGlobalNumber("003EBO_T3_Atton", 1);
        nScene = CUTSCENE_CUT_ATTON_T3_ARGUE;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_MAID_FIGHT")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_HANDMAIDEN)
        &&  (GetGlobalNumber("003EBO_Handmaid_Fight") == 1)
        &&  (GetGlobalNumber("003EBO_Atton_Hand") == 0))
    {
        AurPostString("CS: ATTON HANDMAIDEN FIGHT", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_MAID_FIGHT", TRUE);
        nScene = CUTSCENE_CUT_ATTON_MAID_FIGHT;
    }
    else if (!GetGlobalBoolean("CUT_VISAS_VS_MAID")
        &&  GetIsAvailable(NPC_VISAS)
        &&  GetIsAvailable(NPC_HANDMAIDEN)
        &&  (GetGlobalNumber("003EBO_Visas_Hand") == 0)
        &&  (GetInfluenceDiff(NPC_VISAS, NPC_HANDMAIDEN) >= 15))
    {
        AurPostString("CS: VISAS HANDMAIDEN ARGUE", 5, 15, 5.0);
        SetGlobalBoolean("CUT_VISAS_VS_MAID", TRUE);
        nScene = CUTSCENE_CUT_VISAS_VS_MAID;
    }
    else if (!GetGlobalBoolean("CUT_MIRA_MAID")
        &&  GetIsAvailable(NPC_MIRA)
        &&  GetIsAvailable(NPC_HANDMAIDEN)
        &&  GetIsAvailable(NPC_VISAS)
        &&  (GetGlobalNumber("003EBO_Visas_Hand") == 1)
        &&  (GetGlobalNumber("003EBO_Mira_Hand") == 0))
    {
        AurPostString("CS: MIRA HANDMAIDEN TALK", 5, 15, 5.0);
        SetGlobalBoolean("CUT_MIRA_MAID", TRUE);
        nScene = CUTSCENE_CUT_MIRA_MAID;
    }
    else if (!GetGlobalBoolean("CUT_KREIA_MAID_1")
        &&  GetIsAvailable(NPC_VISAS)
        &&  GetIsAvailable(NPC_HANDMAIDEN)
        &&  GetIsAvailable(NPC_KREIA)
        &&  (GetGlobalNumber("003EBO_Visas_Hand") == 1)
        &&  (GetInfluenceDiff(NPC_VISAS, NPC_HANDMAIDEN) >= 30))
    {
        AurPostString("CS: KREIA HANDMAIDEN DS 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_KREIA_MAID_1", TRUE);
        nScene = CUTSCENE_CUT_KREIA_MAID_1;
    }
    else if (!GetGlobalBoolean("CUT_KREIA_MAID_2")
        &&  GetGlobalBoolean("CUT_KREIA_MAID_1")
        &&  GetIsAvailable(NPC_VISAS)
        &&  GetIsAvailable(NPC_HANDMAIDEN)
        &&  GetIsAvailable(NPC_KREIA)
        && (GetGlobalNumber("003EBO_Visas_Hand") == 2)
        &&  (GetInfluenceDiff(NPC_VISAS, NPC_HANDMAIDEN) >= 45))
    {
        AurPostString("CS: KREIA HANDMAIDEN DS 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_KREIA_MAID_2", TRUE);
        nScene = CUTSCENE_CUT_KREIA_MAID_2;
    }
    else if (!GetGlobalBoolean("CUT_G0T0_HK47_1")
        &&  GetIsAvailable(NPC_G0T0)
        &&  GetIsAvailable(NPC_HK_47)
        &&  (GetGlobalNumber("003EBO_Goto_HK47") == 0))
    {
        AurPostString("CS: GOTO HK 47 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_G0T0_HK47_1", TRUE);
        nScene = CUTSCENE_CUT_G0T0_HK47_1;
    }   
    else if (!GetGlobalBoolean("CUT_G0T0_REMOTE_1")
        &&  GetIsAvailable(NPC_G0T0)
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  (GetGlobalNumber("003EBO_G0t0_Remote") == 0))
    {
        AurPostString("CS: GOTO REMOTE 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_G0T0_REMOTE_1", TRUE);
        nScene = CUTSCENE_CUT_G0T0_REMOTE_1;
    }
    else if (!GetGlobalBoolean("CUT_G0T0_REMOTE_2")
        &&  GetIsAvailable(NPC_G0T0)
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  (GetGlobalNumber("003EBO_G0t0_Remote") == 2)
        &&  (GetGlobalNumber("000_Jedi_Found") > 3))
    {
        AurPostString("CS: GOTO REMOTE 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_G0T0_REMOTE_2", TRUE);
        nScene = CUTSCENE_CUT_G0T0_REMOTE_2;
    }   
    else if (!GetGlobalBoolean("CUT_T3_VS_HK47")
        &&  GetIsAvailable(NPC_HK_47)
        &&  GetIsAvailable(NPC_T3_M4)
        &&  (GetGlobalNumber("003EBO_HK47_T3") == 0))
    {
        AurPostString("CS: T3 HK47 CONFRONTATION", 5, 15, 5.0);
        SetGlobalBoolean("CUT_T3_VS_HK47", TRUE);
        nScene = CUTSCENE_CUT_T3_VS_HK47;
    }
    else if (!GetGlobalBoolean("CUT_DISC_PLAYER_MED")
        &&  GetIsAvailable(NPC_MIRA)
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("003EBO_Disciple_Med") == 1)
        &&  (GetGlobalNumber("003EBO_Meditate_Event") == 0))
    {
        AurPostString("CS: DISCIPLE PLAYER MEDITATE", 5, 15, 5.0);
        SetGlobalBoolean("CUT_DISC_PLAYER_MED", TRUE);
        nScene = CUTSCENE_CUT_DISC_PLAYER_MED;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_DISC_1")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  GetIsAvailable(NPC_ATTON)
        &&  (GetGlobalNumber("003EBO_Disciple_Atton") == 0)
        &&  (GetInfluenceDiff(NPC_DISCIPLE, NPC_ATTON) >= 15))
    {
        AurPostString("CS: DISCIPLE ATTON FIGHT 1", 5, 15, 5.0);
        SetGlobalNumber("003EBO_ATTDISC_COUNT", 1);
        SetGlobalBoolean("CUT_ATTON_DISC_1", TRUE);
        nScene = CUTSCENE_CUT_ATTON_DISC_1;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_DISC_2")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  GetIsAvailable(NPC_ATTON)
        &&  (GetGlobalNumber("003EBO_Disciple_Atton") == 1) 
        &&  (GetInfluenceDiff(NPC_DISCIPLE, NPC_ATTON) >= 30)
        &&  (GetGlobalNumber("003EBO_ATTDISC_COUNT") == 2))
    {
        AurPostString("CS: DISCIPLE ATTON FIGHT 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_DISC_2", TRUE);
        nScene = CUTSCENE_CUT_ATTON_DISC_2;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_DISC_3")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  GetIsAvailable(NPC_ATTON)
        &&  (GetGlobalNumber("003EBO_T3_Disciple") == 1)
        &&  (GetGlobalNumber("003EBO_Disciple_Atton") < 3))
    {
        AurPostString("CS: DISCIPLE ATTON FIGHT 3", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_DISC_3", TRUE);
        nScene = CUTSCENE_CUT_ATTON_DISC_3;
    }
    else if (!GetGlobalBoolean("CUT_T3_DISC_HOLO")
        &&  GetIsAvailable(NPC_T3_M4)
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("000_Jedi_Found") > 2)
        &&  (GetGlobalNumber("003EBO_Disciple_Atton") == 2)
        &&  (GetGlobalNumber("003EBO_T3_Disciple") == 0))
    {
        AurPostString("CS: T3 DISCIPLE HOLOGRAM", 5, 15, 5.0);
        SetGlobalBoolean("CUT_T3_DISC_HOLO", TRUE);
        nScene = CUTSCENE_CUT_T3_DISC_HOLO;
    }
    else if (FALSE && !GetGlobalBoolean("CUT_DISC_TELOS")) 
    {
        AurPostString("CS: DISCIPLE CONTACTS TELOS", 5, 15, 5.0);
        SetGlobalBoolean("CUT_DISC_TELOS", TRUE);
        nScene = CUTSCENE_CUT_DISC_TELOS;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_KREIA_OFF")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_KREIA)
        &&  (GetGlobalNumber("003EBO_Atton_End") == 1))
    {
        AurPostString("CS: ATTON TELLS KREIA OFF", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_KREIA_OFF", TRUE);
        nScene = CUTSCENE_CUT_ATTON_KREIA_OFF;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_KREIA_GIVE")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_KREIA)
        &&  (GetInfluenceDiff(NPC_DISCIPLE, NPC_ATTON) >= 50)
        &&  (GetGlobalNumber("003EBO_Disciple_Atton") == 3))
    {
        AurPostString("CS: ATTON GIVES UP PLAYER KREIA", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_KREIA_GIVE", TRUE);
        nScene = CUTSCENE_CUT_ATTON_KREIA_GIVE;
    }
    else if (FALSE && !GetGlobalBoolean("CUT_ATTON_KREIA_TAKE"))
    {
        AurPostString("CS: ATTON KREIA TAKE OFF", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_KREIA_TAKE", TRUE);
        nScene = CUTSCENE_CUT_ATTON_KREIA_TAKE;
    }
    else if (!GetGlobalBoolean("CUT_BAO_CONFRONT_KRE")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_KREIA)
        &&  (GetGoodEvilValue(GetFirstPC()) < 30)
        &&  ((GetInfluence(NPC_BAO_DUR) > 80) || (GetInfluence(NPC_BAO_DUR) < 20)))
    {
        AurPostString("CS: BAODUR CONFRONTS KREIA", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_CONFRONT_KRE", TRUE);
        nScene = CUTSCENE_CUT_BAO_CONFRONT_KRE;
    }
    else if (!GetGlobalBoolean("CUT_DISC_WORLD_1")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  GetIsAvailable(NPC_KREIA)
        &&  (GetGlobalNumber("003EBO_Disciple_Event") == 0)
        &&  (PlanetCount() >= 2))
    {
        AurPostString("CS: DISCIPLE STUDIES WORLDS 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_DISC_WORLD_1", TRUE);
        nScene = CUTSCENE_CUT_DISC_WORLD_1;
    }
    else if (!GetGlobalBoolean("CUT_DISC_WORLD_2")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("003EBO_Disciple_Event") == 1)
        &&  (PlanetCount() >= 4))
    {
        AurPostString("CS: DISCIPLE STUDIES WORLDS 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_DISC_WORLD_2", TRUE);
        nScene = CUTSCENE_CUT_DISC_WORLD_2;
    }   
    else if (!GetGlobalBoolean("CUT_DISC_FORCE")
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("003EBO_Disciple_Event") == 2)
        &&  (GetGlobalNumber("003EBO_Kreia_Disciple") == 3))
    {
        AurPostString("CS: DISCIPLE PLAYER FORCE RESONANCE", 5, 15, 5.0);
        SetGlobalBoolean("CUT_DISC_FORCE", TRUE);
        nScene = CUTSCENE_CUT_DISC_FORCE;
    }
    else if (!GetGlobalBoolean("CUT_KREIA_DISC_1")
        &&  GetIsAvailable(NPC_KREIA)
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("003EBO_Kreia_Disciple") == 0))
    {
        AurPostString("CS: KREIA VS DISCIPLE 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_KREIA_DISC_1", TRUE);
        nScene = CUTSCENE_CUT_KREIA_DISC_1;
    }
    else if (!GetGlobalBoolean("CUT_KREIA_DISC_2")
        &&  GetIsAvailable(NPC_KREIA)
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("003EBO_Kreia_Disciple") == 1))
    {
        AurPostString("CS: KREIA VS DISCIPLE 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_KREIA_DISC_2", TRUE);
        nScene = CUTSCENE_CUT_KREIA_DISC_2;
    }   
    else if (!GetGlobalBoolean("CUT_KREIA_DISC_3")
        &&  GetIsAvailable(NPC_KREIA)
        &&  GetIsAvailable(NPC_DISCIPLE)
        &&  (GetGlobalNumber("003EBO_Kreia_Disciple") == 2))
    {
        AurPostString("CS: KREIA VS DISCIPLE 3", 5, 15, 5.0);
        SetGlobalBoolean("CUT_KREIA_DISC_3", TRUE);
        nScene = CUTSCENE_CUT_KREIA_DISC_3;
    }   
     else if (!GetGlobalBoolean("CUT_KREIA_VS_T3")
        &&  GetIsAvailable(NPC_KREIA)
        &&  GetIsAvailable(NPC_T3_M4)
        &&  (GetGlobalNumber("003EBO_T3_Holo_Seq") == 1))
    {
        AurPostString("CS: CUT_KREIA_VS_T3 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_KREIA_VS_T3", TRUE);
        nScene = CUTSCENE_CUT_KREIA_VS_T3;
    }
    else if (!GetGlobalBoolean("CUT_ATTON_BAO_PLAYER")
        &&  GetIsAvailable(NPC_ATTON)
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_T3_M4)
        &&  (GetGlobalBoolean("000_PLAYER_GENDER") == FALSE)
        &&  (GetInfluence(NPC_ATTON) >= 60))
    {
        AurPostString("CS: ATTON PLAYER BAODUR", 5, 15, 5.0);
        SetGlobalBoolean("CUT_ATTON_BAO_PLAYER", TRUE);
        nScene = CUTSCENE_CUT_ATTON_BAO_PLAYER;
    }
    else if (!GetGlobalBoolean("CUT_BAO_REMOTE_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        && (GetIsAvailable(NPC_T3_M4)
        &&  GetIsAvailable(NPC_G0T0) 
        &&  GetIsAvailable(NPC_HK_47)))
    {
        AurPostString("CS: BAODUR UPGRADE REMOTE 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_REMOTE_1", TRUE);
        nScene = CUTSCENE_CUT_BAO_REMOTE_1;
    }
    else if (!GetGlobalBoolean("CUT_BAO_REMOTE_2")
        &&  GetGlobalBoolean("CUT_BAO_REMOTE_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  (CheckNPCLevel(NPC_BAO_DUR) > 8))
    {
        AurPostString("CS: BAODUR UPGRADE REMOTE 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_REMOTE_2", TRUE);
        nScene = CUTSCENE_CUT_BAO_REMOTE_2;
    }
    else if (!GetGlobalBoolean("CUT_BAO_REMOTE_3")
        &&  GetGlobalBoolean("CUT_BAO_REMOTE_2")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  (CheckNPCLevel(NPC_BAO_DUR) > 10))
    {
        AurPostString("CS: BAODUR UPGRADE REMOTE 3", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_REMOTE_3", TRUE);
        nScene = CUTSCENE_CUT_BAO_REMOTE_3;
    }   
    else if (!GetGlobalBoolean("CUT_BAO_T3")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_T3_M4)
        &&  (GetGlobalNumber("262TEL_Escape_Telos") == 1))
    {
        AurPostString("CS: BAODUR UPGRADE T3", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_T3", TRUE);
        nScene = CUTSCENE_CUT_BAO_T3;
    }
    else if (!GetGlobalBoolean("CUT_BAO_HK47_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_HK_47)
        &&  (GetGlobalNumber("000_HK47_Joined") == 1))
    {
        AurPostString("CS: BAODUR UPGRADE HK47 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_HK47_1", TRUE);
        SetGlobalNumber("000_BAODUR_CS_LEVEL", CheckNPCLevel(NPC_BAO_DUR));
        nScene = CUTSCENE_CUT_BAO_HK47_1;
    }
    else if (!GetGlobalBoolean("CUT_BAO_HK47_2")
        &&  GetGlobalBoolean("CUT_BAO_HK47_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_HK_47)   
        &&  (CheckNPCLevel(NPC_BAO_DUR) > GetGlobalNumber("000_BAODUR_CS_LEVEL"))
        &&  (CheckNPCSkill(NPC_BAO_DUR, SKILL_REPAIR) > 15))
    {
        AurPostString("CS: BAODUR UPGRADE HK47 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_HK47_2", TRUE);
        nScene = CUTSCENE_CUT_BAO_HK47_2;
    }
    else if (!GetGlobalBoolean("CUT_BAO_G0T0_1")
        &&  GetIsAvailable(NPC_BAO_DUR) 
        &&  GetIsAvailable(NPC_G0T0))
    {
        AurPostString("CS: BAODUR UPGRATE GOTO 1", 5, 15, 5.0);
        SetGlobalNumber("003EBO_G0T0_BAO_2", 1);
        SetGlobalBoolean("CUT_BAO_G0T0_1", TRUE);
        nScene = CUTSCENE_CUT_BAO_G0T0_1;
    }
    else if (!GetGlobalBoolean("CUT_BAO_G0T0_2")
        &&  GetGlobalBoolean("CUT_BAO_G0T0_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_G0T0)
        &&  (GetGlobalNumber("003EBO_G0T0_BAO_2") == 2))
    {
        AurPostString("CS: BAODUR UPGRADE GOTO 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_G0T0_2", TRUE);
        nScene = CUTSCENE_CUT_BAO_G0T0_2;
    }
     else if (!GetGlobalBoolean("CUT_BAO_G0T0_3")
        &&  GetGlobalBoolean("CUT_BAO_G0T0_2")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_G0T0)
        &&  (GetGlobalNumber("003EBO_G0t0_Remote") == 1)
        &&  (GetGlobalNumber("000_Jedi_Found") > 2))
    {
        AurPostString("CS: BAODUR UPGRADE GOTO 3", 5, 15, 5.0);
        SetGlobalNumber("003EBO_G0t0_Remote", 2);
        SetGlobalBoolean("CUT_BAO_G0T0_3", TRUE);
        nScene = CUTSCENE_CUT_BAO_G0T0_3;
    }
    else if (!GetGlobalBoolean("CUT_BAO_MALACHOR")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_CANDEROUS)
        &&  (GetInfluence(NPC_BAO_DUR) > 85))
    {
        AurPostString("CS: BAODUR MALACHOR TALK influence = " + IntToString(GetInfluence(NPC_BAO_DUR)), 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_MALACHOR", TRUE);
        nScene = CUTSCENE_CUT_BAO_MALACHOR;
    }
    else if (!GetGlobalBoolean("CUT_BAO_VS_MAND_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_CANDEROUS))
    {
        AurPostString("CS: BAODUR VS MANDALORE 1", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_VS_MAND_1", TRUE);
        nScene = CUTSCENE_CUT_BAO_VS_MAND_1;
    }
    else if (!GetGlobalBoolean("CUT_BAO_VS_MAND_2")
        &&  GetGlobalBoolean("CUT_BAO_VS_MAND_1")
        &&  GetIsAvailable(NPC_BAO_DUR)
        &&  GetIsAvailable(NPC_CANDEROUS)
        &&  (GetInfluence(NPC_BAO_DUR) > 85)
        &&  (GetInfluence(NPC_CANDEROUS) > 75))
    {
        AurPostString("CS: BAODUR VS MANDALORE 2", 5, 15, 5.0);
        SetGlobalBoolean("CUT_BAO_VS_MAND_2", TRUE);
        nScene = CUTSCENE_CUT_BAO_VS_MAND_2;
    }
	else if (!GetGlobalBoolean("CUT_DXUN_REPAIR")
		&& (GetGlobalNumber("401_DXN_Repair") == 1)
		&& (GetGlobalNumber("502OND_End_First") == 0))
	{
		AurPostString("CS: Atton Repair sequence", 5, 15, 5.0);
		SetGlobalBoolean("CUT_DXUN_REPAIR", TRUE);
		nScene = CUTSCENE_CUT_DXUN_REPAIR;
	}
    else {
        AurPostString("CS: NO PENDING CUTSCENE", 5, 15, 5.0);
        nScene = CUTSCENE_NONE;
    }
    
    RunCutscene(nScene);
}

// ---------------------------------------------------------------
// ST: Setup and run the specified cutscene.
// ---------------------------------------------------------------
void RunCutscene(int nScene) {
    object oPC = GetFirstPC();
    
    if (nScene == CUTSCENE_NONE) {
        AurPostString("CS: SPAWNING PARTY NO_PENDING_CUTSCENE", 5, 17, 5.0);
        SetGlobalBoolean("003_cutscene_mode", FALSE);
        ResetEbonHawk();
        DelayedFadeIn(0.0, 1.0, 1.0);
    }
    else if (nScene == CUTSCENE_CUT_BAODUR_LIGHTSABER) { 
        AurPostString("CS: BAODUR LIGHTSABER", 5, 17, 5.0);
        object oBao = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_4");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("WP_player_cut_7")));
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baosaber", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_FIRST_ATTON) { 
        AurPostString("CS: FIRST ATTON EBO CUT SCENE", 5, 17, 5.0);
        object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_gspawn_atton");
        object oT3M4  = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_7");
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_6");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_6"))));
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "003Atton", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_SECOND_ATTON) { 
        AurPostString("CS: SECOND ATTON EBO CUT SCENE", 5, 17, 5.0);
        object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_7");
        object oT3M4  = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_7");
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_6");
        
        SetGlobalNumber("003EBO_BACKGROUND", 10);
        SetBackground();
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_6"))));   
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "003Atton", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));   
    }
    else if (nScene == CUTSCENE_VISAS_ARRIVES) { 
        AurPostString("CS: PLAYING SCENE VISAS_ARRIVES", 5, 17, 5.0);
        int i = 0;
        object oNPC;
        
        for(i = 0; i < 12; ++i) { // ST: A bug! Atton won't be set to minhp1.
            oNPC = GetObjectByTag(GetNPCTag(i));
            SetMinOneHP(oNPC, TRUE);
        }       
        
        SetGlobalBoolean("VISAS_ARRIVES_CONV", TRUE);
        object oVisas = CreateObject(OBJECT_TYPE_CREATURE, "visascut", GetLocation(GetObjectByTag("wp_visas_sp")));
        AssignCommand(oVisas, ClearAllActions());
        ClearEbonHawk();
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oVisas, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));   
    }
    else if (nScene == CUTSCENE_CUT_MSG_FROM_KELBORN) {
        AurPostString("CS: PLAYING SCENE MESSAGE_FROM_KELBORN", 5, 17, 5.0);
        object oT3M4  = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_6");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("WP_player_cut_4")));
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oT3M4, ActionStartConversation(oPC, "t3kelbrn", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));    
    }
    else if (nScene == CUTSCENE_CUT_HK47_VS_HK50) { 
        AurPostString("CS: PLAYING SCENE_CUT_HK47_VS_HK50", 5, 17, 5.0);
        object oHK47 = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_baodur_cut_3");
        object oAtton  = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_6");
        object oHK50 = CreateObject(OBJECT_TYPE_CREATURE, "hk50cut",Location(Vector(59.10990,34.51765,1.80000),30.0f));
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(Location(Vector(64.67178,33.25113,1.80000),145.0f)));

        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oHK47, ActionStartConversation(oPC, "hk47tort", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if ((nScene == CUTSCENE_CUT_ATTON_T3_PAZAAK_1) 
		|| 	 (nScene == CUTSCENE_CUT_ATTON_T3_ARGUE)) 
	{ 
		AurPostString("CS: PLAYING SCENE ATTON_T3_PAZAAK_1 or ARGUE", 5, 17, 5.0);
		object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_1");
		object oT3M4  = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_2");

		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_1"))));		
		DelayedFadeIn(0.0, 1.0, 1.0);
		DelayCommand(1.0, AssignCommand(oT3M4, ActionStartConversation(oPC, "Attt3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if (nScene == CUTSCENE_CUT_ATTON_T3_PAZAAK_2) 
	{ 
		AurPostString("CS: PLAYING SCENE ATTON_T3_PAZAAK_2", 5, 17, 5.0);
		object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_1");
		object oT3M4  = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_2");
		object oHK47 = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_disc_cut_5");
		
		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_1"))));		
		DelayedFadeIn(0.0, 1.0, 1.0);
		DelayCommand(1.0, AssignCommand(oT3M4, ActionStartConversation(oPC, "Attt3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
    else if (nScene == CUTSCENE_CUT_ATTON_MAID_FIGHT) { 
        AurPostString("CS: PLAYING SCENE ATTON_HANDMAIDEN_FIGHT", 5, 17, 5.0);
        object oAtton  = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_2");
        object oMaiden = GetAndMoveNPCToWaypoint(NPC_HANDMAIDEN, "WP_maid_cut_1");
        object oInvis  = GetObjectByTag("MaidInvis"); 
        
        AssignCommand(oInvis, ClearAllActions());
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oInvis, ActionStartConversation(oPC, "atthand", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if ((nScene == CUTSCENE_CUT_ATTON_KREIA_OFF)  
        ||   (nScene == CUTSCENE_CUT_ATTON_KREIA_GIVE)
        ||   (nScene == CUTSCENE_CUT_ATTON_KREIA_TAKE))
    {
        AurPostString("CS: PLAYING SCENE ATTON_TELLS/GIVESUP/TAKEOFF", 5, 17, 5.0);
        object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_5");
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_3");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "Attkreia", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_ATTON_BAO_PLAYER) { 
        AurPostString("CS: PLAYING SCENE ATTON_BAODUR_PLAYER", 5, 17, 5.0);
        object oAtton  = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_6");
        object oBao    = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_2");
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_3");
        object oT3M4   = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_5");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "baoatt_p", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_CONFRONT_KRE) { 
        AurPostString("CS: PLAYING SCENE BAODUR_CONFRONT_KREIA", 5, 17, 5.0);
        object oBao   = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_1");
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_3"); 
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baokreia", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_REMOTE_1) { 
        object oBao    = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_3");
        object oDroid;
        if (GetIsAvailable(NPC_G0T0)) 
            oDroid = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_extra_1");
        else if (GetIsAvailable(NPC_HK_47))
            oDroid = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_extra_1");
        else if (GetIsAvailable(NPC_T3_M4)) 
            oDroid = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_extra_1");
            
        AssignCommand(oPC, ClearAllActions());
        object oWP = GetObjectByTag("WP_player_extra");
        if (GetIsObjectValid(oWP)) {
            location lLoc = GetLocation(oWP);
            AssignCommand(oPC, ActionJumpToLocation(lLoc));
        }
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baorem1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_REMOTE_2) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_REMOTE_2", 5, 17, 5.0);
        object oBao    = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_3");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baorem2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));          
    }
    else if (nScene == CUTSCENE_CUT_BAO_REMOTE_3) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_REMOTE_3", 5, 17, 5.0);
        object oBao = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_3");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baorem3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_T3) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_T3", 5, 17, 5.0);
        object oBao  = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oT3M4 = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_patient_cut");
        
        AssignCommand(oPC, ClearAllActions());
        object oWP = GetObjectByTag("WP_player_extra");
        if (GetIsObjectValid(oWP)) {
            location lLoc = GetLocation(oWP);
            AssignCommand(oPC, ActionJumpToLocation(lLoc));
        }
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "bao_t3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_HK47_1) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_HK47_1", 5, 17, 5.0);
        object oBao  = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oHK47 = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_patient_cut");
        
        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baohk_1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_HK47_2) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_HK47_2", 5, 17, 5.0);
        object oBao  = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oHK47 = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_patient_cut");
        
        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "baohk_2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_G0T0_1) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_G0T0_1", 5, 17, 5.0);
        object oBao  = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oGoto = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_patient_cut");
        
        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "bao_g0_1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_G0T0_2) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_G0T0_2", 5, 17, 5.0);
        object oBao    = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oGoto   = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_patient_cut");
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_4");
        
        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "bao_g0_2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_G0T0_3) { 
        AurPostString("CS: PLAYING SCENE BAODUR_UPGRADE_GOTO_3", 5, 17, 5.0);
        object oBao    = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_3");
        object oGoto   = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_patient_cut");
        
        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "bao_g0_3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_MALACHOR) { 
        AurPostString("CS: PLAYING SCENE BAODUR_MALACHOR_TALK", 5, 17, 5.0);
        object oBao    = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_baodur_cut_4");
		object oDroid;
        if (GetIsAvailable(NPC_HK_47))
            oDroid = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_atton_cut_3");
            
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_7"))));
        DelayedFadeIn(0.0, 1.0, 1.0);   
        DelayCommand(1.0, AssignCommand(oBao, ActionStartConversation(oPC, "bao_malv", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_BAO_VS_MAND_1) { 
        AurPostString("CS: PLAYING SCENE BAODUR_VS_MAND_1", 5, 17, 5.0);
        object oCand = GetAndMoveNPCToWaypoint(NPC_CANDEROUS, "WP_disc_cut_1");
        object oBao  = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_disc_cut_1");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_disc_cut_1"))));
        DelayCommand(1.0, AssignCommand(oCand, ActionStartConversation(oPC, "mand1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_BAO_VS_MAND_2) { 
        AurPostString("CS: PLAYING SCENE BAODUR_VS_MAND_2", 5, 17, 5.0);
        object oCand = GetAndMoveNPCToWaypoint(NPC_CANDEROUS, "WP_disc_cut_1");
        object oBao  = GetAndMoveNPCToWaypoint(NPC_BAO_DUR, "WP_disc_cut_1");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oCand, ActionStartConversation(oPC, "mand2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_DISC_PLAYER_MED) { 
        AurPostString("CS: PLAYING SCENE DISC_PLAYER_MEDITATE", 5, 17, 5.0);
        object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_3");
        object oMira  = GetAndMoveNPCToWaypoint(NPC_MIRA, "WP_mira_cut_2");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_1");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_2"))));
   
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "Disc4", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if ((nScene == CUTSCENE_CUT_ATTON_DISC_1) || (nScene == CUTSCENE_CUT_ATTON_DISC_2)) { 
        AurPostString("CS: PLAYING SCENE DISC_ATTON_FIGHT_1OR2", 5, 17, 5.0);
        object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_4");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_2"); 
        
        SetLockOrientationInDialog(oAtton, TRUE);
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "003Disci", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_ATTON_DISC_3) { 
        AurPostString("CS: PLAYING SCENE DISC_ATTON_FIGHT_3", 5, 17, 5.0);
        object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_2");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_4"); 
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "003Disci", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_DISC_TELOS) { 
        AurPostString("CS: DISC_CONTACTS_TELOS doesn't exist", 5, 17, 5.0);
    }
    else if (nScene == CUTSCENE_CUT_DISC_WORLD_1) { 
        AurPostString("CS: PLAYING SCENE DISC_STUDY_WORLD_1", 5, 17, 5.0);
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_3");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_5");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_3"))));   
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oDisc, ActionStartConversation(oPC, "Disc1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_DISC_WORLD_2) { 
        AurPostString("CS: PLAYING SCENE DISC_STUDY_WORLD_2", 5, 17, 5.0);
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_5");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_5"))));   
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oDisc, ActionStartConversation(oPC, "Disc2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_DISC_FORCE) { 
        AurPostString("CS: PLAYING SCENE DISC_RESONANCE_FORCE", 5, 17, 5.0);
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_5");
        
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_player_cut_5"))));   
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oDisc, ActionStartConversation(oPC, "Disc3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_DISC_REVAN) { 
        AurPostString("CS: DISC_REVAN doesn't exist", 5, 17, 5.0);
    }
    else if (nScene == CUTSCENE_CUT_G0T0_HK47_1) { 
        AurPostString("CS: PLAYING SCENE G0T0_HK47_1", 5, 17, 5.0);
        object oGoto = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_g0t0_cut_1");
        object oHK47 = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_hk47_cut_1");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oGoto, ActionStartConversation(oPC, "g0t0hk47", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_G0T0_REMOTE_1) { 
        AurPostString("CS: PLAYING SCENE G0T0_REMOTE_1", 5, 17, 5.0);
        object oGoto   = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_g0t0_cut_2");    
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_1");
    
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oGoto, ActionStartConversation(oPC, "G0T0rem1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_G0T0_REMOTE_2) { 
        AurPostString("CS: PLAYING SCENE G0T0_REMOTE_2", 5, 17, 5.0);
        object oGoto   = GetAndMoveNPCToWaypoint(NPC_G0T0, "WP_g0t0_cut_3");    
        object oRemote = GetAndMovePUPToWaypoint(PUP_SENSORBALL, "WP_remote_cut_2");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oGoto, ActionStartConversation(oPC, "G0T0rem1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_KREIA_VS_T3) { 
        AurPostString("CS: PLAYING SCENE CUT_KREIA_VS_T3", 5, 17, 5.0);
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_hanharr_02");
        object oT3M4  = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_hanharr_03");
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oKreia, ActionStartConversation(oPC, "kreia_t3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_KREIA_MAID_1) { 
        AurPostString("CS: PLAYING SCENE KREIA_HANDMAIDEN_DS_1", 5, 17, 5.0);
        object oKreia   = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_2");
        object oMaiden  = GetAndMoveNPCToWaypoint(NPC_HANDMAIDEN, "WP_maid_cut_4");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oKreia, ActionStartConversation(oPC, "krehand", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_KREIA_MAID_2) { 
        AurPostString("CS: PLAYING SCENE KREIA_HANDMAIDEN_DS_2", 5, 17, 5.0);
        object oKreia   = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_3");
        object oMaiden  = GetAndMoveNPCToWaypoint(NPC_HANDMAIDEN, "WP_maid_cut_5");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oKreia, ActionStartConversation(oPC, "krehand2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }                       
    else if (nScene == CUTSCENE_CUT_KREIA_DISC_1) { 
        AurPostString("CS: PLAYING SCENE KREIA_VS_DISC_1", 5, 17, 5.0);
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_4");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_6"); 

        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oKreia, ActionStartConversation(oPC, "kredisc1", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_KREIA_DISC_2) { 
        AurPostString("CS: PLAYING SCENE KREIA_VS_DISC_2", 5, 17, 5.0);
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_3");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_7"); 

        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oKreia, ActionStartConversation(oPC, "kredisc2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_KREIA_DISC_3) { 
        AurPostString("CS: PLAYING SCENE KREIA_VS_DISC_3", 5, 17, 5.0);
        object oKreia = GetAndMoveNPCToWaypoint(NPC_KREIA, "WP_kreia_cut_5");
        object oDisc  = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_5"); 

        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oKreia, ActionStartConversation(oPC, "kredisc3", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }
    else if (nScene == CUTSCENE_CUT_MIRA_MAID) { 
        AurPostString("CS: PLAYING SCENE MIRA_HANDMAIDEN_TALK", 5, 17, 5.0);
        object oMira   = GetAndMoveNPCToWaypoint(NPC_MIRA, "WP_mira_cut_1");
        object oMaiden = GetAndMoveNPCToWaypoint(NPC_HANDMAIDEN, "WP_maid_cut_3");
        object oVisas  = GetAndMoveNPCToWaypoint(NPC_VISAS, "WP_visas_cut_1");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oMira, ClearAllActions()));
        DelayCommand(1.0, AssignCommand(oMira, ActionStartConversation(oPC, "mirvisha", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
        
    }
    else if (nScene == CUTSCENE_CUT_T3_VS_HK47) { 
        AurPostString("CS: PLAYING SCENE T3_HK47_CONFRONT", 5, 17, 5.0);
        object oT3M4 = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_3");
        object oHK47 = GetAndMoveNPCToWaypoint(NPC_HK_47, "WP_hk47_cut_2");
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oT3M4, ActionStartConversation(oPC, "hk47t3m4", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_T3_DISC_HOLO) { 
        AurPostString("CS: PLAYING SCENE T3_DISC_HOLO", 5, 17, 5.0);
        object oT3M4 = GetAndMoveNPCToWaypoint(NPC_T3_M4, "WP_t3m4_cut_4");
        object oDisc = GetAndMoveNPCToWaypoint(NPC_DISCIPLE, "WP_disc_cut_3");  
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oDisc, ActionStartConversation(oPC, "t3disc", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
    }   
    else if (nScene == CUTSCENE_CUT_VISAS_VS_MAID) { 
        AurPostString("CS: PLAYING SCENE VISAS_HANDMAIDEN_ARGUE", 5, 17, 5.0);
        object oMaiden = GetAndMoveNPCToWaypoint(NPC_HANDMAIDEN, "WP_maid_cut_2");
        object oVisas  = GetAndMoveNPCToWaypoint(NPC_VISAS, "WP_visas_cut_1");  
        
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oMaiden, ActionStartConversation(oPC, "vishand", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));   
    }
	else if (nScene == CUTSCENE_CUT_DXUN_REPAIR) {
		AurPostString("CS: PLAYING SCENE DXUN REPAIR", 5, 17, 5.0);
		object oAtton = GetAndMoveNPCToWaypoint(NPC_ATTON, "WP_atton_cut_5");
        AssignCommand(oAtton, ActionJumpToLocation(Location(Vector(49.48461, 13.76047, 1.90688), 60.0)));
        
		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oPC, ActionJumpToLocation(Location(Vector(50.10149, 14.13831, 1.90688), 60.0)));
        DelayedFadeIn(0.0, 1.0, 1.0);
        DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oPC, "ond_rece", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
    else { 
        AurPostString("CUTSCENE: SHOULD NOT BE HITTING THIS!  REPORT TO ANTHONYD.", 5, 17, 10.0);
        SetGlobalBoolean("003_cutscene_mode", FALSE);
        ResetEbonHawk();
        AssignCommand(oPC, ClearAllActions());
        DelayedFadeIn(0.0, 1.0, 1.0);
    }   
}

// ---------------------------------------------------------------
// ST: Utility - Identical to one found in k_align_movie.
//     Returns the number of visited planets.
// ---------------------------------------------------------------
int PlanetCount() {
    int i = 0;
    if( GetGlobalBoolean("201_First_Enter") )
        i++;
    if( GetGlobalBoolean("301_First_Enter") )
        i++;
    if( GetGlobalBoolean("401_First_Enter") )
        i++;
    if( GetGlobalBoolean("501_First_Enter") )
        i++;
    if( GetGlobalBoolean("601_First_Enter") )
        i++;
    if( GetGlobalBoolean("701_First_Enter") )
        i++;
    if( GetGlobalBoolean("801_First_Enter") )
        i++;
    return i;
}

// ---------------------------------------------------------------
// ST: Utility - Check if a NPC has joined the party.
// ---------------------------------------------------------------
int GetIsAvailable(int nNPC) {
    int bTest = GetNPCSelectability(nNPC);  
    if ((bTest == TRUE) || (bTest == 0))
        return TRUE;
    else
        return FALSE;
}

// ---------------------------------------------------------------
// ST: Utility - returns difference between two party members
//     influence with the player.
// ---------------------------------------------------------------
int GetInfluenceDiff(int nNPC1, int nNPC2) {
    int nInf1 = GetInfluence(nNPC1);
    int nInf2 = GetInfluence(nNPC2);
    
    return (nInf1 - nInf2);
}

// ---------------------------------------------------------------
// ST: Utility - return character level of specified party member.
// ---------------------------------------------------------------
int CheckNPCLevel(int nNPC) {
    object oNPC = GetObjectByTag(GetNPCTag(nNPC));
    
    if (GetIsObjectValid(oNPC)) {
        int nLevel = GetHitDice(oNPC);
        return nLevel;
    }
    return 0;
}

// ---------------------------------------------------------------
// ST: Utility Returns the points in a skill a party member has.
// ---------------------------------------------------------------
int CheckNPCSkill(int nNPC, int nType) {
    object oNPC = GetObjectByTag(GetNPCTag(nNPC));
    int nSkill = 0;
    
    if (GetIsObjectValid(oNPC)) {
        nSkill = GetSkillRank(nType, oNPC);
    }
    return nSkill;
}

// ---------------------------------------------------------------
// ST: Utility - a completely unnessecary wrapper. Fade from black.
// ---------------------------------------------------------------
void DelayedFadeIn(float fDelay, float fWait, float fLength) {
    DelayCommand(fDelay, SetGlobalFadeIn(fWait, fLength));
}

// ---------------------------------------------------------------
// ST: Utility - move party member to specified waypoint and return
//     object reference to the party member if successful.
// ---------------------------------------------------------------
object GetAndMoveNPCToWaypoint(int nNPC, string sTag) {
    object oNPC = GetObjectByTag(GetNPCTag(nNPC));
    object oWP  = GetObjectByTag(sTag);
    
    if (GetIsObjectValid(oWP)) {
        AssignCommand(oNPC, ClearAllActions());
        AssignCommand(oNPC, ActionJumpToLocation(GetLocation(oWP)));
        return oNPC;
    }
    else {
        AurPostString("INVALID WAYPOINT FOR CUTSCENE", 15, 20, 10.0);
        return OBJECT_INVALID;
    }
}

// ---------------------------------------------------------------
// ST: Utility - move Puppet to specified waypoint and return an
//               object reference to the puppet if successful.
// ---------------------------------------------------------------
object GetAndMovePUPToWaypoint(int nPUP, string sTag) {
    object oPUP = GetObjectByTag(GetPuppetTag(nPUP));
    object oWP  = GetObjectByTag(sTag);
    
    if (GetIsObjectValid(oWP)) {
        AssignCommand(oPUP, ClearAllActions());
        AssignCommand(oPUP, ActionJumpToLocation(GetLocation(oWP)));
        return oPUP;
    }
    else {
        AurPostString("INVALID WAYPOINT FOR CUTSCENE", 15, 20, 10.0);
        return OBJECT_INVALID;
    }
}