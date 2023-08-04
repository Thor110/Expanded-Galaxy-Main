void main() {
	object oIthorakDoor2 = GetObjectByTag("IthorakDoor2", 0);
	AssignCommand(oIthorakDoor2, ActionCloseDoor(oIthorakDoor2));
	DelayCommand(0.2, SetLocked(oIthorakDoor2, 1));
}

