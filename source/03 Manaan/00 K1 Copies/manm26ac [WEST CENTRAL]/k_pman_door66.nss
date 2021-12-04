void main() {
	object oMan26_sithkol1 = GetObjectByTag("man26_sithkol1", 0);
	SignalEvent(GetObjectByTag("man26_repkol2", 0), EventUserDefined(100));
	DelayCommand(5.0, SignalEvent(oMan26_sithkol1, EventUserDefined(100)));
}

