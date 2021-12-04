// Prototypes
void sub1();

void sub1() {
	PlayRumblePattern(11);
	ApplyEffectToObject(0, EffectVisualEffect(6002, 0), GetFirstPC(), 0.0);
}

void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 2000:
			DelayCommand(1.0, sub1());
			break;
	}
}

