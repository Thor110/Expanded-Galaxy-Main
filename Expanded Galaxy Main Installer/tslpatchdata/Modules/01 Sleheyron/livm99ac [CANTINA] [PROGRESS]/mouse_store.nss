void main() 
{
    if((GetGlobalNumber("000_Jedi_Found") == 0))
    {
        object oStore = GetObjectByTag("mousestore01");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "mousestore01", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 1))
    {
        object oStore = GetObjectByTag("mousestore02");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "mousestore02", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 2))
    {
        object oStore = GetObjectByTag("mousestore03");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "mousestore03", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker())); 
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 3))
    {
        object oStore = GetObjectByTag("mousestore04");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "mousestore04", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 4))
    {
        object oStore = GetObjectByTag("mousestore05");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "mousestore05", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
}