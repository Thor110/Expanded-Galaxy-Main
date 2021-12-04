void main() {
	object oEntering = GetEnteringObject();
	if (FindSubString(GetTag(oEntering), "sith")) {
		SignalEvent(oEntering, EventUserDefined(2000));
	}
}

