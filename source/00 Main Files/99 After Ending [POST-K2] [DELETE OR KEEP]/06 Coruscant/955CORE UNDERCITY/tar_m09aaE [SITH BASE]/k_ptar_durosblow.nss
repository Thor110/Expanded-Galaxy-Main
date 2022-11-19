void main() {
	location location1 = GetLocation(GetObjectByTag("wp_Duros", 0));
	ApplyEffectAtLocation(0, EffectVisualEffect(3010, 0), location1, 0.0);
	CreateObject(64, "plc_burnjunk", location1, 0);
	ActionPauseConversation();
	ActionWait(0.7);
	ActionResumeConversation();
}

