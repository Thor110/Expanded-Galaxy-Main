void main() {
	object oTar09_shielddrd = GetObjectByTag("tar09_shielddrd", 0);
	ApplyEffectAtLocation(0, EffectVisualEffect(3003, 0), GetLocation(OBJECT_SELF), 0.0);
	DestroyObject(GetObjectByTag("tar09_powerplc", 0), 0.0, 1, 0.0);
	SignalEvent(oTar09_shielddrd, EventUserDefined(2000));
}

