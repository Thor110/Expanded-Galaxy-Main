void main(){
object oDarthSion = GetObjectByTag("DarthSion", 0);
AssignCommand(oDarthSion, ClearAllActions());
AssignCommand(GetFirstPC(), ClearAllActions());
AssignCommand(oDarthSion, ActionJumpToLocation(GetLocation(GetObjectByTag("wp_sion", 0))));
			AssignCommand(GetFirstPC(), ActionJumpToLocation(GetLocation(GetObjectByTag("wp_pc_sion", 0))));

}