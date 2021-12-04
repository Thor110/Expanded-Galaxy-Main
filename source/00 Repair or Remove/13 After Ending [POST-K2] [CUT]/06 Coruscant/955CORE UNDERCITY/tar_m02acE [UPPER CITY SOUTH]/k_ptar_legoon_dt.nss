void main() {
	SetGlobalNumber("tar_gana", (GetGlobalNumber("tar_gana") + 5));
	SignalEvent(GetObjectByTag("GanaLavin021", 0), EventUserDefined(2000));
}

