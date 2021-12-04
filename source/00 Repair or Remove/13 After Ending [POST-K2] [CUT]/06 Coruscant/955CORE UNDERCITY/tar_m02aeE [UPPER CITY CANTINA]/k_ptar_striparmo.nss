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
int sub4(object objectParam1);
object sub3();
void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4);
void sub1();

int sub4(object objectParam1) {
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

object sub3() {
	object oBodyItem = OBJECT_INVALID;
	object oInvItem;
	object oNPC;
	int int1;
	sub2(("STRIPPING ARMOR = " + GetTag(oNPC)), 5, 7, 5.0);
	int1 = 0;
	while ((int1 < GetPartyMemberCount())) {
		oNPC = GetPartyMemberByIndex(int1);
		if (sub4(oNPC)) {
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

void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void sub1() {
	object object1;
	sub2("STRIP", 5, 5, 5.0);
	object1 = sub3();
	if (GetIsObjectValid(object1)) {
		SetItemNonEquippable(object1, 1);
	}
}

void main() {
	object oEntering = GetEnteringObject();
	object object3;
	if (GetIsPC(oEntering)) {
		DelayCommand(1.0, sub1());
	}
}

