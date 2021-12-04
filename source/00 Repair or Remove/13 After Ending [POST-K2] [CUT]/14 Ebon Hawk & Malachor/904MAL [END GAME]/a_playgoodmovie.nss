void main() 
{
  SetGlobalNumber("LIGHT_OR_DARK", 1);
	SetGlobalFadeOut();
	SetFadeUntilScript();

	QueueMovie("MalMov11a", TRUE);
	QueueMovie("MalMov11b", TRUE);
	QueueMovie("MalMov12", TRUE);

  StartNewModule("003EBO");

	PlayMovieQueue(TRUE);
}