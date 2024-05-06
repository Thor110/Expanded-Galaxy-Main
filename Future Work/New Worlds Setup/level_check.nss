//Thor110
//Basic script for level setup according to Revan's details.
void main(){
  //Script to check the player's KotOR1 playthrough.
  if(GetGlobalNumber("101PER_Revan_End"==0)){
    //Good
  } else {
    //Evil
  }
  if(GetGlobalNumber("101PER_Revan_Sex"==0)){
    //Male
  } else {
    //Female
  }
}