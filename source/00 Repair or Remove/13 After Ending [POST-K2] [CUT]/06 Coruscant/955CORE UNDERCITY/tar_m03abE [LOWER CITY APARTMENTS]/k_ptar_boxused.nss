void main() {
	if ((GetGlobalNumber("Tar_StrongBox") < 3)) {
		ActionStartConversation(GetLastUsedBy(), "", 0, 0, 0, "", "", "", "", "", "");
	}
}

