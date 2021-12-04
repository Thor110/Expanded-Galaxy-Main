void main() {
	SetLocalBoolean(GetObjectByTag("SwoopMC"), 50, TRUE);
	if(GetGlobalBoolean("003_swoop")) StartNewModule("man_m26mg");
	else StartNewModule("man_m26mgup");
}

