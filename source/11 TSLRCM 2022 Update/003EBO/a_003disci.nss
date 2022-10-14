void main() {
	int nParam1 = GetScriptParameter(1);
	object oAtton = GetObjectByTag("Atton", 0);
	object oDisciple = GetObjectByTag("Disciple", 0);
	switch (nParam1) {
		case 1:
			AssignCommand(oAtton, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0));
			SetLockOrientationInDialog(oAtton, 1);
			break;
		case 2:
			AssignCommand(oAtton, ClearAllActions());
			SetLockOrientationInDialog(oAtton, 0);
			break;
		case 3:
			AssignCommand(oAtton, ActionForceMoveToObject(GetObjectByTag("wp_kreia_1", 0), 0, 5.0, 10.0));
			DelayCommand(1.0, AssignCommand (oDisciple, SetFacingPoint (GetPosition(oAtton))));
			DelayCommand(2.0, AssignCommand (oDisciple, SetFacingPoint (GetPosition(oAtton))));
			DelayCommand(3.0, AssignCommand (oDisciple, SetFacingPoint (GetPosition(oAtton))));
			DelayCommand(4.0, AssignCommand (oDisciple, SetFacingPoint (GetPosition(oAtton))));
			break;
		case 4:
			AssignCommand(oAtton, ActionForceMoveToObject(GetObjectByTag("wp_kreia_cut_1", 0), 0, 5.0, 10.0));
			break;
		case 5:
			DelayCommand(0.5, AssignCommand(oAtton, ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0)));
			break;
		case 20:
			AssignCommand(oDisciple, ActionPlayAnimation(3, 1.0, (-1.0)));
			break;
		case 21:
			AssignCommand(oDisciple, ActionWait(0.2));
			AssignCommand(oDisciple, ActionDoCommand(SetFacingPoint(GetPosition(oAtton))));
			AssignCommand(oDisciple, ActionPlayAnimation(2, 1.0, (-1.0)));
			break;
		case 22:
			AssignCommand(oAtton, ActionMoveToObject(GetObjectByTag("WP_disc_cut_4", 0), 0, 1.0));
			break;
	}
}