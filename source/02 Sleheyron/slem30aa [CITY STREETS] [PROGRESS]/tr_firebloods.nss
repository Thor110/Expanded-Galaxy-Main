void main() {
  object oRodian2 = GetObjectByTag("rodian2", 0);
  object oRodian1 = GetObjectByTag("rodian1", 0);
  object oRodian3 = GetObjectByTag("rodian3", 0);
  object oRodian4 = GetObjectByTag("rodian4", 0);
  ChangeToStandardFaction(oRodian2, 1);
  AssignCommand(oRodian2, ActionAttack(GetFirstPC(), 0));
  ChangeToStandardFaction(oRodian1, 1);
  AssignCommand(oRodian1, ActionAttack(GetFirstPC(), 0));
  ChangeToStandardFaction(oRodian3, 1);
  AssignCommand(oRodian3, ActionAttack(GetFirstPC(), 0));
  ChangeToStandardFaction(oRodian4, 1);
  AssignCommand(oRodian4, ActionAttack(GetFirstPC(), 0));
  SetAreaUnescapable(1);
  SetGlobalNumber("SLE_FIREBLOODS", 2);
}

