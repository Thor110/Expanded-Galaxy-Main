// open_stores
// this script opens a set of stores based on the string passed to it
// intended for merchants that have a different store dependant upon game progression

void store(string oStoreName)
{
  object oStore = GetObjectByTag(oStoreName);
  if(!GetIsObjectValid(oStore))
    oStore = CreateObject(OBJECT_TYPE_STORE, oStoreName, GetLocation(OBJECT_SELF));
  if(GetIsObjectValid(oStore))
    DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
}

void main()
{
  string sName = GetScriptStringParameter(); // pass the script the store name from a dialog file
  store(sName+IntToString(GetGlobalNumber("000_Jedi_Found"))); // call store function with the relevant string
}