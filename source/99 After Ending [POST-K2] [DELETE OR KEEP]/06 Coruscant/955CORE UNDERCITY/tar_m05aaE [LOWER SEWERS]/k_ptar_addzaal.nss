void main() {
	AddAvailableNPCByTemplate(8, "p_zaalbar");
	DelayCommand(0.5, ShowPartySelectionGUI("k_ptar_destzaal", 6, 0xFFFFFFFF));
	SetAreaUnescapable(0);
}

