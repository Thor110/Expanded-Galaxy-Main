void main() {
	object object1 = GetItemPossessedBy(GetFirstPC(), "G_W_DBLSBR006");
	GiveItem(object1, OBJECT_SELF);
	ActionEquipItem(object1, 4, 0);
}

