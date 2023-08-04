void main() {
	object oHarbAnimController = GetObjectByTag("HarbAnimController", 0);
	SetGlobalFadeIn(0.5, 1.0, 0.0, 0.0, 0.0);
	AssignCommand(GetFirstPC(), SetFacing(270.0));
	StartNewModule("154HAR", "", "PerMov08", "", "", "", "", "");
}

