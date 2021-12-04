void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 2000:
			ActionWait(2.0);
			ActionResumeConversation();
			break;
	}
}

