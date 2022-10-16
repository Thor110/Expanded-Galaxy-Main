void main() {
  //if(GetGlobalBoolean("SLE_SMUGGLE_QUEST") == FALSE) {
    RemoveJournalQuestEntry("slesmuggling");
    //GivePlotXP("sle_smuggling",500);
    SetGlobalNumber("SLE_SMUGGLE_QUEST", 2);
  //}
}

