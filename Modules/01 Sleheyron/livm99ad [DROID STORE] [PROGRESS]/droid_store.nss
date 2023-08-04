void main() 
{
    if((GetGlobalNumber("000_Jedi_Found") == 0))
    {
        object oStore = GetObjectByTag("droidstore01");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "droidstore01", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 1))
    {
        object oStore = GetObjectByTag("droidstore02");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "droidstore02", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 2))
    {
        object oStore = GetObjectByTag("droidstore03");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "droidstore03", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker())); 
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 3))
    {
        object oStore = GetObjectByTag("droidstore04");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "droidstore04", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
    else if((GetGlobalNumber("000_Jedi_Found") == 4))
    {
        object oStore = GetObjectByTag("droidstore05");
        if (!GetIsObjectValid(oStore))
         oStore = CreateObject(OBJECT_TYPE_STORE, "droidstore05", GetLocation(OBJECT_SELF));
        if (GetIsObjectValid(oStore))
         DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
    }
}