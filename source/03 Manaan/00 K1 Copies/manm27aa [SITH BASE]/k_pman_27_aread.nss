void main() {
	switch (GetUserDefinedEventNumber()) {
		case 100:
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			DelayCommand(2.0, SetGlobalFadeIn(0.0, 2.0, 0.0, 0.0, 0.0));
			{
				int int2 = 1;
				object object1 = GetObjectByTag(("man27_seljed" + IntToString(int2)), 0);
				while ((GetIsObjectValid(object1) && (int2 < 4))) {
					DelayCommand(0.1, DestroyObject(object1, 0.0, 0, 0.0));
					(int2++);
				object1 = GetObjectByTag(("man27_seljed" + IntToString(int2)), 0);
				}
			}
	}
}

