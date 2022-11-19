//make_dead_miner

//Script by: VarsityPuppet

//Here's one long complex script with lots of conditionals to use for the entire Peragus level. I didn't want to do any utc or utp editing, so I left their tags alone. I was not about to cause a chain reaction of scripts I needed to edit.

//This has been placed for the heartbeat of every corpse in peragus (almost). The placeable has been turned invisible, and in it's place spawns a random miner.

//What the fuck is this? guess who? Thor110
void main(){

RemoveHeartbeat(OBJECT_SELF);
float fFacing = GetFacing(OBJECT_SELF);
vector vPlace = GetPosition(OBJECT_SELF);
location lSpawn = Location(vPlace, fFacing);
string sName = GetName(OBJECT_SELF);

if(sName == "Corpse{No Loot}"){// works if "Corpse{Storage}" isn't spawned???
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);
}

//else if here means it doesn't spawn..
if(sName == "Corpse{Storage}"){//if storage doesn't spawn, no loot above breaks and doesn't spawn properly...?.!
object oCover = CreateObject(OBJECT_TYPE_CREATURE, "dead_miner", lSpawn);
ExecuteScript("k_plc_tresciv", OBJECT_SELF, -1);
}//}

}