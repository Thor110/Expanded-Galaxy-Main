void main() {
	SetFacingPoint(GetPosition(GetNearestObjectByTag("wp_facing", OBJECT_SELF, 1)));
	SignalEvent(OBJECT_SELF, EventUserDefined(20));
}

