//Thor110
//Basic script for level setup according to Revan's details.
void main(){
  //location leadLocation = Location(Vector(13.9, 6.9, 3.7), 180.0);
  //Script to check the player's KotOR1 playthrough.
  if (!GetIsObjectValid(GetObjectByTag("kas23_freyyr_01", 0)) && !GetIsObjectValid(GetObjectByTag("kas23_chuunda_01", 0))) {
    if(GetGlobalNumber("101PER_Revan_End") == 0){
      //Good
      CreateObject(1, "kas23_freyyr_01", GetLocation(GetObjectByTag("kas23_freyyrspwn")), 0);
      SetOrientOnClick(GetObjectByTag("kas23_freyyr_01"),FALSE);
    } else {
      //Evil
      CreateObject(1, "kas23_chuunda_01", GetLocation(GetObjectByTag("kas23_freyyrspwn")), 0);
      SetOrientOnClick(GetObjectByTag("kas23_chuunda_01"),FALSE);
    }
    if(GetGlobalNumber("101PER_Revan_Sex") == 0){
      //Male
    } else {
      //Female
    }
    SetOrientOnClick(GetObjectByTag("kas23_gorwook_01"),FALSE);
    SetOrientOnClick(GetObjectByTag("Zaalbar"),FALSE);
    SetOrientOnClick(GetObjectByTag("kas23_wookgua001"),FALSE);
    SetOrientOnClick(GetObjectByTag("kas23_wookgua002"),FALSE);
    SetOrientOnClick(GetObjectByTag("kas23_wookguard2"),FALSE);
    SetOrientOnClick(GetObjectByTag("kas23_czerkaloy"),FALSE);
    SetOrientOnClick(GetObjectByTag("kas23_czerkal003"),FALSE);
  }
}