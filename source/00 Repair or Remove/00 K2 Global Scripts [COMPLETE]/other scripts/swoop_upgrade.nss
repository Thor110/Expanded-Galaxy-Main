#include "k_inc_debug"
#include "k_inc_utility"

int StartingConditional()
{
    if(GetGlobalBoolean("003_swoop"))
    {
        return TRUE;
    }
    return FALSE;
}

