void main() {
  if(GetGlobalNumber("SLE_FIREBLOODS") == 2)
  {
    if (GetIsObjectValid(GetObjectByTag("rodian2", 0))) {
      DestroyObject(GetObjectByTag("rodian2", 0), 0.0, 0, 0.0, 0);
    }
    if (GetIsObjectValid(GetObjectByTag("rodian1", 0))) {
      DestroyObject(GetObjectByTag("rodian1", 0), 0.0, 0, 0.0, 0);
    }
    if (GetIsObjectValid(GetObjectByTag("rodian3", 0))) {
      DestroyObject(GetObjectByTag("rodian3", 0), 0.0, 0, 0.0, 0);
    }
    if (GetIsObjectValid(GetObjectByTag("rodian4", 0))) {
      DestroyObject(GetObjectByTag("rodian4", 0), 0.0, 0, 0.0, 0);
    }
  }
}