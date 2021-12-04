void main(){
  location locA=Location(Vector(75.52,56.52,64.52), 202.82);
  if(GetGlobalNumber("101PER_Revan_End")==1){
    // DARK SIDE
    CreateObject(OBJECT_TYPE_CREATURE,"kas22_rebczer_01",locA);
  }
  else{
    // LIGHT SIDE
    CreateObject(OBJECT_TYPE_CREATURE,"kas22_wookcap_01",locA);
  }
  //if(GetGlobalNumber("101PER_Revan_Sex")==1){
    // FEMALE
  //}
  //else{
    // MALE
  //}
}