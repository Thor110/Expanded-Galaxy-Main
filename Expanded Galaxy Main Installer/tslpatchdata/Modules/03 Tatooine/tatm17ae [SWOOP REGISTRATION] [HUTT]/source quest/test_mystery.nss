void main() 
{
    int iClans = (GetGlobalNumber("EBO_MYSTERY_BOX"));
    iClans = iClans + 5;
    SetGlobalNumber("EBO_MYSTERY_BOX", iClans);
}