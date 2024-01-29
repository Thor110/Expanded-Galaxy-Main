void main()
{
	object oDoor = GetObjectByTag("sw_door_test005");
	ActionOpenDoor(oDoor);
  object oHK501 = GetObjectByTag("HK501", 0);
	AssignCommand(oHK501, ActionStartConversation(GetFirstPC(), "hk_atk", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	DestroyObject(OBJECT_SELF, 0.0, 0, 0.0, 0);
}