//Thor110
//Basic script for level setup according to Revan's details.
void main(){
  //location leadLocation = Location(Vector(13.9, 6.9, 3.7), 180.0);
  //Script to check the player's KotOR1 playthrough.
  if (!GetIsObjectValid(GetObjectByTag("kas23_freyyr_01", 0)) && !GetIsObjectValid(GetObjectByTag("kas23_chuunda_01", 0))) {
    if(GetGlobalNumber("101PER_Revan_End") == 0){
      //Good
      CreateObject(1, "kas23_freyyr_01", GetLocation(GetObjectByTag("kas23_freyyrspwn")), 0);
    } else {
      //Evil
      CreateObject(1, "kas23_chuunda_01", GetLocation(GetObjectByTag("kas23_freyyrspwn")), 0);
    }
    if(GetGlobalNumber("101PER_Revan_Sex") == 0){
      //Male
    } else {
      //Female
    }
  }
}