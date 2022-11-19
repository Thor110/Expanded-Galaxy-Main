// Prototypes
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oPC = GetFirstPC();
	object object3 = GetModuleItemAcquired();
	if (((GetTag(object3) == "tar10_accelerator") && GetIsObjectValid(GetItemPossessedBy(oPC, "tar10_accelerator")))) {
		sub1("Got It!", 7, 7, 5.0);
		AddJournalQuestEntry("tar_bastsearch", 47, 0);
	}
}

