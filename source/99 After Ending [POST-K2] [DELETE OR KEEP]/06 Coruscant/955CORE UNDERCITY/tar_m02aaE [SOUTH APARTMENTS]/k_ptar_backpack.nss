void main() {
	object oInvItem = GetFirstItemInInventory(OBJECT_SELF);
	if ((!GetIsObjectValid(oInvItem))) {
		SetPlotFlag(OBJECT_SELF, 0);
		DelayCommand(0.1, DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
	}
}

