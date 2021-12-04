void main() {
	object oPC = GetFirstPC();
	object object3 = GetModuleItemAcquired();
	if (((GetTag(object3) == "ptar_shieldcodes") && GetIsObjectValid(GetItemPossessedBy(oPC, "ptar_shieldcodes")))) {
		AddJournalQuestEntry("tar_escape", 25, 0);
	}
}

