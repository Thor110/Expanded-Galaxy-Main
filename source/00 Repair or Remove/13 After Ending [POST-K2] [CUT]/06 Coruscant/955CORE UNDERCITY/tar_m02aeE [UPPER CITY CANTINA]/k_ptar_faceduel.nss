void main() {
	object oTar02_wpopparena2 = GetObjectByTag("tar02_wpopparena2", 0);
	ClearAllActions();
	ActionDoCommand(SetFacingPoint(GetPosition(oTar02_wpopparena2)));
}

