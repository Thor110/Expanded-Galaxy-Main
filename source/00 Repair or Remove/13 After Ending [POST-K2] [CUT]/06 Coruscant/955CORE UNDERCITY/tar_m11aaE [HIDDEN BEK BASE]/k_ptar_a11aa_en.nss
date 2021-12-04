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
int sub7(object objectParam1, int intParam2);
void sub6(object objectParam1);
void sub5(object objectParam1, int intParam2, int intParam3);
void sub4(object objectParam1);
int sub3(object objectParam1);
void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4);
object sub1();

int sub7(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

void sub6(object objectParam1) {
	object oAreaObject = GetFirstObjectInArea(objectParam1, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if (sub7(oAreaObject, intGLOB_10)) {
			DestroyObject(oAreaObject, 0.0, 1, 0.0);
		}
		oAreaObject = GetNextObjectInArea(objectParam1, 1);
	}
}

void sub5(object objectParam1, int intParam2, int intParam3) {
	int nLevel = GetHitDice(GetFirstPC());
	if ((intParam3 == 1)) {
		if (((((intParam2 == intGLOB_12) || (intParam2 == intGLOB_17)) || (intParam2 == intGLOB_18)) || (intParam2 == intGLOB_19))) {
			GiveXPToCreature(GetFirstPC(), (nLevel * 15));
		}
		else {
			if ((((intParam2 == intGLOB_13) || (intParam2 == intGLOB_20)) || (intParam2 == intGLOB_16))) {
				GiveXPToCreature(GetFirstPC(), (nLevel * 20));
			}
			else {
				if (((intParam2 == intGLOB_14) || (intParam2 == intGLOB_15))) {
					GiveXPToCreature(GetFirstPC(), (nLevel * 10));
				}
			}
		}
	}
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		if (((intParam3 == 1) || (intParam3 == 0))) {
			SetLocalBoolean(objectParam1, intParam2, intParam3);
		}
	}
}

void sub4(object objectParam1) {
	sub5(objectParam1, intGLOB_10, 1);
}

int sub3(object objectParam1) {
	int int1;
	object oNPC;
	object oBodyItem = GetItemInSlot(1, objectParam1);
	if ((!GetIsObjectValid(objectParam1))) {
		int1 = 0;
		while ((int1 < GetPartyMemberCount())) {
			oNPC = GetPartyMemberByIndex(int1);
			oBodyItem = GetItemInSlot(1, oNPC);
			if ((GetTag(oBodyItem) == "ptar_sitharmor")) {
				return 1;
			}
			(int1++);
		}
		return 0;
	}
	return (GetTag(oBodyItem) == "ptar_sitharmor");
}

void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

object sub1() {
	object oBodyItem = OBJECT_INVALID;
	object oInvItem;
	object oNPC;
	int int1;
	sub2(("STRIPPING ARMOR = " + GetTag(oNPC)), 5, 7, 5.0);
	int1 = 0;
	while ((int1 < GetPartyMemberCount())) {
		oNPC = GetPartyMemberByIndex(int1);
		if (sub3(oNPC)) {
			sub2("ARMOR STRIPPED", 5, 8, 5.0);
			oBodyItem = GetItemInSlot(1, oNPC);
			SetCommandable(1, oNPC);
			AssignCommand(oNPC, ActionUnequipItem(oBodyItem, 0));
			oInvItem = GetFirstItemInInventory(oNPC);
			while (GetIsObjectValid(oInvItem)) {
				if ((GetBaseItemType(oInvItem) == 85)) {
					sub2("PUT ON NEW ITEM", 5, 9, 5.0);
					AssignCommand(oNPC, ActionEquipItem(oInvItem, 1, 1));
					break;
				}
				oInvItem = GetNextItemInInventory(oNPC);
			}
		}
		else {
			if (GetIsObjectValid(oInvItem = GetItemPossessedBy(oNPC, "ptar_sitharmor"))) {
				oBodyItem = oInvItem;
				sub2("ARMOR FOUND", 5, 9, 5.0);
			}
		}
		(int1++);
	}
	return oBodyItem;
}

void main() {
	SetGlobalBoolean("TAR_DUELINPROGRESS", 1);
	sub1();
	if ((GetGlobalBoolean("Tar_KandonMission") && (!GetGlobalBoolean("TAR_BEKGUARDSPAWNED")))) {
		object object2;
		SetGlobalBoolean("TAR_BEKGUARDSPAWNED", 1);
		CreateObject(1, "tar11_hidbek118", GetLocation(GetObjectByTag("tar11_wpcontrol", 0)), 0);
		CreateObject(1, "tar11_hidbek112", GetLocation(GetObjectByTag("tar11_wpdoor1", 0)), 0);
		CreateObject(1, "tar11_hidbek117", GetLocation(GetObjectByTag("tar11_wpdoor2", 0)), 0);
		CreateObject(1, "tar11_hidbek112", GetLocation(GetObjectByTag("tar11_wpdoor3", 0)), 0);
		sub4(GetObjectByTag("gadonthek112", 0));
	}
	sub6(OBJECT_SELF);
	if (GetGlobalBoolean("Tar_GadonDead")) {
		object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
		while (GetIsObjectValid(oAreaObject)) {
			if ((!IsObjectPartyMember(oAreaObject))) {
				ChangeToStandardFaction(oAreaObject, 1);
			}
			oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
		}
	}
}

