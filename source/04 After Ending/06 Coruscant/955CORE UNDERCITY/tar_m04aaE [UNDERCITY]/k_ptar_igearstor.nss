// Prototypes
void sub1();

void sub1() {
	ActionDoCommand(OpenStore(GetObjectByTag("igearstore", 0), GetPCSpeaker(), 0, 0));
	ActionDoCommand(ExecuteScript("k_ptar_igearretu", OBJECT_SELF, 0xFFFFFFFF));
}

void main() {
	DelayCommand(0.1, sub1());
}

