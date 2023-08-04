void main() {
  //if(GetGlobalBoolean("SLE_SMUGGLE_QUEST") == FALSE) {
    AddJournalQuestEntry("slesmuggling", 10, 1);
    SetGlobalNumber("SLE_SMUGGLE_QUEST", 1);
  //}
}

