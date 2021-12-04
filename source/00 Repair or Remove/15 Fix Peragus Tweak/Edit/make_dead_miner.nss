//make_dead_miner

//Script by: VarsityPuppet

//Here's one long complex script with lots of conditionals to use for the entire Peragus level. I didn't want to do any utc or utp editing, so I left their tags alone. I was not about to cause a chain reaction of scripts I needed to edit.

//This has been placed for the heartbeat of every corpse in peragus (almost). The placeable has been turned invisible, and in it's place spawns a random miner.

//What the fuck is this? guess who? Thor110
void main(){

float fFacing = GetFacing(OBJECT_SELF);
vector vPlace = GetPosition(OBJECT_SELF);
location lSpawn = Location(vPlace, fFacing);
string sName = GetName(OBJECT_SELF);
//not in 105
if(GetTag(OBJECT_SELF) == "HighCorpse"){
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);
ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);
}
if(sName == "Corpse{Smuggler}"){ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}

if(sName == "Corpse{Peragus}"){ExecuteScript("k_plc_treas_per", OBJECT_SELF, -1);}
//else {object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);}
if(sName == "Administration Officer Corpse"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_admin", lSpawn);}
//
if(sName == "Dock Officer Corpse"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_dock", lSpawn);}
//
if(sName == "Medical Officer Corpse"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_med", lSpawn);}
//
if(sName == "Security Officer Corpse{Security Spike}"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_secoff", lSpawn);}
//not in 105
if(sName == "Coorta{Coorta Datapad}"){
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_coorta", lSpawn);
	ExecuteScript("k_plc_treas_norm", OBJECT_SELF, -1);}
//
if(sName == "Corpse{Coorta Thugs}"){
        if(GetIsObjectValid(GetObjectByTag("dead_coorthug2")) == FALSE){
             object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_coorthug2", lSpawn);
	 ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}
       else{object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_coorthug1", lSpawn);
             ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}}
//

if(sName == "Corpse{Sullustan}"){
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_sul", lSpawn);
	ExecuteScript("k_plc_treas_norm", OBJECT_SELF, -1);}
//
if(sName == "Corpse{Parts}"){
object oCover = CreateObject(OBJECT_TYPE_PLACEABLE, "Smoke", lSpawn);}

//
if(GetTag(OBJECT_SELF) == "Dorm1"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner01", lSpawn);}
if(GetTag(OBJECT_SELF) == "Dorm2"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner02", lSpawn);}
if(GetTag(OBJECT_SELF) == "Dorm3"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner03", lSpawn);}
if(GetTag(OBJECT_SELF) == "Dorm4"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner04", lSpawn);}
if(GetTag(OBJECT_SELF) == "Dorm5"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner50", lSpawn);}

//else {object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);}
//else {}
//this fires on 2 LowCorpse's(TAG) "Corpse{No Loot}" & "Corpse{Storage}" (NAMES)

//
//else if(GetTag(OBJECT_SELF) == "LowCorpse"){ // 2 low corpses exist
//object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);
//}



RemoveHeartbeat(OBJECT_SELF);
}