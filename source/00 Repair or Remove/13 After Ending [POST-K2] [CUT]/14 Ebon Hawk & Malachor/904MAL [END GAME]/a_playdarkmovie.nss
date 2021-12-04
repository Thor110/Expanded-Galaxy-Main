void main() 
{
  SetGlobalNumber("LIGHT_OR_DARK", 2);
	SetGlobalFadeOut();
	SetFadeUntilScript();

	QueueMovie("MalMov10", FALSE);
	QueueMovie("MalMov14", FALSE);

  StartNewModule("003EBO");
	PlayMovieQueue(FALSE);
}