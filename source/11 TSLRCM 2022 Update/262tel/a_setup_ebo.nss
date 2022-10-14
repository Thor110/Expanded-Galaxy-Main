void main() {
	if (GetIsPartyLeader(GetEnteringObject())) {
		if ((GetGlobalNumber("000_Jedi_Found") == 4)) {
			return;
		}
		if ((GetGlobalNumber("262TEL_Escape_Telos") == 1)) {
			//SetGlobalNumber("003EBO_BACKGROUND", 2);
			//SetGlobalNumber("003EBO_RETURN_DEST", 2);
      SetGlobalNumber("003EBO_BACKGROUND", 10);
      SetGlobalNumber("003EBO_RETURN_DEST", 8);
			StartNewModule("003EBO", "wp_from_outside", "", "", "", "", "", "");
		}
		else {
			if ((GetGlobalNumber("262TEL_CNPC_Freed") == 0)) {
				AssignCommand(GetObjectByTag("262Exit", 0), ClearAllActions());
				AssignCommand(GetObjectByTag("262Exit", 0), ActionStartConversation(GetFirstPC(), "262Exit", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			}
			else {
				AssignCommand(GetObjectByTag("262Exit", 0), ClearAllActions());
				AssignCommand(GetObjectByTag("262Exit", 0), ActionStartConversation(GetFirstPC(), "ebonhawk", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0));
			}
		}
	}
}

