void main() {
  if(GetGlobalNumber("SLE_FIREBLOODS") == 1)
  {
      //location location2 = Location(Vector(-13.6, -19.3, 2.44), 180.0);
      //location location1 = Location(Vector(-12.1, -22.8, 2.44), 180.0);
      //location location3 = Location(Vector(-8.0, -18.8, 2.44), 180.0);
      //location location4 = Location(Vector(-12.8, -16.1, 2.44), 180.0);
      //location storage - shorter than storing vector as struct and then using it to make the location vector
      //AssignCommand(GetObjectByTag("rodian2"), ActionJumpToLocation(location2));
      //AssignCommand(GetObjectByTag("rodian1"), ActionJumpToLocation(location1));
      //AssignCommand(GetObjectByTag("rodian3"), ActionJumpToLocation(location3));
      //AssignCommand(GetObjectByTag("rodian4"), ActionJumpToLocation(location4));
      // The Above code does not work / forces them to the location repeatedly
    if (!GetIsObjectValid(GetObjectByTag("rodian2", 0))) {
      CreateObject(1, "rodian2", GetLocation(GetObjectByTag("wp_rodian2", 0)), 0);
      CreateObject(1, "rodian1", GetLocation(GetObjectByTag("wp_rodian1", 0)), 0);
      CreateObject(1, "rodian3", GetLocation(GetObjectByTag("wp_rodian3", 0)), 0);
      CreateObject(1, "rodian4", GetLocation(GetObjectByTag("wp_rodian4", 0)), 0);
    }
  }
}