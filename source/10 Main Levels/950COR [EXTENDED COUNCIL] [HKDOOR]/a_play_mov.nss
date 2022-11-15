// Prototypes
string sub6(int intParam1);
object sub5(int intParam1, string stringParam2);
string sub4(int intParam1);
object sub3(int intParam1, string stringParam2);
void sub2();
void sub1();

string sub6(int intParam1) {
	switch (intParam1) {
		case 0:
			return "remote";
			break;
	}
	return "ERROR";
}

object sub5(int intParam1, string stringParam2) {
	string string1;
	if ((stringParam2 == "WP_gspawn_")) {
		string string2 = sub6(intParam1);
		if ((string2 == "ERROR")) {
			return OBJECT_INVALID;
		}
		string1 = (stringParam2 + string2);
	}
	else {
		string1 = stringParam2;
	}
	object object1 = GetObjectByTag(string1, 0);
	object object3;
	if (GetIsObjectValid(object1)) {
		object3 = SpawnAvailablePUP(intParam1, GetLocation(object1));
		if (GetIsObjectValid(object3)) {
			return object3;
		}
	}
	return OBJECT_INVALID;
}

string sub4(int intParam1) {
	switch (intParam1) {
		case 0:
			return "atton";
			break;
		case 1:
			return "baodur";
			break;
		case 2:
			return "mand";
			break;
		case 11:
			return "disciple";
			break;
		case 3:
			return "g0t0";
			break;
		case 4:
			return "handmaiden";
			break;
		case 10:
			return "hanharr";
			break;
		case 5:
			return "hk47";
			break;
		case 6:
			return "kreia";
			break;
		case 7:
			return "mira";
			break;
		case 8:
			return "t3m4";
			break;
		case 9:
			return "visasmarr";
			break;
	}
	return "ERROR";
}

object sub3(int intParam1, string stringParam2) {
	string string1;
	if ((stringParam2 == "WP_gspawn_")) {
		string string2 = sub4(intParam1);
		if ((string2 == "ERROR")) {
			return OBJECT_INVALID;
		}
		string1 = (stringParam2 + string2);
	}
	else {
		string1 = stringParam2;
	}
	object object1 = GetObjectByTag(string1, 0);
	object object3;
	if (GetIsObjectValid(object1)) {
		object3 = SpawnAvailableNPC(intParam1, GetLocation(object1));
		if (GetIsObjectValid(object3)) {
			SetCreatureAILevel(object3, 3);
			return object3;
		}
	}
	return OBJECT_INVALID;
}

void sub2() {
	int int1 = 0;
	while ((int1 < 12)) {
		if ((GetNPCSelectability(int1) != (-1))) {
			if ((!GetIsObjectValid(sub3(int1, "WP_gspawn_")))) {
				AurPostString("NPC could not spawn, invalid NPC or invalid location!", 5, 15, 10.0);
			}
			else {
				if ((int1 == 1)) {
					sub5(0, "WP_gspawn_");
				}
			}
		}
		(int1++);
	}
}

void sub1() {
	SetPartyLeader(0xFFFFFFFF);
	int int2 = 0;
	while ((int2 < 12)) {
		if (IsNPCPartyMember(int2)) {
			RemoveNPCFromPartyToBase(int2);
		}
		(int2++);
	}
}

void main() {
	if (GetLoadFromSaveGame()) {
		return;
	}
  if(GetGlobalBoolean("HK_DOOR")==TRUE)
  {
    ActionOpenDoor(GetObjectByTag("CargoDoor2"));
  }
	object oEntering = GetEnteringObject();
	if ((oEntering == GetFirstPC())) {
		SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
		SetFadeUntilScript();
		SetNPCSelectability(1, 1);
		SetNPCSelectability(0, 1);
		SetNPCSelectability(6, 1);
		SetNPCSelectability(8, 1);
		sub1();
		sub2();
		if ((GetGender(oEntering) == 0)) {
			CreateObject(1, "p_handmaiden", GetLocation(GetObjectByTag("WP_gspawn_handmaiden", 0)), 0);
		}
		object oAtton = GetObjectByTag("Atton", 0);
		AssignCommand(oAtton, ClearAllActions());
		object oBaoDur = GetObjectByTag("BaoDur", 0);
		AssignCommand(oBaoDur, ClearAllActions());
		AssignCommand(oBaoDur, ActionPlayAnimation(102, 1.0, 1.0));
		AssignCommand(oEntering, ClearAllActions());
		AurPostString("ABOUT TO START HOLOREC", 5, 18, 10.0);
		DelayCommand(1.0, AssignCommand(oAtton, ActionStartConversation(oEntering, "holorec", 0, 0, 1, "", "", "", "", "", "", 0, 0xFFFFFFFF, 0xFFFFFFFF, 0)));
	}
}

