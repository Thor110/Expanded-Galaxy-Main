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

// Prototypes
void sub4(string stringParam1, int intParam2, int intParam3, float floatParam4);
int sub3(object objectParam1, int intParam2);
void sub2();
void sub1(object objectParam1, int intParam2, int intParam3);

void sub4(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	AurPostString(stringParam1, intParam2, intParam3, floatParam4);
}

int sub3(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 9)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
	}
	return nLocalBool;
}

void sub2() {
	object object1 = OBJECT_INVALID;
	string string1 = "";
	if (sub3(OBJECT_SELF, intGLOB_1)) {
		string1 = "ptar_testwp1";
	}
	else {
		if (sub3(OBJECT_SELF, intGLOB_2)) {
			string1 = "ptar_testwp2";
		}
		else {
			if (sub3(OBJECT_SELF, intGLOB_3)) {
				string1 = "ptar_testwp3";
			}
			else {
				if (sub3(OBJECT_SELF, intGLOB_4)) {
					string1 = "ptar_testwp4";
				}
				else {
					if (sub3(OBJECT_SELF, intGLOB_5)) {
						string1 = "ptar_testwp5";
					}
					else {
						string1 = "ptar_testwp6";
					}
				}
			}
		}
	}
	if (sub3(OBJECT_SELF, intGLOB_6)) {
		string1 = (string1 + "_1");
		sub1(OBJECT_SELF, intGLOB_6, 0);
	}
	else {
		string1 = (string1 + "_0");
		sub1(OBJECT_SELF, intGLOB_6, 1);
	}
	object1 = GetObjectByTag(string1, 0);
	sub4(("MOVING TO " + GetTag(object1)), 5, 5, 2.0);
	ActionForceMoveToObject(object1, 0, 1.0, 30.0);
	ActionDoCommand(sub2());
}

void sub1(object objectParam1, int intParam2, int intParam3) {
	if ((((intParam2 >= 0) && (intParam2 <= 9)) && GetIsObjectValid(objectParam1))) {
		if (((intParam3 == 1) || (intParam3 == 0))) {
			SetLocalBoolean(objectParam1, intParam2, intParam3);
		}
	}
}

void main() {
	sub1(OBJECT_SELF, intGLOB_3, 1);
	sub2();
}

