// Globals
	int intGLOB_1 = 0;
	int intGLOB_2 = 1;
	int intGLOB_3 = 2;
	int intGLOB_4 = 3;
	int intGLOB_5 = 4;
	int intGLOB_6 = 5;
	int intGLOB_7 = 6;
	int intGLOB_8 = 7;
	int intGLOB_9 = 8;
	int intGLOB_10 = 9;
	int intGLOB_11 = 10;
	int intGLOB_12 = 11;
	int intGLOB_13 = 12;
	int intGLOB_14 = 13;
	int intGLOB_15 = 14;
	int intGLOB_16 = 15;
	int intGLOB_17 = 16;
	int intGLOB_18 = 17;
	int intGLOB_19 = 18;
	int intGLOB_20 = 19;
	int intGLOB_21 = 1100;
	int intGLOB_22 = (-6);
	int intGLOB_23 = (-5);
	int intGLOB_24 = (-4);
	int intGLOB_25 = (-2);
	int intGLOB_26 = (-1);
	int intGLOB_27 = 0;

// Prototypes
object sub2(object objectParam1, string stringParam2);
void sub1(object objectParam1);

object sub2(object objectParam1, string stringParam2) {
	if ((GetIsObjectValid(objectParam1) && (stringParam2 != ""))) {
		location location1 = GetLocation(objectParam1);
		DestroyObject(objectParam1, 0.0, 1, 0.0);
		return CreateObject(1, stringParam2, location1, 0);
	}
	else {
		return OBJECT_INVALID;
	}
}

void sub1(object objectParam1) {
	sub2(objectParam1, "tar04_rakghoul");
}

void main() {
	SetGlobalFadeIn(1.0, 1.0, 0.0, 0.0, 0.0);
	sub1(GetObjectByTag("republicso", 0));
}

