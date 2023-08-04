void main() {
	if (GetGlobalNumber("tar_misslook")) {
		DestroyObject(GetObjectByTag("rodian033", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("rodian034", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("zaalbar031", 0), 0.0, 0, 0.0);
		DestroyObject(GetObjectByTag("mission031", 0), 0.0, 0, 0.0);
	}
}

