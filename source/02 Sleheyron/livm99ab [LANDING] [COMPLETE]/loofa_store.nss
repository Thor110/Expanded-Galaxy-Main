void main() 
{
    if((GetGlobalNumber("000_Jedi_Found") == 0))
    {
        object oStore = GetObjectByTag("loofastore01");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "loofastore01", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 1))
    {
        object oStore = GetObjectByTag("loofastore02");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "loofastore02", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 2))
    {
        object oStore = GetObjectByTag("loofastore03");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "loofastore03", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker())); 
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 3))
    {
        object oStore = GetObjectByTag("loofastore04");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "loofastore04", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 4))
    {
        object oStore = GetObjectByTag("loofastore05");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "loofastore05", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
}