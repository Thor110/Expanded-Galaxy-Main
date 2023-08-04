void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 10:
			ClearAllActions();
			ActionForceMoveToObject(GetObjectByTag(("group_" + GetTag(OBJECT_SELF)), 0), 0, 1.0, 30.0);
			ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("face_sith", 0))));
			ActionDoCommand(SetCommandable(1, OBJECT_SELF));
			SetCommandable(0, OBJECT_SELF);
			break;
	}
}

