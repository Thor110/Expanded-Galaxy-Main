void main() {
	object oPtar_elevdoor = GetObjectByTag("ptar_elevdoor", 0);
	DelayCommand(1.0, AssignCommand(oPtar_elevdoor, ActionOpenDoor(oPtar_elevdoor)));
}

