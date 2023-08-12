// d3_opendoor.nss
// ----------------
// Unlocks and opens nearest door
// implemented with whereami armband
// --tk102 4/23/05  

void main() {
object oDoor=GetNearestObject(OBJECT_TYPE_DOOR,GetFirstPC());
SetLocked(oDoor,FALSE);
ActionOpenDoor(oDoor);
}