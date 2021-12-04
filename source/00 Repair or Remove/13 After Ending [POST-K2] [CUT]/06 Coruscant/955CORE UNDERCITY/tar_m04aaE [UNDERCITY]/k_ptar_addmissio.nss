void main() {
	AddAvailableNPCByTemplate(6, "p_mission");
	if ((GetPartyMemberCount() > 1)) {
		DelayCommand(1.0, ShowPartySelectionGUI("k_ptar_desmis", 6, 2));
	}
	else {
		DelayCommand(1.0, ShowPartySelectionGUI("k_ptar_desmis", 6, 0xFFFFFFFF));
	}
}

