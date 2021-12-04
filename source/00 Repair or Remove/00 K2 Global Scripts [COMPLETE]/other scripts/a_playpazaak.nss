//  a_playpazaak
/*
    PC plays pazaak with owner.

    nDeck       - Sets which deck in PazaakDecks.2DA the opponent is using.
    nWager      - Sets wager.
    nTutorial   - Play tutorial or not
    nDelay      - Delay in seconds before game begins
    sEndscript  - The script to run after the game

    (nDeck options from PazaakDecks.2da)
    0   PlayerDefault_NOTUSED
    1   TestAverage_ERASEME
    2   TestNightmare_ERASEME
    3   SuperDeck_ERASEME
    4   DoublesDeck_Testing
    5   FlipOneDeck_Testing
    6   FlipTwoDeck_Testing
    7   TieBreakerDecK_Testing
    8   ValueChangeDeck_Testing
    9   DeckFromHell_Testing
    10  Kotor2_Deck_VeryEasy
    11  Kotor2_Deck_Easy
    12  Kotor2_Deck_Average
    13  Kotor2_Deck_Hard
    14  Kotor2_Deck_VeryHard

*/
// Created  CFA 6/19/04
// Modified TDE 8/22/04

#include "k_inc_debug"

void main()
{
    string sEndScript = GetScriptStringParameter();
    int nDeck = GetScriptParameter( 1 );
    int nWager = GetScriptParameter( 2 );
    int nTutorial = GetScriptParameter( 3 );
    int nDelay = GetScriptParameter( 4 );

    DelayCommand(IntToFloat(nDelay), PlayPazaak( nDeck, sEndScript, nWager, nTutorial));
}
