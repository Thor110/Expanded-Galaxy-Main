void main() {
	CreateObject(1, "g_blkvulkgang008", GetLocation(GetObjectByTag("sp_thug4", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);
	CreateObject(64, "gas", GetLocation(GetObjectByTag("mn_cockpit", 0)), 0);

DelayCommand(1.0, AssignCommand(GetObjectByTag("Handmaiden"), ActionPlayAnimation(ANIMATION_LOOPING_CHOKE_WORKING)));
DelayCommand(1.0, AssignCommand(GetObjectByTag("BaoDur"), ActionPlayAnimation(ANIMATION_LOOPING_CHOKE_WORKING)));
DelayCommand(1.0, AssignCommand(GetObjectByTag("Disciple"), ActionPlayAnimation(ANIMATION_LOOPING_CHOKE_WORKING)));
DelayCommand(1.0, AssignCommand(GetObjectByTag("VisasMarr"), ActionPlayAnimation(ANIMATION_LOOPING_CHOKE_WORKING)));

DelayCommand(1.5, AssignCommand(GetObjectByTag("Handmaiden"), ClearAllActions()));
DelayCommand(1.5, AssignCommand(GetObjectByTag("BaoDur"), ClearAllActions()));
DelayCommand(1.5, AssignCommand(GetObjectByTag("Disciple"), ClearAllActions()));
DelayCommand(1.5, AssignCommand(GetObjectByTag("VisasMarr"), ClearAllActions()));

	DelayCommand(1.5, AssignCommand(GetObjectByTag("Handmaiden", 0), ActionPlayAnimation(26, 1.0, (-1.0))));
	DelayCommand(1.5, AssignCommand(GetObjectByTag("Disciple", 0), ActionPlayAnimation(26, 1.0, (-1.0))));
	DelayCommand(1.5, AssignCommand(GetObjectByTag("VisasMarr", 0), ActionPlayAnimation(26, 1.0, (-1.0))));
	DelayCommand(1.5, AssignCommand(GetObjectByTag("BaoDur", 0), ActionPlayAnimation(26, 1.0, (-1.0))));
	DelayCommand(1.5, SetGlobalFadeOut(1.5, 1.0, 0.0, 0.0, 0.0));
}
