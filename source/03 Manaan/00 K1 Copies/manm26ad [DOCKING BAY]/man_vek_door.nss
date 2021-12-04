void main() {
	object oNearestIthorakDoor1 = GetNearestObjectByTag("IthorakDoor1", OBJECT_SELF, 1);
	object oVekdroid = GetObjectByTag("Vekdroid", 0);
	if ((GetEnteringObject() == oVekdroid)) {
		AssignCommand(oNearestIthorakDoor1, ActionOpenDoor(OBJECT_SELF));
		DelayCommand(0.1, DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	}
}

