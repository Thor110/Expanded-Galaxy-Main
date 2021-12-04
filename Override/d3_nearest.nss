// d3_nearest.nss
// ----------------
// Sets tokens CUSTOM61 and CUSTOM62 with the nearest
// object's Tag and distance.
// Object type is dictated by script parameter
// for use with whereami armband
// --tk102 4/23/05


void GetTagAndDistance(string sThing, object oThing) {
  object oPC=GetFirstPC();
  string sTag=GetTag(oThing);
  float  fDistance=GetDistanceBetween(oThing, oPC);
  string sDistance=FloatToString(fDistance,6,3);
  sDistance=GetStringLeft(sDistance,GetStringLength(sDistance)-1);
  SetCustomToken(61,sTag);
  SetCustomToken(62,sDistance);
}

void main() {
  int nSwitch=GetScriptParameter(1);
  object oPC=GetFirstPC();
  switch (nSwitch) {
    case 1:
      GetTagAndDistance("Creature", GetNearestObject(OBJECT_TYPE_CREATURE,oPC));
      break;
    case 2:
      GetTagAndDistance("Placeable", GetNearestObject(OBJECT_TYPE_PLACEABLE,oPC));
      break;
    case 3:
      GetTagAndDistance("Trigger", GetNearestObject(OBJECT_TYPE_TRIGGER,oPC));
      break;
    case 4:
      GetTagAndDistance("Waypoint", GetNearestObject(OBJECT_TYPE_WAYPOINT,oPC));
      break;
    case 5:
      GetTagAndDistance("Door", GetNearestObject(OBJECT_TYPE_DOOR,oPC));
      break;
  }

}
