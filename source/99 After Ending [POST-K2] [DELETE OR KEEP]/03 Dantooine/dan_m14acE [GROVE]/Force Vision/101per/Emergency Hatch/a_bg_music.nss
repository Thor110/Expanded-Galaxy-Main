//  a_bg_music
/*
    Stops and restarts background music
    iBGMusic    0 - Stop the Background Music
                1 - Play Background Music
    iDelay      Delay in seconds before the music starts or stops
    iResetTime  If not 0, this will restart the music after the specified number of seconds
*/
//  Created By:  Tony Evans 8/19/04

void main()
{
    int iBGMusic = GetScriptParameter(1);
    int iDelay = GetScriptParameter(2);
    int iResetTime = GetScriptParameter(3);

    object oArea = GetArea(OBJECT_SELF);
    float fDelay = IntToFloat(iDelay);
    float fResetTime = IntToFloat(iResetTime);

    if ( iBGMusic )
    {
        DelayCommand(fDelay, AurPostString("Playing Background Music", 5, 5, 5.0));
        DelayCommand(fDelay, MusicBackgroundPlay(oArea));
    }

    else
    {
        DelayCommand(fDelay, AurPostString("Stopping Background Music", 5, 5, 5.0));
        DelayCommand(fDelay, MusicBackgroundStop(oArea));
        if (!iResetTime == 0)
        {
            DelayCommand(fDelay + fResetTime, AurPostString("Playing Background Music", 5, 5, 5.0));
            DelayCommand(fDelay + fResetTime, MusicBackgroundPlay(oArea));
        }
    }
}
