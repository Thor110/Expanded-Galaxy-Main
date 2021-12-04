void main() {
	if ((GetUserDefinedEventNumber() == 20)) {
		float float1 = (1.0 / IntToFloat(d10(1)));
		ClearAllActions();
		DelayCommand(float1, ActionMoveToObject(GetObjectByTag("man27_wp_selleave", 0), 0, 1.0));
	}
}

