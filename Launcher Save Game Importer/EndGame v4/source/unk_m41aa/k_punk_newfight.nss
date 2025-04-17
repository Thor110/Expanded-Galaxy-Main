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
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
//check if the player has finished the game.
if(GetGlobalNumber("K_KOTOR_MASTER")<=59)
{//

	int int1 = ((GetLocalBoolean(OBJECT_SELF, intGLOB_11) == 0) && (GetIsPC(GetEnteringObject()) == 1));
	sub1("first if", 5, 5, 3.0);
	if ((int1 == 1)) {
		sub1("second if", 5, 6, 3.0);
		if ((GetGlobalNumber("G_FinalChoice") == 0)) {
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
		}
		SetGlobalBoolean("UNK_TEMP11", 1);
		SetPartyLeader((-1));
		NoClicksFor(0.7);
		DelayCommand(0.5, AssignCommand(GetObjectByTag("invish", 0), ActionStartConversation(GetFirstPC(), "newfight", 0, 0, 1, "", "", "", "", "", "")));
		SetLocalBoolean(OBJECT_SELF, intGLOB_11, 1);
	}

}//
}

