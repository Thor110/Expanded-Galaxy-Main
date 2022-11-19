void main() {
	DelayCommand(6.0, ActionCloseDoor(OBJECT_SELF));
	DelayCommand(7.0, ActionLockObject(OBJECT_SELF));
}

