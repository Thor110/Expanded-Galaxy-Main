// Prototypes
void sub1();
void sub1() {
	int int1;
	int int2;
	object object1;
	string string1;
	SetPartyLeader((-1));
	int1;
	while ((int1 <= 8)) {
		if (IsNPCPartyMember(int1)) {
			RemovePartyMember(int1);
		}
		(int1++);
	}
}
void main() {
	sub1();
}

