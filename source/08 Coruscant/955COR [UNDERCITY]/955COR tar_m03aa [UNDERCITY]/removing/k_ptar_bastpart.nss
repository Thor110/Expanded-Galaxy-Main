void main() {
	AddAvailableNPCByTemplate(0, "p_bastilla");
	DestroyObject(OBJECT_SELF, 0.0, 0, 0.0);
	StartNewModule("tar_m02aa", "tar02_swplayerapt", "", "", "", "", "", "");
}

