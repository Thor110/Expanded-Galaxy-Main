void main() {
	SetGlobalNumber("Tar_Canderous", 2);
	SignalEvent(GetObjectByTag("canderous043", 0), EventUserDefined(3000));
	DelayCommand(1.0, SignalEvent(GetObjectByTag("daviktroop041", 0), EventUserDefined(3000)));
	DelayCommand(2.0, SignalEvent(GetObjectByTag("daviktroop042", 0), EventUserDefined(3000)));
	DelayCommand(3.0, SignalEvent(GetObjectByTag("daviktroop043", 0), EventUserDefined(3000)));
}

