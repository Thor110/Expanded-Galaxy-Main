void main() {
	SetLocalBoolean(GetObjectByTag("SwoopMC"), 50, TRUE);
	if(GetGlobalBoolean("003_swoop")) StartNewModule("tat_m17mg");
	else StartNewModule("tat_m17mgup");
}

