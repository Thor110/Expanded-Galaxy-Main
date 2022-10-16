void main() {
	AddAvailableNPCByTemplate(1, "p_cand");
	DelayCommand(1.0, ShowPartySelectionGUI("", 0xFFFFFFFF, 0xFFFFFFFF));
	DelayCommand(1.5, DestroyObject(GetObjectByTag("canderous", 0), 0.0, 0, 0.0));
}

