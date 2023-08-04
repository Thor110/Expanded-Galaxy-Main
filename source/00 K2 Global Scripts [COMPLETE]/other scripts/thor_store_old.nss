void main() 
{
object oStore = GetObjectByTag("thor");

if (!GetIsObjectValid(oStore))
 oStore = CreateObject(OBJECT_TYPE_STORE, "thor", GetLocation(OBJECT_SELF));

if (GetIsObjectValid(oStore))
 DelayCommand(0.5, OpenStore(oStore, GetPCSpeaker()));
}