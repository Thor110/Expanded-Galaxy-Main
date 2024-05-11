//:: k_inc_switch
/*
     A simple include defining all of the
     events in the game as constants.
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.

//DEFAULT AI EVENTS
int KOTOR_DEFAULT_EVENT_ON_HEARTBEAT           = 1001;
int KOTOR_DEFAULT_EVENT_ON_PERCEPTION          = 1002;
int KOTOR_DEFAULT_EVENT_ON_COMBAT_ROUND_END    = 1003;
int KOTOR_DEFAULT_EVENT_ON_DIALOGUE            = 1004;
int KOTOR_DEFAULT_EVENT_ON_ATTACKED            = 1005;
int KOTOR_DEFAULT_EVENT_ON_DAMAGE              = 1006;
int KOTOR_DEFAULT_EVENT_ON_DEATH               = 1007;
int KOTOR_DEFAULT_EVENT_ON_DISTURBED           = 1008;
int KOTOR_DEFAULT_EVENT_ON_BLOCKED             = 1009;
int KOTOR_DEFAULT_EVENT_ON_FORCE_AFFECTED      = 1010;
int KOTOR_DEFAULT_EVENT_ON_GLOBAL_DIALOGUE_END = 1011;
int KOTOR_DEFAULT_EVENT_ON_PATH_BLOCKED        = 1012;

//HENCHMEN AI EVENTS
int KOTOR_HENCH_EVENT_ON_HEARTBEAT           = 2001;
int KOTOR_HENCH_EVENT_ON_PERCEPTION          = 2002;
int KOTOR_HENCH_EVENT_ON_COMBAT_ROUND_END    = 2003;
int KOTOR_HENCH_EVENT_ON_DIALOGUE            = 2004;
int KOTOR_HENCH_EVENT_ON_ATTACKED            = 2005;
int KOTOR_HENCH_EVENT_ON_DAMAGE              = 2006;
int KOTOR_HENCH_EVENT_ON_DEATH               = 2007;
int KOTOR_HENCH_EVENT_ON_DISTURBED           = 2008;
int KOTOR_HENCH_EVENT_ON_BLOCKED             = 2009;
int KOTOR_HENCH_EVENT_ON_FORCE_AFFECTED      = 2010;
int KOTOR_HENCH_EVENT_ON_GLOBAL_DIALOGUE_END = 2011;
int KOTOR_HENCH_EVENT_ON_PATH_BLOCKED        = 2012;
int KOTOR_HENCH_EVENT_ON_ENTER_5m            = 2013;
int KOTOR_HENCH_EVENT_ON_EXIT_5m             = 2014;

//MISC AI EVENTS
int KOTOR_MISC_DETERMINE_COMBAT_ROUND                = 3001;
int KOTOR_MISC_DETERMINE_COMBAT_ROUND_ON_PC          = 3002;
int KOTOR_MISC_DETERMINE_COMBAT_ROUND_ON_INDEX_ZERO  = 3003;

// DJS-OEI 6/12/2004
// Miscellaneous KotOR2 events

// This user-defined event is sent to the Area when the player's
// created character has performed an action that is currently
// considered forbidden for combats in the area.
int KOTOR2_MISC_PC_COMBAT_FORFEIT                    = 4001;
