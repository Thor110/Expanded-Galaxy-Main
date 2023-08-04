void main() {
	NoClicksFor(0.3);
	DelayCommand(0.1, AssignCommand(GetObjectByTag("Bastila", 0), ActionStartConversation(GetFirstPC(), "tar02_bastvision", 0, 0, 0, "", "", "", "", "", "")));
}

