void main() 
{
    int iClans = (GetGlobalNumber("000_Clans_Gath"));
    iClans = iClans + 1;
    SetGlobalNumber("000_Clans_Gath", iClans);
    SetGlobalBoolean("CLAN_YAVIN", TRUE);
}