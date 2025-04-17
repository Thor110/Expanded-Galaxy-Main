// Globals
	int intGLOB_10 = 9;
// Prototypes
void sub3(string stringParam1, int intParam2, int intParam3, float floatParam4);
int sub2(object objectParam1, int intParam2);
void sub1(object objectParam1);

void sub3(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

int sub2(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void sub1(object objectParam1) {
	object oAreaObject = GetFirstObjectInArea(objectParam1, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if ((sub2(oAreaObject, intGLOB_10) && (IsObjectPartyMember(oAreaObject) == 0))) {
			DestroyObject(oAreaObject, 0.0, 1, 0.0);
		}
		oAreaObject = GetNextObjectInArea(objectParam1, 1);
	}
}

void main() {
//check if the player has finished the game.
if(GetGlobalNumber("K_KOTOR_MASTER")<=59)
{//

	if (((GetIsPC(GetEnteringObject()) == 1) && (GetLoadFromSaveGame() == 0))) {
		sub1(OBJECT_SELF);


		if ((GetGlobalNumber("G_FinalChoice") > 0)) {
			SetAreaUnescapable(1);
		}
		sub3(("UNK_PARTYSHOWDOWN = " + IntToString(GetGlobalNumber("UNK_PARTYSHOWDOWN"))), 5, 5, 5.0);
		if (((GetGlobalNumber("G_FinalChoice") > 0) && (GetGlobalNumber("UNK_PARTYSHOWDOWN") == 0))) {
			SetAreaUnescapable(1);
			SetGlobalNumber("UNK_PARTYSHOWDOWN", 1);
			SpawnAvailableNPC(2, GetLocation(GetObjectByTag("carthstart", 0)));
			SpawnAvailableNPC(1, GetLocation(GetObjectByTag("candstart", 0)));
			SpawnAvailableNPC(6, GetLocation(GetObjectByTag("missionstart", 0)));
			SpawnAvailableNPC(7, GetLocation(GetObjectByTag("t3m4start", 0)));
			if ((IsAvailableCreature(3) == 1)) {
				SpawnAvailableNPC(3, GetLocation(GetObjectByTag("hk47start", 0)));
			}
			if (((IsAvailableCreature(8) == 1) && (GetGlobalBoolean("tat_ZaalbarTaken") == 0))) {
				SpawnAvailableNPC(8, GetLocation(GetObjectByTag("zaalbarstart", 0)));
			}
		}
		if (((GetGlobalBoolean("UNK_TEMP4") == 1) && (GetIsObjectValid(GetObjectByTag("unk41_blk6", 0)) == 0))) {
			if ((GetGlobalBoolean("UNK_BLACKHOSTILE") == 1)) {
				CreateObject(1, "unk41_blk6", GetLocation(GetObjectByTag("b1", 0)), 0);
				CreateObject(1, "unk41_blk6", GetLocation(GetObjectByTag("b1", 0)), 0);
				CreateObject(1, "unk41_blk6", GetLocation(GetObjectByTag("b2", 0)), 0);
				CreateObject(1, "unk41_blk6", GetLocation(GetObjectByTag("b2", 0)), 0);
			}
			else {
				if ((GetGlobalBoolean("UNK_TEMP12") == 0)) {
					SetGlobalBoolean("UNK_TEMP12", 1);
				}
			}
			SetGlobalBoolean("UNK_TEMP4", 0);
		}
	}

}//
else{
		object oUnk41_blk1 = GetObjectByTag("unk41_blk1", 0);
		object oUnk41_blk2 = GetObjectByTag("unk41_blk2", 0);
		object oUnk41_blk3 = GetObjectByTag("unk41_blk3", 0);
		object oUnk41_blk4 = GetObjectByTag("unk41_blk4", 0);
		object oUnk41_blk5 = GetObjectByTag("unk41_blk5", 0);

if (((((GetIsObjectValid(oUnk41_blk1) || GetIsObjectValid(oUnk41_blk2)) || GetIsObjectValid(oUnk41_blk3)) || GetIsObjectValid(oUnk41_blk4)) || GetIsObjectValid(oUnk41_blk5))) {
			if (GetIsObjectValid(oUnk41_blk1)) {
				DestroyObject(oUnk41_blk1, 0.0, 0, 0.0);
			}
			if (GetIsObjectValid(oUnk41_blk2)) {
				DestroyObject(oUnk41_blk2, 0.0, 0, 0.0);
			}
			if (GetIsObjectValid(oUnk41_blk3)) {
				DestroyObject(oUnk41_blk3, 0.0, 0, 0.0);
			}
			if (GetIsObjectValid(oUnk41_blk4)) {
				DestroyObject(oUnk41_blk4, 0.0, 0, 0.0);
			}
			if (GetIsObjectValid(oUnk41_blk5)) {
				DestroyObject(oUnk41_blk5, 0.0, 0, 0.0);
			}
		}

}
}

