// Prototypes
string sub4(int intParam1);
object sub3(int intParam1, string stringParam2);
void sub2(int intParam1, int intParam2);
void sub1();

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

void sub2(int intParam1, int intParam2) {
	sub1();
	{
		object object1 = sub3(intParam1, "WP_gspawn_");
		object object3 = sub3(intParam2, "WP_gspawn_");
		if (GetIsObjectValid(object1)) {
			AddPartyMember(intParam1, object1);
		}
		if (GetIsObjectValid(object3)) {
			AddPartyMember(intParam2, object3);
		}
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
	object oEntering = GetEnteringObject();
	if ((oEntering == GetFirstPC())) {
		if ((!GetGlobalBoolean("201_FIRST_ENTER"))) {
			SetGlobalBoolean("201_FIRST_ENTER", 1);
			sub1();
			sub2(0, 6);
			sub3(8, "WP_gspawn_");
		}
		if ((GetGlobalNumber("200TEL_SmugglingM2") >= 1)) {
			if ((!GetLocalBoolean(OBJECT_SELF, 48))) {
				SetLocalBoolean(OBJECT_SELF, 48, 1);
				AssignCommand(GetObjectByTag("Storage", 0), ActionCloseDoor(GetObjectByTag("Storage", 0)));
				CreateObject(1, "c_ithorian004", GetLocation(GetObjectByTag("wp_ithstorage_sp", 0)), 0);
				CreateItemOnObject("ith_shield", GetObjectByTag("ith_locker", 0), 1, 0);
			}
		}
	}
}

