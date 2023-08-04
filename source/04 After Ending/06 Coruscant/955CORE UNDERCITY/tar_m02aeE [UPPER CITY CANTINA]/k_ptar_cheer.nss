// Prototypes
void sub1();

void sub1() {
	object oTar_duel_crowd2 = GetObjectByTag("tar_duel_crowd2", 0);
	SoundObjectPlay(oTar_duel_crowd2);
	DelayCommand(5.0, SoundObjectStop(oTar_duel_crowd2));
}

void main() {
	sub1();
}

