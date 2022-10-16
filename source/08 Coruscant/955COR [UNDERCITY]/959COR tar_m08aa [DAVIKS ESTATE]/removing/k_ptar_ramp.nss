void main() {
	object oCalo082 = GetObjectByTag("Calo082", 0);
	if ((!GetIsObjectValid(oCalo082))) {
		ActionStartConversation(GetLastUsedBy(), "", 0, 0, 0, "", "", "", "", "", "");
	}
}

