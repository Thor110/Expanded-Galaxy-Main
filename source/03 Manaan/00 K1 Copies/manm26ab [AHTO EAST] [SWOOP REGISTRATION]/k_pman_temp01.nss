void main() {
	if ((GetGlobalBoolean("MAN_TEMP") == 0)) {
		SetGlobalBoolean("MAN_TEMP", 1);
	}
	else {
		SetGlobalBoolean("MAN_TEMP", 0);
	}
}

