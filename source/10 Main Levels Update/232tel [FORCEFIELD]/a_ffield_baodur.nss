void main() {
	if ((GetLastAttacker(OBJECT_SELF) == GetObjectByTag("baodur", 0))) {
		//object object3 = OBJECT_SELF;
		//AssignCommand(object3, ActionUnlockObject(object3));
		//AssignCommand(object3, ActionOpenDoor(object3));
	}
	else {
		DelayCommand(0.1, ActionStartConversation(OBJECT_SELF, "ffield", 0, 0, 0, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
	}
}

