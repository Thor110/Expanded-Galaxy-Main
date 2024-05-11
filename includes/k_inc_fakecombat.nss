//:: k_inc_fakecombat
/*
     routines for doing fake combat
*/
//:: Created By: Jason Booth
//:: Copyright (c) 2002 Bioware Corp.

#include "k_inc_generic"
void FAI_EnableFakeMode(object oTarget,int iFaction);
void FAI_DisableFakeMode(object oTarget,int iFaction);
void FAI_PerformFakeAttack(object oAttacker,object oTarget,int bLethal = FALSE);
void FAI_PerformFakeTalent(object oAttacker,object oTarget,talent t,int bLethal = FALSE);

void FAI_EnableFakeMode(object oTarget,int iFaction)
{
  if(!GetIsObjectValid(oTarget))
  {
    return;
  }

  SetCommandable(TRUE,oTarget);
  AssignCommand(oTarget,ClearAllActions());
  SetLocalBoolean(oTarget,SW_FLAG_AI_OFF,TRUE);
  AurPostString("TURNING AI OFF - " + GetTag(oTarget),5,5,5.0);
  ChangeToStandardFaction(oTarget,iFaction);
  SetMinOneHP(oTarget,TRUE);
}

void FAI_DisableFakeMode(object oTarget,int iFaction)
{
  if(!GetIsObjectValid(oTarget))
  {
    return;
  }

  SetCommandable(TRUE,oTarget);
  SetLocalBoolean(oTarget,SW_FLAG_AI_OFF,FALSE);
  ChangeToStandardFaction(oTarget,iFaction);
  SetMinOneHP(oTarget,FALSE);
}

void DoFakeAttack(object oTarget,int bLethal)
{
  if(bLethal)
  {
    SetMinOneHP(oTarget,FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(oTarget)-1),
      oTarget);
    //CutsceneAttack(oTarget,ACTION_ATTACKOBJECT,ATTACK_RESULT_HIT_SUCCESSFUL,1000);
  }
  //else
  //{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectAssuredHit(),OBJECT_SELF,3.0);
    ActionAttack(oTarget);
 //}
}

void FAI_PerformFakeAttack(object oAttacker,object oTarget,int bLethal = FALSE)
{
  if(!GetIsObjectValid(oAttacker) || !GetIsObjectValid(oTarget))
  {
    return;
  }

  AssignCommand(oAttacker,ActionDoCommand(DoFakeAttack(oTarget,bLethal)));
}

void DoFakeTalent(object oTarget,talent t,int bLethal)
{
  if(bLethal)
  {
    SetMinOneHP(oTarget,FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(oTarget)-1),
      oTarget);
  }

  ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectAssuredHit(),OBJECT_SELF,3.0);
  ActionUseTalentOnObject(t,oTarget);
}

void FAI_PerformFakeTalent(object oAttacker,object oTarget,talent t,int bLethal = FALSE)
{
  if(!GetIsObjectValid(oAttacker) || !GetIsObjectValid(oTarget))
  {
    return;
  }

  AssignCommand(oAttacker,ActionDoCommand(DoFakeTalent(oTarget,t,bLethal)));
}
