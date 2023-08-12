void main() {
  if(GetGlobalBoolean("CORUSCANT_QUEST") == FALSE) {
    AddJournalQuestEntry("extendcouncil", 10, 1);
    SetGlobalBoolean("CORUSCANT_QUEST", TRUE);
    CreateItemOnObject("hawk_armband",GetFirstPC());
  }
}

