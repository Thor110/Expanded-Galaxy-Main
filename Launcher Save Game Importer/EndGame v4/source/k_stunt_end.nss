void main() {
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	QueueMovie("55", 1);
	PlayMovieQueue(1);
  SetGlobalNumber("K_CURRENT_PLANET",0);
  SetGlobalNumber("K_KOTOR_MASTER",60);
  //CHECK K_KOTOR_MASTER before CREDITPLAY
	SetGlobalBoolean("CREDITPLAY", 1);
  //TRUE = DARK SIDE //FALSE = LIGHT SIDE
	StartNewModule("ebo_m12aa");
}

