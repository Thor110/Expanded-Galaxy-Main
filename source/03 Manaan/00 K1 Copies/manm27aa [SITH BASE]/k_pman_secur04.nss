void main() {
	ActionPauseConversation();
	ActionDoCommand(SignalEvent(GetObjectByTag("man27_sithdip", 0), EventUserDefined(0)));
	AssignCommand(GetObjectByTag("pman_sithwara", 0), ActionMoveToObject(GetObjectByTag("POST_pman_sithwara", 0), 0, 1.0));
	AssignCommand(GetObjectByTag("pman_sithwarb", 0), ActionMoveToObject(GetObjectByTag("POST_pman_sithwarb", 0), 0, 1.0));
	AssignCommand(GetObjectByTag("pman_sithwarc", 0), ActionMoveToObject(GetObjectByTag("POST_pman_sithwarc", 0), 0, 1.0));
	AssignCommand(GetObjectByTag("pman_sithward", 0), ActionMoveToObject(GetObjectByTag("POST_pman_sithward", 0), 0, 1.0));
}

