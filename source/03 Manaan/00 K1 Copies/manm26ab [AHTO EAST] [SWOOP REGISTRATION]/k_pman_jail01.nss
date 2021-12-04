void main() {
	int int1 = 0;
	while ((int1 <= 8)) {
		if (IsNPCPartyMember(int1)) {
		}
		(int1++);
	}
	SetGlobalBoolean("MAN_GO_TO_JAIL", 1);
	StartNewModule("manm26aa", "manm28_pcjail", "", "", "", "", "", "");
}

