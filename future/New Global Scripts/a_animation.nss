//Thor110 
//Party Member Animation
//
void main(){
  int nComp = GetScriptParameter(1);
  int nAnim = GetScriptParameter(2);
  int nSpeed = GetScriptParameter(3);
  int nDuration = GetScriptParameter(4);
  AssignCommand(GetPartyMemberByIndex(nComp),ActionPlayAnimation(nAnim, IntToFloat(nSpeed), IntToFloat(nDuration)));
}