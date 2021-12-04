void main() {
	object object1 = OBJECT_SELF;
	if ((GetDistanceBetween(GetPartyMemberByIndex(0), object1) > 10.0)) {
		if (GetIsOpen(object1)) {
			ActionCloseDoor(object1);
		}
	}
}

