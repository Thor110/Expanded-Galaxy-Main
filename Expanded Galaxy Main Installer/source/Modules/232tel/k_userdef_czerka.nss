void main() {
  int eventNumber = GetUserDefinedEventNumber();
  switch (eventNumber) {
    case 1001:
      if (GetLocalBoolean(OBJECT_SELF, 30)) {
        AurPostString("k_userdef_czerka: be right there!", 5, 5, 1.0);
        ClearAllActions();
        object oLeader = GetPartyLeader();
        vector vRandom = GetRandomDestination(oLeader, 2);
        ActionMoveToLocation(Location(vRandom, GetFacing(oLeader)), 1);
      }
    break;
    case 1100:
      if (GetCommandable(OBJECT_SELF)) {
        ClearAllActions();
        CancelCombat(OBJECT_SELF);
        ActionMoveToObject(GetNearestObjectByTag("wp_homebase", OBJECT_SELF, 1), 1, 3.0);
        ActionDoCommand(SetCommandable(1, OBJECT_SELF));
        SetCommandable(0, OBJECT_SELF);
      }
    break;
	}
}