void main() {
	object object1 = GetItemPossessedBy(GetFirstPC(), "tar10_accelerator");
	if (GetIsObjectValid(object1)) {
		DestroyObject(object1, 0.0, 0, 0.0);
	}
}

