void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		if (GetIsObjectValid(GetObjectByTag("tar10_waitress", 0))) {
		}
		SignalEvent(GetObjectByTag("tar10_waitress", 0), EventUserDefined(2000));
	}
}

