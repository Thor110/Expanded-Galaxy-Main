void MaintainFollow() {
    object oNPC = GetObjectByTag("Salvage", 0);
    object oPartyMember = GetPartyMemberByIndex(1);

    if (GetIsObjectValid(oNPC) && GetIsObjectValid(oPartyMember)) {
        AssignCommand(oNPC, ClearAllActions());
        float fSafeFollowDistance = 2.5;
        float fWarpDistance = 25.0;
        float fDistance = GetDistanceBetween(oNPC, oPartyMember);

        if (fDistance > fWarpDistance) {
            AssignCommand(oNPC, ActionJumpToObject(oPartyMember, TRUE));
        } else if (fDistance > fSafeFollowDistance) {
            AssignCommand(oNPC, ActionMoveToObject(oPartyMember, TRUE));
            DelayCommand(3.0, MaintainFollow());
            return;
        }
    }
    DelayCommand(1.0, MaintainFollow());
}

void RemoveNPCWhenClose() {
    object oNPC = GetObjectByTag("Salvage", 0);
    object oTrigger = GetObjectByTag("tr_czerka_escape", 0);

    if (GetIsObjectValid(oNPC) && GetIsObjectValid(oTrigger)) {
        AssignCommand(oNPC, ClearAllActions());
    }
}

void main() {
    MaintainFollow();
    RemoveNPCWhenClose();
}
