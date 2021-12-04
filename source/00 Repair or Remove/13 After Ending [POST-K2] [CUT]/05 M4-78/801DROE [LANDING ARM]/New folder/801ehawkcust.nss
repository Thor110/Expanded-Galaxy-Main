void main() {
  if(GetEnteringObject() != GetFirstPC()) {
          return;
   }

  if(GetGlobalNumber("000_T3_worked") == 1) {
     BarkString(OBJECT_INVALID, 136058, 0xFFFFFFFF, 0xFFFFFFFF);
  } else {
     StartNewModule("003EBO");
  }
}