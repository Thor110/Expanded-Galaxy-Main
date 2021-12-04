// Globals
	int intGLOB_1 = 0;
	int intGLOB_2 = 1;
	int intGLOB_3 = 2;
	int intGLOB_4 = 3;

// Prototypes
void sub5();
void sub4();
void sub3();
void sub2();
void sub1(int intParam1);

void sub5() {
	int nRandom = Random(100);
	object oNearest = GetNearestCreature(3, 0, OBJECT_SELF, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	if ((nRandom < 40)) {
		SetFacingPoint(GetPosition(oNearest));
		ActionPlayAnimation(108, 1.0, 0.0);
	}
	else {
		ActionWait(3.0);
	}
}

void sub4() {
	vector struct4;
	vector vPosition = GetPosition(OBJECT_SELF);
	object oNearestRefuse = GetNearestObjectByTag("refuse", OBJECT_SELF, 1);
	int nRandom = Random(100);
	float float7 = (Random(6) + 7.0);
	object oNearestTar04_alphaghoul = GetNearestObjectByTag("tar04_alphaghoul", OBJECT_SELF, 1);
	float fDistance = GetDistanceBetween(OBJECT_SELF, oNearestTar04_alphaghoul);
	if (((GetIsObjectValid(oNearestTar04_alphaghoul) && (fDistance > 10.0)) && (fDistance < 30.0))) {
		ActionMoveToObject(oNearestTar04_alphaghoul, 0, 1.0);
	}
	else {
		if ((nRandom < 50)) {
			struct4 = Vector(((Random(201) - 100) * 0.01), ((Random(201) - 100) * 0.01), 0.0);
			struct4 = VectorNormalize(struct4);
			struct4 = Vector(((struct4.x * float7) + vPosition.x), ((struct4.y * float7) + vPosition.y), 0.0);
			ActionRandomWalk();
		}
		else {
			if ((nRandom < 65)) {
				ActionPlayAnimation(108, 1.0, 0.0);
			}
			else {
				if ((nRandom < 80)) {
					ActionPlayAnimation(107, 1.0, 0.0);
				}
				else {
					ActionWait(3.0);
				}
			}
		}
	}
}

void sub3() {
	int nRandom = Random(100);
	object oNearest = GetNearestCreature(3, 0, OBJECT_SELF, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	if ((nRandom < 30)) {
		SetFacingPoint(GetPosition(oNearest));
		ActionPlayAnimation(108, 1.0, 0.0);
	}
	if ((nRandom < 45)) {
		SetFacingPoint(GetPosition(oNearest));
		ActionPlayAnimation(5, 1.0, 3.0);
	}
	else {
		ActionWait(3.0);
	}
}

void sub2() {
	vector struct4;
	vector vPosition = GetPosition(OBJECT_SELF);
	object oNearestRefuse = GetNearestObjectByTag("refuse", OBJECT_SELF, 1);
	int nRandom = Random(100);
	float float7 = (Random(6) + 7.0);
	object oNearestTar04_gamraidleader = GetNearestObjectByTag("tar04_gamraidleader", OBJECT_SELF, 1);
	float fDistance = GetDistanceBetween(OBJECT_SELF, oNearestTar04_gamraidleader);
	if (((GetIsObjectValid(oNearestTar04_gamraidleader) && (fDistance > 10.0)) && (fDistance < 30.0))) {
		ActionMoveToObject(oNearestTar04_gamraidleader, 0, 1.0);
	}
	else {
		if ((nRandom < 60)) {
			struct4 = Vector(((Random(201) - 100) * 0.01), ((Random(201) - 100) * 0.01), 0.0);
			struct4 = VectorNormalize(struct4);
			struct4 = Vector(((struct4.x * float7) + vPosition.x), ((struct4.y * float7) + vPosition.y), 0.0);
			ActionRandomWalk();
		}
		else {
			if ((nRandom < 80)) {
				ActionMoveToObject(oNearestRefuse, 0, 1.0);
				ActionPlayAnimation(107, 1.0, 0.0);
			}
			else {
				ActionWait(3.0);
			}
		}
	}
}

void sub1(int intParam1) {
	switch (intParam1) {
		case 0:
			sub2();
			break;
		case 1:
			sub3();
			break;
		case 2:
			sub4();
			break;
		case 3:
			sub5();
			break;
	}
	ActionDoCommand(sub1(intParam1));
}

void main() {
	sub1(intGLOB_1);
}

