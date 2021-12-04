void main() 
{
    if((GetGlobalNumber("000_Jedi_Found") == 0))
    {
        object oStore = GetObjectByTag("thor0");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "thor0", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 1))
    {
        object oStore = GetObjectByTag("thor1");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "thor1", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 2))
    {
        object oStore = GetObjectByTag("thor2");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "thor2", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker())); 
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 3))
    {
        object oStore = GetObjectByTag("thor3");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "thor3", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 4))
    {
        object oStore = GetObjectByTag("thor4");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "thor4", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
}