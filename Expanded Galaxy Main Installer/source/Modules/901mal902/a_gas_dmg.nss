void main() {
	if ((GetGlobalNumber("MalachorGas") != 1)) {
		effect efPoison = EffectPoison(6);
    if(GetEnteringObject() == GetFirstPC())
    {
      ApplyEffectToObject(2, efPoison, GetFirstPC(), 0.0);
    }
	}
}

