// Prototypes
void sub2(object objectParam1, int intParam2);

int sub1(object objectParam1);

void sub2(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, 10, intParam2);//intGLOB_11
		}
	}
}

int sub1(object objectParam1) {
	int nLocalBool;
	if (GetIsObjectValid(objectParam1)) {
		nLocalBool = GetLocalBoolean(objectParam1, 10);//intGLOB_11
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void main() {
	object oEntering = GetEnteringObject();
	object oTar03_gangtalker = GetObjectByTag("tar03_gangtalker", 0);
	if ((GetIsPC(oEntering) && (!sub1(OBJECT_SELF)))) {
		sub2(OBJECT_SELF, 1);
		AssignCommand(oTar03_gangtalker, ActionStartConversation(oTar03_gangtalker, "", 0, 0, 0, "", "", "", "", "", ""));
	}
}

