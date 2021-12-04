void main() {
	ClearAllActions();
	SetFacingPoint(GetPosition(GetObjectByTag("wp_return", 0)));
	int nRandom = Random(3);
	if ((nRandom == 0)) {
		ActionPlayAnimation(108, 1.0, 0.0);
	}
	else {
		if ((nRandom == 1)) {
			ActionPlayAnimation(109, 1.0, 0.0);
		}
		else {
			ActionPlayAnimation(110, 1.0, 0.0);
		}
	}
}

