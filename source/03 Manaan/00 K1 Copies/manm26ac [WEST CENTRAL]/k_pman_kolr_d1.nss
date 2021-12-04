// Prototypes
object sub2();
object sub1();

object sub2() {
	return GetObjectByTag("wp_repkol_end", 0);
}

object sub1() {
	return GetObjectByTag("wp_repkol_start", 0);
}

void main() {
	if ((GetUserDefinedEventNumber() == 100)) {
		ClearAllActions();
		ActionMoveToObject(sub1(), 0, 1.0);
		ActionPlayAnimation(10, 1.0, 10.0);
		ActionMoveToObject(sub2(), 0, 1.0);
		ActionPlayAnimation(10, 1.0, 10.0);
		ActionDoCommand(SignalEvent(GetObjectByTag("man26_repkol3", 0), EventUserDefined(100)));
		ActionMoveToObject(sub1(), 0, 1.0);
	}
}

