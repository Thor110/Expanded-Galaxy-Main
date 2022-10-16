void main() {
  if(GetGlobalNumber("SLE_SMUGGLE_QUEST") == 0) {
    //AddJournalQuestEntry("slesmuggling", 20, 1);
    //SetGlobalNumber("SLE_SMUGGLE_QUEST", 2);
    DestroyObject(OBJECT_SELF);
  }
  else
  {
    CreateObject("sloomie");
  }
}

