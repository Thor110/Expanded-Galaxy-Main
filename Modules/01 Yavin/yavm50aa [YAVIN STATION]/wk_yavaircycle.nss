// Prototypes
void sub1(object objectParam1, object objectParam2);

void sub1(object objectParam1, object objectParam2) {
	object oPC = GetFirstPC();
	if (GetIsOpen(objectParam2)) {
		AssignCommand(objectParam2, ActionCloseDoor(objectParam2));
		DelayCommand(1.5, AssignCommand(objectParam1, ActionOpenDoor(objectParam1)));
	}
	else {
		AssignCommand(objectParam1, ActionOpenDoor(objectParam1));
	}
	SetCommandable(0, oPC);
	DelayCommand(2.5, SetCommandable(1, oPC));
}

void main() {
	object oWk_yavhgr_door30 = GetObjectByTag("wk_yavhgr_door30", 0);
	object oWk_yavhgr_door01 = GetObjectByTag("wk_yavhgr_door01", 0);
	int int1 = GetIsOpen(oWk_yavhgr_door30);
	int int3 = GetIsOpen(oWk_yavhgr_door01);
	if ((!int3)) {
		sub1(oWk_yavhgr_door01, oWk_yavhgr_door30);
	}
	else {
		sub1(oWk_yavhgr_door30, oWk_yavhgr_door01);
	}
}

