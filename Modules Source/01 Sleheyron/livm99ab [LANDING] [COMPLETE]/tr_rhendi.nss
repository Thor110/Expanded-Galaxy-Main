void main() {
  //if(GetGlobalBoolean("SLE_JEDI_QUEST") == FALSE) {
    AddJournalQuestEntry("slejedi", 10, 1);
    SetGlobalBoolean("SLE_JEDI_QUEST", TRUE);
    //Set Docking Fee
    //ActionStartConversation();
  //}
  //else
  //{
    //"SLE_DOCKING_FEE"
    //ActionStartConversation();
  //}
}

