void main(){
	if(GetGlobalBoolean("003_swoop") && !GetIsObjectValid(GetObjectByTag("SwpBikePC"))){
		CreateObject(OBJECT_TYPE_PLACEABLE, "plc_swpbikepc", Location(Vector(65.052436829, 28.897613525, 1.8), 59.281162262));
	}
  RevealMap([0.0,0.0,0.0],-1);
  if(GetGlobalNumber("003EBO_BACKGROUND")==11){
    PlayRoomAnimation("003EBOq", 5);
  }
  if(GetGlobalNumber("EBO_MYSTERY_BOX")==5 && !GetIsObjectValid(GetObjectByTag("EBO_MysteryBox"))) {
    CreateObject(OBJECT_TYPE_PLACEABLE, "g_pebn_mystery", Location(Vector(31.01, 33.01, 1.8), 0.25));
  }
  if(GetGlobalNumber("EBO_MYSTERY_BOX")==0){
    DestroyObject(GetObjectByTag("EBO_MysteryBox"));
  }
  if(GetGlobalBoolean("EH_REPAIR") == 1){
		DestroyObject(GetObjectByTag("baoplace"));
		DestroyObject(GetObjectByTag("baoplace2"));
	}
  if(GetGlobalBoolean("HK_DOOR") == 1){
		DestroyObject(GetObjectByTag("CargoDoor",1));
	}
}