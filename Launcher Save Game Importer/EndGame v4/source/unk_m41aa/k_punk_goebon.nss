void main() {
	object oEntering = GetEnteringObject();
	if (GetIsPC(oEntering)) {
		object oNearest = GetNearestCreature(3, 1, GetFirstPC(), 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
		if (((!GetIsObjectValid(oNearest)) || (GetDistanceBetween(GetFirstPC(), oNearest) > 30.0))) {

//check if the player has finished the game.
if(GetGlobalNumber("K_KOTOR_MASTER")<=59)
{//
			StartNewModule("ebo_m41aa", "K_EBN_RAMP_ENTRANCE", "", "", "", "", "", "");
}
else{
      StartNewModule("ebo_m12aa", "K_EBN_RAMP_ENTRANCE", "", "", "", "", "", "");
}
		}
		else {
			BarkString(OBJECT_INVALID, 42402);
		}
	}
}

