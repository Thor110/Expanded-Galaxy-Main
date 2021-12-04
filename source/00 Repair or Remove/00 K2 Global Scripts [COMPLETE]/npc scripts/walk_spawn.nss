//:: k_def_spawn01
/*
    v2.0
    Default On Spawn In
*/
//:: Created By: Preston Watamaniuk
//:: Modified By: Anthony Davis
//:: Added treasure: Kevin Saunders
#include "k_inc_generic"
#include "k_inc_debug"
#include "k_inc_treas_k2"

void main()
{
    GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
    GN_SetListeningPatterns();
    GN_WalkWayPoints();
}
