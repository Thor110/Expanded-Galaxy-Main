void main(){

  AssignCommand(OBJECT_SELF,
            SetFacingPoint(GetPosition(
            GetFirstPC())));

SetLockOrientationInDialog(OBJECT_SELF, 1);

}