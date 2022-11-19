//make_dead_miner

//Script by: VarsityPuppet

//Here's one long complex script with lots of conditionals to use for the entire Peragus level. I didn't want to do any utc or utp editing, so I left their tags alone. I was not about to cause a chain reaction of scripts I needed to edit.

//This has been placed for the heartbeat of every corpse in peragus (almost). The placeable has been turned invisible, and in it's place spawns a random miner.

void main(){

float fFacing = GetFacing(OBJECT_SELF);
vector vPlace = GetPosition(OBJECT_SELF);
location lSpawn = Location(vPlace, fFacing);
string sName = GetName(OBJECT_SELF);

if(sName == "Administration Officer Corpse"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_admin", lSpawn);}

else if(sName == "Dock Officer Corpse"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_dock", lSpawn);}

else if(sName == "Medical Officer Corpse"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_med", lSpawn);}

else if(sName == "Security Officer Corpse{Security Spike}"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_secoff", lSpawn);}

else if(sName == "Coorta{Coorta Datapad}"){
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_coorta", lSpawn);
	ExecuteScript("k_plc_treas_norm", OBJECT_SELF, -1);}

else if(sName == "Corpse{Coorta Thugs}"){
        if(GetIsObjectValid(GetObjectByTag("dead_coorthug2")) == FALSE){
             object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_coorthug2", lSpawn);
	 ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}
       else{object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_coorthug1", lSpawn);
             ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}}


else if(sName == "Corpse{Sullustan}"){
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_sul", lSpawn);
	ExecuteScript("k_plc_treas_norm", OBJECT_SELF, -1);}

else if(GetTag(OBJECT_SELF) == "HighCorpse"){
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);
ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}

else if(sName == "Corpse{Parts}"){
object oCover = CreateObject(OBJECT_TYPE_PLACEABLE, "Smoke", lSpawn);}

else if(GetTag(OBJECT_SELF) == "Dorm1"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner01", lSpawn);}
else if(GetTag(OBJECT_SELF) == "Dorm2"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner02", lSpawn);}
else if(GetTag(OBJECT_SELF) == "Dorm3"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner03", lSpawn);}
else if(GetTag(OBJECT_SELF) == "Dorm4"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner04", lSpawn);}
else if(GetTag(OBJECT_SELF) == "Dorm5"){object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dorm_miner50", lSpawn);}

else {object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);}


if(sName == "Corpse{Storage}"){ExecuteScript("k_plc_tresciv", OBJECT_SELF, -1);}

if(sName == "Corpse{Smuggler}"){ExecuteScript("k_plc_treas_disp", OBJECT_SELF, -1);}

if(sName == "Corpse{Peragus}"){ExecuteScript("k_plc_treas_per", OBJECT_SELF, -1);} 



RemoveHeartbeat(OBJECT_SELF);
}