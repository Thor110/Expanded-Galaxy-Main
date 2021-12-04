// d3_location - d3_getloc.nss
// ----------------
// Writes the location information to user's feedback screen
// -- Darth333 3/8/05
// -- tk102    4/23/05 (commented sections)
// --Darth333 08/1/05
// -- glovemaster 7/24/07 (now outputs XOrientation and YOrientation which is more useful for modding ~tk102)

void GetTagAndDistance(string sThing, object oThing) {
  object oPC=GetFirstPC();
  string sTag=GetTag(oThing);
  float  fDistance=GetDistanceBetween(oThing, oPC);
  string sDistance=FloatToString(fDistance,6,3);
  sDistance=GetStringLeft(sDistance,GetStringLength(sDistance)-1);  //trim the newline character
  string sMsg="Nearest "+ sThing + ":  Tag: " + sTag + "  Distance: "+ sDistance + "m";
  SendMessageToPC(oPC, sMsg);
}


void main() {


    object oPC=GetFirstPC();
    vector WhereAmI = GetPosition(oPC);
    float GetOrientation= GetFacing(oPC);
    float Bearing=GetOrientation * (PI/180.0);
    float Nbearing=GetOrientation * (PI/180.0)-(2*PI);
    
    int Orient=FloatToInt(GetOrientation);

    string currentMod = GetModuleName();
    string X_Coordinate = FloatToString(WhereAmI.x, 5, 5);
    string Y_Coordinate = FloatToString(WhereAmI.y, 5, 5);
    string Z_Coordinate = FloatToString(WhereAmI.z, 5, 5);

    // Vector information courtesy glovemaster...    
    //string Orientation=FloatToString(GetOrientation, 5, 5);
    vector Orientation=AngleToVector(GetOrientation);
    string XOrientation = FloatToString(Orientation.x, 5, 5);
    string YOrientation = FloatToString(Orientation.y, 5, 5);

    string Bring=FloatToString(Bearing, 5, 5);
    string Nbring=FloatToString(Nbearing, 5, 5);


    string Output = "Beginning whereami output:";
    string Module="Module: " + currentMod;

    // Vector information courtesy glovemaster...
    //string PlayerPosition ="> " +  X_Coordinate + "> " + Y_Coordinate + "> " + Z_Coordinate + "> " +"Orientation: " + Orientation + "> " +"Bearing: " + Bring;
    //string NplayerPosition ="> " +  X_Coordinate + "> " + Y_Coordinate + "> " + Z_Coordinate + "> " +"Orientation: " + Orientation + "> " +"Bearing: " + Nbring;
    string PlayerPosition ="> " +  X_Coordinate + "> " + Y_Coordinate + "> " + Z_Coordinate + "> " +"XOrientation: " + XOrientation + "> " +"YOrientation: " + YOrientation + "> " +"Bearing: " + Bring;
    string NplayerPosition ="> " +  X_Coordinate + "> " + Y_Coordinate + "> " + Z_Coordinate + "> " +"XOrientation: " + XOrientation + "> " +"YOrientation: " + YOrientation + "> " +"Bearing: " + Nbring;
    
    string End = "End of whereami output"; 

    if (Orient <180) {
        SendMessageToPC(oPC, Output);
        SendMessageToPC(oPC, Module);
        SendMessageToPC(oPC, PlayerPosition);
    }
    
    else{
        SendMessageToPC(oPC, Output);
        SendMessageToPC(oPC, Module);
        SendMessageToPC(oPC, NplayerPosition);
    }



// This portion would allow 
// writing of nearest objects to Feedback screen
// -- tk102


    GetTagAndDistance("Creature", GetNearestObject(OBJECT_TYPE_CREATURE,oPC));
    GetTagAndDistance("Door", GetNearestObject(OBJECT_TYPE_DOOR,oPC));
    GetTagAndDistance("Placeable", GetNearestObject(OBJECT_TYPE_PLACEABLE,oPC));
    GetTagAndDistance("Trigger", GetNearestObject(OBJECT_TYPE_TRIGGER,oPC));
    GetTagAndDistance("Waypoint", GetNearestObject(OBJECT_TYPE_WAYPOINT,oPC));

    SendMessageToPC(oPC, End);

    ActionStartConversation(GetFirstPC(),"d3_getloc");
}
